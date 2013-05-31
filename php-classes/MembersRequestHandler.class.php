<?php

class MembersRequestHandler extends PeopleRequestHandler
{
	static public $recordClass = 'Member';
	static public $accountLevelBrowse = false;
	static public $browseOrder = array('ID' => 'DESC');
	
	
	static public function handleRecordsRequest($action = false)
	{
		switch($action ? $action : $action = static::shiftPath())
		{
			case '!checkout-all':
				return static::handleCheckoutAllRequest();
			default:
				return parent::handleRecordsRequest($action);
		}
	}
	
	static public function handleRecordRequest(Member $Member, $action = false)
	{
		switch($action ? $action : $action = static::shiftPath())
		{
			case 'checkin':
			{
				return static::handleCheckinRequest($Member);
			}
			
			case 'checkout':
			{
				return static::handleCheckoutRequest($Member);
			}
		
			default:
			{
				return parent::handleRecordRequest($Member, $action);
			}
		}
	}
	
	static public function handleCheckoutAllRequest()
	{
		$GLOBALS['Session']->requireAccountLevel('Staff');
		DB::nonQuery(
			'UPDATE `%s` SET OutTime = CURRENT_TIMESTAMP WHERE OutTime IS NULL'
			,MemberCheckin::$tableName
		);
		
		return static::respond('message', array(
			'message' => sprintf('Checked out %u members', DB::affectedRows())
		));
	}
	
	static public function handleCheckinRequest(Member $Member)
	{
		$GLOBALS['Session']->requireAuthentication();
		
		if($_SERVER['REQUEST_METHOD'] != 'POST') {
			return static::throwError('A checkin can only be performed via HTTP POST');
		}
		
		// check for existing open checkin
		$ExistingCheckin = MemberCheckin::getByWhere(array(
			'MemberID' => $Member->ID
			,'OutTime' => null
		));
		
		if($ExistingCheckin) {
			return static::throwError('This member has a checkin already open');
		}
		
		// create checkin
		$Checkin = MemberCheckin::create(array(
			'MemberID' => $Member->ID
			,'InTime' => time()
		), true);
		
		return static::respond('checked-in', array(
			'data' => $Checkin
			,'success' => true
		));
	}
	
	static public function handleCheckoutRequest(Member $Member)
	{
		$GLOBALS['Session']->requireAuthentication();
		
		if($_SERVER['REQUEST_METHOD'] != 'POST') {
			return static::throwError('A checkin can only be performed via HTTP POST');
		}
		
		// check for existing open checkin
		$Checkin = MemberCheckin::getByWhere(array(
			'MemberID' => $Member->ID
			,'OutTime' => null
		));
		
		if(!$Checkin) {
			return static::throwError('This member does not have a checkin open');
		}
		
		
		// checkout
		$Checkin->OutTime = time();
		$Checkin->save();
		
		return static::respond('checked-out', array(
			'data' => $Checkin
			,'success' => true
		));
	}

}