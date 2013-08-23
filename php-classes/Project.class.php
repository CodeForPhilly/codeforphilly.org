<?php

class Project extends VersionedRecord
{
	// VersionedRecord configuration
	static public $historyTable = 'history_projects'; // the name of this model's history table
	
	// ActiveRecord configuration
	static public $tableName = 'projects'; // the name of this model's table
	
	// controllers will use these values to figure out what templates to use
	static public $singularNoun = 'project'; // a singular noun for this model's object
	static public $pluralNoun = 'projects'; // a plural noun for this model's object
	
	// gets combined with all the extended layers
	static public $fields = array(
		'Title'
		,'Handle' => array(
			'type' => 'string'
			,'unique' => true
		)
		,'MaintainerID' => array(
			'type' => 'uint'
			,'notnull' => false
		)
		,'UsersUrl' => array(
			'type' => 'string'
			,'notnull' => false
		)
		,'DevelopersUrl' => array(
			'type' => 'string'
			,'notnull' => false
		)
		,'README' => array(
			'type' => 'clob'
			,'notnull' => false
		)
		,'NextUpdate' => array(
			'type' => 'uint'
			,'default' => 1
		)
	);
	
	static public $relationships = array(
		'Maintainer' => array(
			'type' => 'one-one'
			,'class' => 'Person'
		)
		,'Members' => array(
			'type' => 'many-many'
			,'class' => 'Member'
			,'linkClass' => 'ProjectMember'
			,'linkForeign' => 'MemberID'
			,'indexField' => 'ID'
		)
		,'Memberships' => array(
			'type' => 'one-many'
			,'class' => 'ProjectMember'
		)
		,'Updates' => array(
			'type' => 'one-many'
			,'class' => 'ProjectUpdate'
			,'order' => array('ID' => 'DESC')
		)
		,'Requests' => array(
            'type' => 'one-many'
            ,'class' => 'Request'
        )
        ,'Comments' => array(
			'type' => 'context-children'
			,'class' => 'Comment'
			,'order' => array('ID' => 'DESC')
		)
        ,'Tags' => array(
        	'type' => 'many-many'
        	,'class' => 'Tag'
        	,'linkClass' => 'TagItem'
        	,'linkLocal' => 'ContextID'
        	,'conditions' => array('Link.ContextClass = "Project"')
        )
	);
	
	static public function getByHandle($handle)
	{
		return static::getByField('Handle', $handle);
	}
	
	public function getValue($name)
	{
		switch($name) {
			case 'TitlePossessive':
				$title = $this->Title;
				
				if(substr($title, -1) == 's') {
					return $title . '\'';
				}
				else {
					return $title . '\'s';
				}
				
			default:
				return parent::getValue($name);
		}
	}
	
	public function save($deep = true)
	{
		HandleBehavior::onSave($this);
		
		if(!$this->Maintainer)
		{
			$this->Maintainer = $GLOBALS['Session']->Person;
		}
		
		parent::save($deep);
		
		if(!$this->Members)
		{
			ProjectMember::create(array(
				'ProjectID' => $this->ID
				,'MemberID' => $this->Maintainer->ID
				,'Role' => 'Founder'
			), true);
		}
	}
	
	public function validate()
	{
		parent::validate();
		
		HandleBehavior::onValidate($this, $this->_validator);
		
		return $this->finishValidation();
	}
	
	public function hasMember(Person $Person)
	{
		foreach($this->Members AS $Member) {
			if($Member->ID == $Person->ID) {
				return true;
			}
		}
		
		return false;
	}
}