<?php

class Tag extends ActiveRecord
{

	// support subclassing
	static public $rootClass = __CLASS__;
	static public $defaultClass = __CLASS__;
	static public $subClasses = array(__CLASS__);

	// configure ActiveRecord
	static public $tableName = 'tags';
	static public $singularNoun = 'tag';
	static public $pluralNoun = 'tags';
	
	static public $fields = array(
		'Class' => null
		,'Title'
		,'Handle' => array(
			'unique' => true
		)
		,'Description'
	);
	
	static public $relationships = array(
		'Creator' => array(
			'type' => 'one-one'
			,'local' => 'CreatorID'
			,'class' => 'Person'
		)
		,'Items' => array(
			'type' => 'one-many'
			,'class' => 'TagItem'
		)
	);

	
	// public methods
	static public function assignTags($contextClass, $contextID, $tags, $autoCreate = true)
	{
		$assignedTags = array();

		foreach($tags AS $tagTitle)
		{
			if(!$tagTitle)
			{
				continue;
			}
			
			if($Tag = static::getFromHandle($tagTitle, $autoCreate))
			{
				$Tag->assignItem($contextClass, $contextID);
				$assignedTags[] = $Tag;
			}
		}

		return $assignedTags;
	}

	static public function setTags($Context, $tags, $autoCreate = true)
	{
		$assignedTags = array();
		
		if(is_string($tags))
		{
			$tags = preg_split('/\s*[,]+\s*/', trim($tags));
		}

		foreach($tags AS $tagTitle)
		{
			if(!$tagTitle)
			{
				continue;
			}
			
			if($Tag = static::getFromHandle($tagTitle, $autoCreate))
			{
				$Tag->assignItem($Context, $Context->ID);
				$assignedTags[$Tag->ID] = $Tag;
			}
		}
		
		// delete tags
		DB::query(
			'DELETE FROM `%s` WHERE ContextClass = "%s" AND ContextID = %u AND TagID NOT IN (%s)'
			,array(
				TagItem::$tableName
				,$Context::getRootClass()
				,$Context->ID
				,count($assignedTags) ? join(',', array_keys($assignedTags)) : '0'
			)
		);

		return $assignedTags;
	}

	static public function getFromHandle($handle, $autoCreate = true)
	{
		$Tag = false;
	
		if(is_numeric($handle))
		{
			$Tag = Tag::getByID($handle);
		}
		
		if(!$Tag)
		{
			$Tag = Tag::getByHandle($handle);
		}
		
		if(!$Tag)
		{
			$Tag = Tag::getByTitle($handle);
		}
		
		if(!$Tag && $autoCreate)
		{
			$Tag = Tag::create(array('Title' => $handle), true);
		}
		
		return $Tag;
	}
	
	static public function getAllByPrefix($prefix)
	{
		return static::getAllByWhere('Handle LIKE "'.DB::escape($prefix).':%"');
	}
	
	
	static public function getByTitle($title)
	{
		return static::getByField('Title', $title, true);
	}
	
	static public function getByHandle($storeHandle)
	{
		return static::getByField('Handle', $storeHandle, true);
	}
	
	
	public function getValue($name)
	{
		switch($name)
		{
			case 'Prefix':
			{
				return preg_replace('/:.*$/', '', $this->Title);
			}
		
			case 'UnprefixedTitle':
			{
				return preg_replace('/^[^:]+:\s*/', '', $this->Title);
			}
		
			default:
			{
				return parent::getValue($name);
			}
		}
	}

	public function validate()
	{
		// call parent
		parent::validate();
		
		$this->_validator->validate(array(
			'field' => 'Title'
		));
		
		// check title uniqueness
		if($this->isDirty && !$this->_validator->hasErrors('Title') && $this->Title)
		{
			$ExistingTag = Tag::getByTitle($this->Title);
			
			if($ExistingTag && ($ExistingTag->ID != $this->ID))
			{
				$this->_validator->addError('Title', 'A tag by this title already exists');
			}
			
			// Existing handle
			$ExistingHandle = Tag::getByHandle($this->Handle);
			
			if($ExistingHandle && ($ExistingHandle->ID != $this->ID))
			{
				$this->_validator->addError('Handle', 'A tag by this handle already exists');
			}
		}
				
		// save results
		return $this->finishValidation();
	}
		
	public function save()
	{
		// set handle
		if(!$this->Handle)
			$this->Handle = strtolower(static::getUniqueHandle($this->Title));
		
		return parent::save(true);
	}
	
    public function destroy() {
    	
    	// delete all TagItems
    	DB::nonQuery("DELETE FROM `" . TagItem::$tableName . "` WHERE `TagID`='" . $this->ID ."'");
    	
    	return parent::destroy();
    }
	
	public function assignItem($contextClass, $contextID = false)
	{
		if(is_a($contextClass, 'ActiveRecord'))
		{
			$contextID = $contextClass->ID;
			$contextClass = $contextClass->getRootClass();
		}
	
		$tagData = array(
			'TagID' => $this->ID
			,'ContextClass' => $contextClass
			,'ContextID' => $contextID
		);
	
		try
		{
			return TagItem::create($tagData, true);
		}
		catch(DuplicateKeyException $e)
		{
			return TagItem::getByWhere($tagData);
		}
	}
	
	
	static public function getAll($options = array())
	{
		$options =  MICS::prepareOptions($options, array(
			'order' => array('Title' => 'ASC')
		));
		
		return parent::getAll($options);
	}
	
	
	public function getRandomItem($options)
	{
		return array_shift(static::getRandomItems(MICS::prepareOptions($options, array('limit' => 1))));
	}
	
	public function getRandomItems($options = array())
	{
		// apply defaults
		$options = MICS::prepareOptions($options, array(
			'contextClass' => false
			,'conditions' => false
			,'limit' => false
		));


		$where[] = sprintf('`%s` = %u', TagItem::getColumnName('TagID'), $this->ID);
				
		if($options['contextClass'])
		{
			$where[] = sprintf('`%s` = "%s"', TagItem::getColumnName('ContextClass'), $options['contextClass']);
		}
	
		return TagItem::instantiateRecords(DB::allRecords(
			'SELECT * FROM `%s` WHERE (%s) ORDER BY rand() %s'
			, array(
				TagItem::$tableName
				, join(') AND (', $where)
				, $options['limit'] ? sprintf('LIMIT %u', $options['limit']) : ''
			)
		));
	}
	
	
	public function getItems($options = array())
	{
	
	}
	
	public function getItemsByClass($class, $options = array())
	{
		// apply defaults
		$options = MICS::prepareOptions($options, array(
			'conditions' => false
			,'order' => false
			,'limit' => is_numeric($options) ? $options : false
			,'offset' => 0
			,'overlayTag' => false
		));

		// build TagItem query
		$tagWhere = array();
		$tagWhere[] = sprintf('`%s` = %u', TagItem::getColumnName('TagID'), $this->ID);
		$tagWhere[] = sprintf('`%s` = "%s"', TagItem::getColumnName('ContextClass'), DB::escape($class::$rootClass));
		
		$tagQuery = sprintf(
			'SELECT ContextID FROM `%s` TagItem WHERE (%s)'
			, TagItem::$tableName
			, count($tagWhere) ? join(') AND (', $tagWhere) : '1'
			, ($options['limit'] ? sprintf('LIMIT %u', $options['limit']) : '')
		);
	
		if(!empty($options['overlayTag']))
		{
			if(!is_object($OverlayTag = $options['overlayTag']) && !$OverlayTag = Tag::getByHandle($options['overlayTag']))
			{
				throw new Exception('Overlay tag not found');
			}
		
			$tagQuery .= sprintf(
				' AND (TagItem.`%s`,TagItem.`%s`) IN (SELECT OverlayTagItem.`%s`, OverlayTagItem.`%s` FROM `%s` OverlayTagItem WHERE OverlayTagItem.`%s` = %u)'
				,TagItem::getColumnName('ContextClass')
				,TagItem::getColumnName('ContextID')
				,TagItem::getColumnName('ContextClass')
				,TagItem::getColumnName('ContextID')
				,TagItem::$tableName
				,TagItem::getColumnName('TagID')
				,$OverlayTag->ID
			);
		}
	
		// built class table query
		if($options['conditions'])
		{
			if(!is_array($options['conditions']))
				$options['conditions'] = array($options['conditions']);
				
			$classWhere = $class::_mapConditions($options['conditions']);
		}
		else
		{
			$classWhere = array();
		}
		
		// return objects
		$classQuery = sprintf(
			'SELECT SQL_CALC_FOUND_ROWS * FROM `%s` WHERE (%s) AND `%s` IN (%s)'
			, $class::$tableName										// item's table name
			, count($classWhere) ? join(') AND (', $classWhere) : '1'	// optional where clause
			, $class::getColumnName('ID')								// item's id column name
			, $tagQuery													// tag_items query
		);
		

		if($options['order'])
		{
			$classQuery .= ' ORDER BY ' . join(',', $class::_mapFieldOrder($options['order']));
		}

		if($options['limit'])
		{
			$classQuery .= sprintf(' LIMIT %u,%u', $options['offset'], $options['limit']);
		}

		return $class::instantiateRecords(DB::allRecords($classQuery));
	}
	
	static public function getTagsString($tags)
	{
		return implode(', ', array_map(function($Tag) {
			return $Tag->Handle;
		}, $tags));
	}
}