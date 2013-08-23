<?php

class Task extends ActiveRecord
{
    
	static public $tableName = 'tasks';
	static public $singularNoun = 'task';
	static public $pluralNoun = 'tasks';
	
	static public $rootClass = __CLASS__;
	static public $defaultClass = __CLASS__;
	static public $subClass =  array(__CLASS__);
	
	static public $fields = array(
		"Title"
		,"Description" => array(
			"type" => "clob"
		)
		,"ProjectID" => array(
			"type" => "int"
			,"notnull" => false
		)
		,"MemberID" => array(
			"type" => "int"
			,"notnull" => false
		)
		
	);
	
	static public $relationships = array(
		'Comments' => array(
			'type' => 'context-children'
			,'class' => 'Comment'
			,'order' => array('ID' => 'DESC')
		)
        ,'Project' => array(
            'type' => 'one-one'
            ,'class' => 'Project'
            )
		,'Member' => array(
            'type' => 'one-one'
            ,'class' => 'ProjectMember'
            )
    );
     
	/*public function validate()
    {
       parent::validate();
       $this->_validator->validate(array(
       		'field' => 'dueDate'
       		,'validator' => 'date_ymd'
       		,'required' => true
       ));
       	return $this->finishValidation();
    }*/
}