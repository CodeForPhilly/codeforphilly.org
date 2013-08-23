<?php

class MembersRequestHandler extends PeopleRequestHandler
{
	static public $recordClass = 'Member';
	static public $accountLevelBrowse = false;
	static public $browseOrder = array('ID' => 'DESC');
	
	static public function handleBrowseRequest($options = array(), $conditions = array(), $responseID = null, $responseData = array())
	{
		// apply tag filter
		if(!empty($_REQUEST['tag']))
		{
			// get tag
			if(!$Tag = Tag::getByHandle($_REQUEST['tag']))
			{
				return static::throwNotFoundError('Tag not found');
			}
			
			$conditions[] = 'ID IN (SELECT ContextID FROM tag_items WHERE TagID = '.$Tag->ID.' AND ContextClass = "Person")';
		}
		
		return parent::handleBrowseRequest($options, $conditions, $responseID, $responseData);
	}
	
	static public function handleRecordRequest(Member $Member, $action = false)
	{
		switch($action ? $action : $action = static::shiftPath())
		{
			case 'comment':
			{
				return static::handleCommentRequest($Member);
			}
		
			default:
			{
				return parent::handleRecordRequest($Member, $action);
			}
		}
	}
	
	static public function handleCommentRequest($Member)
	{
		if($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			$Comment = new Comment();
			
			$Comment->ContextClass = $Member->Class;
			$Comment->ContextID = $Member->ID;
			$Comment->Message = $_REQUEST['Message'];
			$Comment->AuthorID = $GLOBALS['Session']->PersonID;
			$Comment->Authored = time;
			
			$Comment->save();
			
			return static::respond('members/member', array(
				'data' => $Member
			));
		}
	}
}