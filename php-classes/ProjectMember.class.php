<?php

class ProjectMember extends ActiveRecord
{
	// ActiveRecord configuration
	static public $tableName = 'project_members'; // the name of this model's table
	
	// controllers will use these values to figure out what templates to use
	static public $singularNoun = 'project member'; // a singular noun for this model's object
	static public $pluralNoun = 'project members'; // a plural noun for this model's object
	
	// gets combined with all the extended layers
	static public $fields = array(
		'ProjectID' => 'uint'
		,'MemberID' => 'uint'
		,'Role' => array(
			'type' => 'string'
			,'notnull' => false
		)
	);
	
	static public $relationships = array(
		'Project' => array(
			'type' => 'one-one'
			,'class' => 'Project'
		)
		,'Member' => array(
			'type' => 'one-one'
			,'class' => 'Person'
		)
		,'Request' => array(
			'type' => 'one-many'
			,'class' => 'Request'
			)
	);
	
	static public $indexes = array(
		'ProjectMember' => array(
			'fields' => array('ProjectID', 'MemberID')
			,'unique' => true
		)
	);
}