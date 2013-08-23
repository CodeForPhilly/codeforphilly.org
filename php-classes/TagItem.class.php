<?php

class TagItem extends ActiveRecord
{

	static public $tableName = 'tag_items';
	static public $rootClass = __CLASS__;
	
	static public $fields = array(
		'ID' => null
		,'Class' => null
		,'ContextClass' => array(
			'type' => 'string'
			,'notnull' => false
		)
		,'ContextID' => array(
			'type' => 'integer'
			,'notnull' => false
		)
		,'TagID' => array(
			'type' => 'integer'
			,'index' => true
		)
	);
	
	static public $relationships = array(
		'Tag' => array(
			'type' => 'one-one'
			,'class' => 'Tag'
		)
	);

	static public $indexes = array(
		'TagItem' => array(
			'fields' => array('TagID','ContextClass','ContextID')
			,'unique' => true
		)
	);

	
	public function validate()
	{
		// call parent
		parent::validate();
		
		$this->_validator->validate(array(
			'field' => 'TagID'
			,'validator' => 'number'
		));
		
		$this->_validator->validate(array(
			'field' => 'ContextClass'
			,'validator' => 'className'
		));
		
		$this->_validator->validate(array(
			'field' => 'ContextID'
			,'validator' => 'number'
		));
				
		// save results
		$this->_isValid = $this->_isValid && !$this->_validator->hasErrors();
		if(!$this->_isValid)
		{
			$this->_validationErrors = array_merge($this->_validationErrors, $this->_validator->getErrors());	
		}


		return $this->_isValid;
	}
	
	public function save()
	{
		global $Session;
		
		if($Session->Person)
		{
			$this->Creator = $Session->Person;
		}
		
		return parent::save(true);
	}
	
	public function destroy()
	{
		return static::delete($this->ContextClass,$this->ContextID,$this->TagID);
	}
	
	static public function delete($ContextClass,$ContextID,$TagID)
	{
		DB::nonQuery('DELETE FROM `%s` WHERE `%s` = \'%s\' AND `%s` = %u AND `%s` = %u', array(
			static::$tableName
			,static::_cn('ContextClass')
			,$ContextClass
			,static::_cn('ContextID')
			,$ContextID
			,static::_cn('TagID')
			,$TagID
		));
		
		return DB::affectedRows() > 0;
	}
	
	static public function getTagsSummary($options = array())
	{
		$options = MICS::prepareOptions($options, array(
			'tagConditions' => array()
			,'itemConditions' => array()
			,'Class' => false
			,'classConditions' => array()
			,'overlayTag' => false
			,'order' => 'itemsCount DESC'
			,'excludeEmpty' => true
			,'limit' => false
		));
		
		// initialize conditions
		$options['tagConditions'] = Tag::mapConditions($options['tagConditions']);

		if(!empty($options['Class']))
		{
 			$options['classConditions'] = $options['Class']::mapConditions($options['classConditions']);
		}

		$options['itemConditions'] = TagItem::mapConditions($options['itemConditions']);

		// build query
		if(!empty($options['classConditions']))
		{
			$classSubquery = 'SELECT `%s` FROM `%s` WHERE (%s)';
			$classParams = array(
				$options['Class']::getColumnName('ID')
				,$options['Class']::$tableName
				,join(') AND (', $options['classConditions'])
			);
		}
		
		$itemsCountQuery = 'SELECT COUNT(*) FROM `%s` TagItem WHERE TagItem.`%s` = Tag.`%s` AND (%s)';
		$itemsCountParams = array(
			TagItem::$tableName
			,TagItem::getColumnName('TagID')
			,Tag::getColumnName('ID')
			,count($options['itemConditions']) ? join(') AND (', $options['itemConditions']) : '1'
		);
		
		if(!empty($options['overlayTag']))
		{
			if(!is_object($OverlayTag = $options['overlayTag']) && !$OverlayTag = Tag::getByHandle($options['overlayTag']))
			{
				throw new Excoption('Overlay tag not found');
			}
		
			$itemsCountQuery .= sprintf(
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
		
		if(isset($classSubquery))
		{
			$itemsCountQuery .= sprintf(
				' AND TagItem.`%s` = "%s" AND TagItem.`%s` IN (%s)'
				,TagItem::getColumnName('ContextClass')
				,$options['Class']::$rootClass
				,TagItem::getColumnName('ContextID')
				,DB::prepareQuery($classSubquery, $classParams)
			);
		}
		
		

		$tagSummaryQuery = 'SELECT Tag.*, (%s) AS itemsCount FROM `%s` Tag WHERE (%s)';
		$tagSummaryParams = array(
			DB::prepareQuery($itemsCountQuery, $itemsCountParams)
			,Tag::$tableName
			,count($options['tagConditions']) ? join(') AND (', $options['tagConditions']) : '1'
		);
		
		// exclude empty
		if($options['excludeEmpty'])
		{
			$tagSummaryQuery .= ' HAVING itemsCount > 0';
		}

		// add order options
		if($options['order'])
		{
			$tagSummaryQuery .= ' ORDER BY ' . join(',', static::_mapFieldOrder($options['order']));
		}
		
		// add limit options
		if($options['limit'])
		{
			$tagSummaryQuery .= sprintf(' LIMIT %u,%u', $options['offset'], $options['limit']);
		}

		// return indexed table or list
		if($options['indexField'])
		{
			return DB::table(Tag::getColumnName($options['indexField']), $tagSummaryQuery, $tagSummaryParams);
		}
		else
		{
			return DB::allRecords($tagSummaryQuery, $tagSummaryParams);
		}
	}


}