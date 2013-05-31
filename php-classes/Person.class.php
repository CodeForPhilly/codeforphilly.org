<?php

class Person extends VersionedRecord
{

	// support subclassing
	static public $rootClass = __CLASS__;
	static public $defaultClass = __CLASS__;
	static public $subClasses = array(__CLASS__);

	// VersionedRecord configuration
	static public $historyTable = 'history_people';

	// ActiveRecord configuration
	static public $tableName = 'people';
	static public $singularNoun = 'person';
	static public $pluralNoun = 'people';
	
	static public $fields = array(
		'ContextClass' => null
		,'ContextID' => null
		,'FirstName'
		,'LastName'
		,'Gender' => array(
			'type' => 'enum'
			,'values' => array('Male','Female')
			,'notnull' => false
		)
		,'BirthDate' => array(
			'type' => 'date'
			,'notnull' => false
		)
		,'Email' => array(
			'notnull' => false
			,'unique' => true
		)
		,'Phone' => array(
			'type' => 'decimal'
			,'length' => '10,0'
			,'unsigned' => true
			,'notnull' => false
		)
		,'Location' => array(
			'notnull' => false
		)
		,'About' => array(
			'type' => 'clob'
			,'notnull' => false
		)
		,'PrimaryPhotoID' => array(
			'type' => 'integer'
			,'unsigned' => true
			,'notnull' => false
		)
		,'Twitter' => array(
			'notnull' => true,
			'unique' => true
			)
	);
	
	static public $relationships = array(
		'GroupMemberships' => array(
			'type' => 'one-many'
			,'class' => 'GroupMembership'
			,'indexField' => 'GroupID'
			,'foreign' => 'PersonID'
		)
		,'Notes' => array(
			'type' => 'context-children'
			,'class' => 'Note'
			,'contextClass' => 'Person'
			,'order' => array('ID' => 'DESC')
		)
		,'PrimaryPhoto' => array(
			'type' => 'one-one'
			,'class' => 'PhotoMedia'
			,'local' => 'PrimaryPhotoID'
		)
		,'Photos' => array(
			'type' => 'context-children'
			,'class' => 'PhotoMedia'
			,'contextClass' => __CLASS__
		)
		,'Comments' => array(
			'type' => 'context-children'
			,'class' => 'Comment'
			,'contextClass' => __CLASS__
			,'order' => array('ID' => 'DESC')
		)	
	);

	// Person
	static public $requireEmail = false;
	static public $requireTwitter = false;
	static public $requirePhone = false;
	static public $requireGender = false;
	static public $requireBirthDate = false;
	static public $requireLocation = false;
	static public $requireAbout = false;
	
	
	public function getValue($name)
	{
		switch($name)
		{
			// name variations
			case 'FullName':
			{
				return $this->FirstName . ' ' . $this->LastName;
			}
			
			case 'FirstInitial':
			{
				return strtoupper(substr($this->FirstName, 0, 1));
			}
				
			case 'LastInitial':
			{
				return strtoupper(substr($this->LastName, 0, 1));
			}
			
			case 'FirstNamePossessive':
			{
				if(substr($this->FirstName, -1) == 's')
				{
					return $this->FirstName . '\'';
				}
				else
				{
					return $this->FirstName . '\'s';
				}
			}
			
			case 'FullNamePossessive':
			{
				$fullName = $this->FullName;
				
				if(substr($fullName, -1) == 's')
				{
					return $fullName . '\'';
				}
				else
				{
					return $fullName . '\'s';
				}
			}
			
			case 'EmailRecipient':
			{
				return sprintf('"%s" <%s>', $this->FullName, $this->Email);
			}
			
			default: return parent::getValue($name);
		}
	}
	
	
	static public function getByHandle($handle)
	{
		return User::getByHandle($handle);
	}
	
	static public function getByEmail($email)
	{
		return static::getByField('Email', $email);
	}
	
	static public function getByFullName($firstName, $lastName)
	{
		return static::getByWhere(array(
			'FirstName' => $firstName
			,'LastName' => $lastName
		));
	}
	
	static public function getOrCreateByFullName($firstName, $lastName, $save = false)
	{
		if($Person = static::getByFullName($firstName, $lastName))
			return $Person;
		else
			return static::create(array(
				'FirstName' => $firstName
				,'LastName' => $lastName
			), $save);
	}
	
	static public function parseFullName($fullName)
	{
		$parts = preg_split('/\s+/', trim($fullName), 2);
		
		if(count($parts) != 2)
		{
			throw new Exception('Full name must contain a first and last name separated by a space');
		}
		
		return array(
			'FirstName' => $parts[0]
			,'LastName' => $parts[1]
		);
	}
	
	public function validate()
	{
		// call parent
		parent::validate();
		
		// strip any non-digit characters from phone before validation
		if($this->Phone) {
			$this->Phone = preg_replace('/\D/', '', $this->Phone);
		}
		
		$this->_validator->validate(array(
			'field' => 'Class'
			,'validator' => 'selection'
			,'choices' => self::$subClasses
			,'required' => false
		));

		$this->_validator->validate(array(
			'field' => 'FirstName'
			,'minlength' => 2
			,'required' => true
			,'errorMessage' => 'First name is required'
		));
		
		$this->_validator->validate(array(
			'field' => 'LastName'
			,'minlength' => 2
			,'required' => true
			,'errorMessage' => 'Last name is required'
		));

		$this->_validator->validate(array(
			'field' => 'Email'
			,'validator' => 'email'
			,'required' => static::$requireEmail
		));
		
		$this->_validator->validate(array(
			'field' => 'Twitter'
			,'required' => false
			));
		// check handle uniqueness
		if($this->isDirty && !$this->_validator->hasErrors('Email') && $this->Email)
		{
			$ExistingUser = User::getByField('Email', $this->Email);
			
			if($ExistingUser && ($ExistingUser->ID != $this->ID))
			{
				$this->_validator->addError('Email', 'Email already registered to another account');
			}
		}

		$this->_validator->validate(array(
			'field' => 'Phone'
			,'validator' => 'phone'
			,'required' => static::$requirePhone
		));
		
		$this->_validator->validate(array(
			'field' => 'BirthDate'
			,'validator' => 'date_ymd'
			,'required' => static::$requireBirthDate
		));
		
		$this->_validator->validate(array(
			'field' => 'Gender'
			,'validator' => 'selection'
			,'required' => static::$requireGender
			,'choices' => self::$fields['Gender']['values']
		));


		// save results
		return $this->finishValidation();
	}


}