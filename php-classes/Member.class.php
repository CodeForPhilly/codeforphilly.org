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
        ,'Tags' => array(
        	'type' => 'many-many'
        	,'class' => 'Tag'
        	,'linkClass' => 'TagItem'
        	,'linkLocal' => 'ContextID'
        	,'conditions' => array('Link.ContextClass = "Person"')
        )
		,'Comments' => array(
			'type' => 'context-children'
			,'class' => 'Comment'
			,'contextClass' => __CLASS__
			,'order' => array('ID' => 'DESC')
		)
	);
}