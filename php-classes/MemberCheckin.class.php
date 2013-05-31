<?php

class MemberCheckin extends ActiveRecord
{
	// ActiveRecord configuration
	static public $tableName = 'member_checkins'; // the name of this model's table
	
	// controllers will use these values to figure out what templates to use
	static public $singularNoun = 'checkin'; // a singular noun for this model's object
	static public $pluralNoun = 'checkins'; // a plural noun for this model's object
	
	// gets combined with all the extended layers
	static public $fields = array(
		'MemberID' => 'uint'
		,'InTime' => 'timestamp'
		,'OutTime' => array(
			'type' => 'timestamp'
			,'notnull' => false
		)
		,'Location' => array(
			'notnull' => false	
		)
	);
	
	static public $relationships = array(
		'Member' => array(
			'type' => 'one-one'
			,'class' => 'Person'
		)
	);
	
	static public function getCurrentMembers()
	{
		return Member::getAllByQuery(
			'SELECT Member.* FROM `%s` Checkin JOIN `%s` Member ON Member.ID = Checkin.MemberID WHERE Checkin.OutTime IS NULL ORDER BY Checkin.ID DESC'
			,array(
				static::$tableName
				,Member::$tableName
			)
		);
	}
}