<?php

class Member extends User
{
	static public $singularNoun = 'member';
	static public $pluralNoun = 'members';
	
	static public $relationships = array(
		'OpenCheckin' => array(
			'type' => 'one-one'
			,'class' => 'MemberCheckin'
			,'local' => 'ID'
			,'foreign' => 'MemberID'
			,'conditions' => array(
				'OutTime IS NULL'
			)
		)
		,'LastCheckin' => array(
			'type' => 'one-one'
			,'class' => 'MemberCheckin'
			,'local' => 'ID'
			,'foreign' => 'MemberID'
			,'conditions' => array(
				'OutTime IS NOT NULL'
			)
			,'order' => array(
				'ID' => 'DESC'
			)
		)
		,'Checkins' => array(
			'type' => 'one-many'
			,'class' => 'MemberCheckin'
			,'foreign' => 'MemberID'
		)
	);
}