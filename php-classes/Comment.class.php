<?php

class Comment extends VersionedRecord
{
	static public $anonymousClass = 'AnonymousComment';

	// VersionedRecord configuration
	static public $historyTable = 'history_comments';

	// support subclassing
	static public $rootClass = __CLASS__;
	static public $defaultClass = __CLASS__;
	static public $subClasses = array(__CLASS__);

	// ActiveRecord configuration
	static public $tableName = 'comments';
	static public $singularNoun = 'comment';
	static public $pluralNoun = 'comments';
	
	// configurable
	static public $siteName = 'MICS powered site';
	static public $siteAddress = '';
    
	
	static public $fields = array(
		'ContextClass' => array(
			'type' => 'enum'
			,'values' => array()
		)
		,'ContextID' => array(
			'type' => 'integer'
			,'unsigned' => true
		)
		,'Message' => 'clob'
		,'Authored' => array(
			'type' => 'timestamp'
		)
		,'AuthorID' => array(
			'type' => 'integer'
			,'unsigned' => true
		)
	);
	
	static public $relationships = array(
		'Author' => array(
			'type' => 'one-one'
			,'class' => 'User'
		)
		,'Context' => array(
			'type' => 'context-parent'
		)
	);
	
	
	public function getValue($name)
	{
		switch($name)
		{
			case 'userCanWrite':
			{
				return $_SESSION['User'] && ($_SESSION['User']->hasAccountLevel('Staff') || ($_SESSION['User']->ID == $this->CreatorID));
			}
			
			default: return parent::getValue($name);
		}
	}
	
	public function getData($deep = true)
	{
		$data = parent::getData();
		
		$data['realTime'] = date('c', $this->Created);
		$data['fuzzyTime'] = Format::fuzzyTime($this->Created);					
		$data['Author'] = $this->Author ? $this->Author->getData() : null;
		
		if($deep)
		{
			$data['ReplyTo'] = $this->ReplyTo ? $this->ReplyTo->getData(false) : null;
		}
		
		return $data;
	}

	public function validate()
	{
		// call parent
		//MICS::dump($this->Message);
		parent::validate();
		
		$this->_validator->validate(array(
			'field' => 'Message'
			,'validator' => 'string_multiline'
			,'errorMessage' => 'You must provide a message'
		));
		
		// check handle uniqueness
		if($this->isDirty && !$this->_validator->hasErrors('Handle') && $this->Handle)
		{
			$ExistingRecord = static::getByHandle($this->Handle);
			
			if($ExistingRecord && ($ExistingRecord->ID != $this->ID))
			{
				$this->_validator->addError('Handle', 'URL already registered');
			}
		}
		
		// save results
		return $this->finishValidation();
	}
	
	public function save($authorID = null){
		// set author
		if(!$this->AuthorID)
		{
			if(!$authorID)
			{
				$this->Author = $GLOBALS['Session']->Person;
			}
			else
			{
				$this->Author = Person::getById($authorID);
			}
		}
				
		parent::save();
	}
	
	public function emailNotifications()
	{
		//email context author
		$Context = $this->Context;

		$header = 'Reply-To: comments+' . $Context->Handle . '@' . Comment::$siteAddress . "\r\n";

		$dateCreated = date('n/j g:ia', $this->Created);

		if($this->Author->ID != $Context->Author->ID)
		{
			$body = $this->Author->FullName . " commented on your status update: <br/>"
					. "<p>" . $Context->Message . "</p><br/>"
					. $dateCreated . "<strong> " . $this->Author->FirstName . "</strong>: \"" . $this->Message . "\"" . "<br/>"
                    . "<p>You may reply to this comment by replying to this email.</p><br/>";

			$subject = Comment::$siteName . ' - ' . $this->Author->FullName . " commented on your status update" ;

			Email::send($Context->Author->Email, $subject, $body, Comment::$siteName . ".com <hello@" . Comment::$siteAddress . '>', $header);
		}



		// email Authors of prev comments
		$Comments = Comment::getAllByContext($Context->Class, $this->ContextID);
		$thisAuthors = array($this->Author->Email, $Context->Author->Email);
		$to = array();
		foreach($Comments as $c){
			if(!in_array($c->Author->Email, $thisAuthors))
			{
				// TODO something like: only send email if $c->Author->Settings->Notifications == 'all'
				$to[] = $c->Author->Email;
				$thisAuthors[] = $c->Author->Email;
			}
		}
		if($this->Author->ID == $Context->Author->ID)
		{
			if(!$this->Author->Gender)
				$possessive = 'their';
			elseif($this->Author->Gender == 'Male')
				$possessive =  'his';
			elseif($this->Author->Gender == 'Female')
				$possessive = 'her';

		}
		else
		{
			$possessive = $Context->Author->FullNamePossessive;
		}
		$subject = Comment::$siteName . ' - ' . $this->Author->FullName . " also commented on " . $possessive . ' status update';
		$body = $this->Author->FullName . " also commented on " . $possessive . ' status update:'
				. "<br/><p>\"" . $Context->Message . "\"</p><br/>"
				. "<br/>" . $dateCreated . " " . $this->Author->FirstName . ":" . " \"" . $this->Message . "\"" ;

		if($to){
			// add bcc for other recipients
			$header .= 'Bcc: ';

			foreach($to as $key=>$address)
			{
				if($key > 0)
				{
					$header .= $address;
					if($key != (count($to) - 1))
						$header .= ", ";
					else
						$header .= "\r\n";
				}
			}
			//MICS::dump($this->$to);
			Email::send($to[0], $subject, $body, Comment::$siteName . " <hello@" . Comment::$siteAddress . '>', $header);
		}
	}

}