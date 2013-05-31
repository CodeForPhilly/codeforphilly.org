<?php

class ProjectUpdate extends VersionedRecord
{
	// VersionedRecord configuration
	static public $historyTable = 'history_project_updates'; // the name of this model's history table
	
	// ActiveRecord configuration
	static public $tableName = 'project_updates'; // the name of this model's table
	
	// controllers will use these values to figure out what templates to use
	static public $singularNoun = 'project update'; // a singular noun for this model's object
	static public $pluralNoun = 'project updates'; // a plural noun for this model's object
	
	// gets combined with all the extended layers
	static public $fields = array(
		'ProjectID' => array(
			'type' => 'uint'
			,'index' => true
		)
		,'Number' => 'uint'
		,'Body' => 'clob'
	);
	
	static public $relationships = array(
		'Project' => array(
			'type' => 'one-one'
			,'class' => 'Project'
		)
	);
	
	public function validate()
	{
		parent::validate();
		
		$this->_validator->validate(array(
			'field' => 'Body'
			,'errorMessage' => 'Update body is required'
		));
		
		return $this->finishValidation();
	}
}