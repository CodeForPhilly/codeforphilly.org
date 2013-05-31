<?php

class RequestsRequestHandler extends RecordsRequestHandler
{
	//RecordsRequestHandler configuration
	static public $recordClass = "Request";
	static public $accountLevelBrowse = false;
	static public $accountLevelWrite = 'User';
	static public function handleRecordRequest(ActiveRecord $Record, $action = false)
	{
	
		switch($action ? $action : $action = static::shiftPath())
		{
			case '':
			case false:
			{
				$className = static::$recordClass;
				
				return static::respond(static::getTemplateName($className::$singularNoun), array(
					'success' => true
					,'data' => $Record
				));
			}
				
			
			case 'edit':
			{
				return static::handleEditRequest($Record);
			}
			
			case 'delete':
			{
				return static::handleDeleteRequest($Record);
			}
			case 'comment':
			{
				return static::handleCommentRequest($Record);
			}
			default:
			{
				return static::onRecordRequestNotHandled($Record, $action);
			}
			
		}
	}
	
	
	static public function handleCommentRequest($Request)
	{
		static::shiftPath();
		if($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			$Comment = new Comment();
			
			$Comment->ContextClass = $Request->Class;
			$Comment->ContextID = $Request->ID;
			$Comment->Message = $_REQUEST['Message'];
			$Comment->AuthorID = $GLOBALS['Session']->PersonID;
			$Comment->Authored = time;
			
			$Comment->save();
			
			return static::respond('requests/request', array(
				'data' => $Request
			));
		}
	}
	
	static public function handleCreateRequestRequest(Project $Project = null)
	{
		$Request = Request::create(
			array(
				$Request->MemberID = $_SESSION['User']->ID
			)		
		);
			
		if ($Project)
		{
			$Request->ProjectID = $Project->ID;
		}
		
		return static::handleCreateRequest($Request);
	}
}