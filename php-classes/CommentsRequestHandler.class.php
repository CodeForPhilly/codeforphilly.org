<?php

class CommentsRequestHandler extends RecordsRequestHandler
{
	// RecordsRequestHandler configuration
	static public $recordClass = 'Comment';
	static public $accountLevelRead = false;
	static public $accountLevelBrowse = false;
	static public $accountLevelWrite = 'User';
	static public $browseOrder = array('ID' => 'DESC');
    
    static public $sendEmailNotifications = true;

	static public function handleRequest()
	{
	
		// handle JSON requests
		switch(static::peekPath())
		{
			case 'json':
			case 'rss':
			{
				static::$responseMode = static::shiftPath();
				break;
			}
		}
		
		
		
		// route request
		switch($commentID = static::shiftPath())
		{
			case 'create':
			{
				return static::handleCreateRequest();
			}

			case '':
			case false:
			{
				return static::handleBrowseRequest();
			}

			default:
			{
				// lookup comment by ID
				if(!$Comment = Comment::getByID($commentID))
				{
					return static::throwNotFoundError();
				}
				
				return static::handleCommentRequest($Comment);
			}
		}
	
	}
	
	
	
	static public function handleBrowseRequest($options = array(), $conditions = array())
	{
		// accept conditions to limit results
		if(!empty($_REQUEST['q']))
		{
			$conditions[] = sprintf('MATCH (Message) AGAINST ("%s")', DB::escape($_REQUEST['q']));
		}
		
		if(!isset($options['limit']))
		{
			$options['limit'] = static::$responseMode == 'html' ? 15 : false;
		}
		
		return parent::handleBrowseRequest($options, $conditions);
	}
	
	static public function handleCreateRequest(ActiveRecord $Context = null)
	{
		//$GLOBALS['Session']->requireAuthentication();
	
		// enable anonymous comment
		if(Comment::$anonymousClass && in_array(Comment::$anonymousClass, Comment::$subClasses))
		{
			$Comment = new Comment::$anonymousClass();
			static::$accountLevelWrite = false;
		}
		else
		{
			$Comment = new Comment::$defaultClass();
		}
		
		
		if(!empty($Context))
		{
			$Comment->Context = $Context;
		}
		
		return static::handleEditRequest($Comment);
	}


	static public function handleCommentRequest(Comment $Comment)
	{
		switch($action = static::shiftPath())
		{
			case 'edit':
			{
				return static::handleEditRequest($Comment);
			}
			
			case 'delete':
			{
				return static::handleDeleteRequest($Comment);
			}
			
			case '':
			case false:
			{
				return static::respond('comment', array(
					'data' => $Comment
				));
			}
			
			default:
			{
				return static::throwNotFoundError();
			}
		}
	
	}
	
	
	
	
	static public function handleEditRequest(Comment $Comment)
	{
		//$GLOBALS['Session']->requireAuthentication();
		
	
		if(!$Comment->isPhantom && !$Comment->userCanWrite)
		{
			return static::throwUnauthorizedError();
		}
	
		if($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			$Comment->Message = $_REQUEST['Message'];
			if(!empty($_REQUEST['ReplyToID']) && is_numeric($_REQUEST['ReplyToID']))
			{
				$Comment->ReplyToID = $_REQUEST['ReplyToID'];
			}
			
			if($_REQUEST['Email'])
			{
				$CorrectEmail = ContactPoint::getByWhere(array('Class' => 'EmailContactPoint', 'Data' => serialize($_REQUEST['Email'])));

			
			//MICS::dump($CorrectEmail->Person->Class);
			
				if($CorrectEmail)
				{
					if($CorrectEmail->Person && $CorrectEmail->Person->Class != 'Person' && $CorrectEmail->Person->Class != 'Disabled')
					{
						return static::throwError('Must be logged to comment with that email');
					}
					
					if($CorrectEmail->Person && $CorrectEmail->Person->Class == 'Person')
					{
						$Comment->AuthorID = $CorrectEmail->PersonID;
					}
				}
				else
				{
					$Person = new Person();
					
					$Person->FirstName = $_REQUEST['FirstName'];
					$Person->LastName = $_REQUEST['LastName'];
					
					$Person->save();
									
					$ContactPoint = new ContactPoint();
					
					$ContactPoint->PersonID = $Person->ID;
					$ContactPoint->Class = 'EmailContactPoint';
					$ContactPoint->Data = $_REQUEST['Email'];
					$ContactPoint->Label = 'Email';

					$ContactPoint->save();
					
					$Person->PrimaryEmailID = $ContactPoint->ID;
					
					$Person->save();
									
					$Comment->AuthorID = $Person->ID;
				}
			
			}
			
			
			
			// validate
			if($Comment->validate())
			{
				// save session
				$Comment->save();
				
				$url = 'http://localhost:2000/comment';
		       	$ch = curl_init($url);
				curl_setopt($ch, CURLOPT_POST, true);
				//curl_setopt($ch, CURLOPT_PORT, 2000);
				curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json','Accept: application/json'));
				curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($Comment->getData()));
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
		
				$result = curl_exec($ch);
				$httpStatus = curl_getinfo($ch, CURLINFO_HTTP_CODE);
				
				// fire created response
				return static::respond('commentSaved', array(
					'success' => true
					,'data' => $Comment
				));
			}
			
			// fall through back to form if validation failed
		}
	
		return static::respond('commentEdit', array(
			'success' => false
			,'data' => $Comment
		));
	}

	static public function handleDeleteRequest(Comment $Comment)
	{
		$GLOBALS['Session']->requireAuthentication();
	
		if(!$Comment->userCanWrite)
		{
			return static::throwUnauthorizedError();
		}
	
		if($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			$Comment->destroy();

			// fire created response
			return static::respond('commentDeleted', array(
				'success' => true
				,'data' => $Comment
			));
		}
	
		return static::respond('confirm', array(
			'question' => 'Are you sure you want to delete this comment?'
			,'data' => $Comment
		));
	}
	
	
	static public function respond($responseID, $data = array())
	{
		if(static::$responseMode == 'rss')
		{
			static::$responseMode = 'xml';
			return parent::respond('rss', $data);
		}
		else
		{
			return parent::respond($responseID, $data);
		}
	}

    static protected function onRecordCreated(Comment $Comment)
    {
       //die('blargle');
        if(static::$sendEmailNotifications)
        {
            $Comment->emailNotifications();
        }
        
    }
    
    static protected function onBeforeRecordValidated(Comment $Comment, $data)
	{
		//MICS::dump($Comment);
	
	}
    

}