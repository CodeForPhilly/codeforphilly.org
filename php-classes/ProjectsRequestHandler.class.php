<?php

class ProjectsRequestHandler extends RecordsRequestHandler
{
	static public $recordClass = 'Project';
	static public $accountLevelBrowse = false;
	static public $accountLevelWrite = 'User';
	static public $browseOrder = array('ID' => 'DESC');

	static public function handleRecordRequest(Project $Project, $action = false)
	{
		switch($action ? $action : $action = static::shiftPath())
		{
			case 'add-member':
			{
				return static::handleAddMemberRequest($Project);
			}
			case 'create-request':
			{
				return RequestsRequestHandler::handleCreateRequestRequest($Project);
			}
			case 'remove-member':
			{
				return static::handleRemoveMemberRequest($Project);
			}
			
			case 'change-maintainer':
			{
				return static::handleChangeMaintainerRequest($Project);
			}
			
			case 'updates':
			{
				return static::handleUpdatesRequest($Project);
			}
			
			case 'comment': 
			{
				return static::handleCommentRequest($Project);
			}
			
			default:
			{
				return parent::handleRecordRequest($Project, $action);
			}
		}
	}
	
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
			
			$conditions[] = 'ID IN (SELECT ContextID FROM tag_items WHERE TagID = '.$Tag->ID.' AND ContextClass = "Project")';
		}
		
		return parent::handleBrowseRequest($options, $conditions, $responseID, $responseData);
	}
	
	static public function handleAddMemberRequest(Project $Project)
	{
		if(empty($_POST['username'])) {
			return static::throwError('Parameter "username" required');
		}
		
		if(!$Member = Member::getByUsername($_POST['username'])) {
			return static::throwError('User not found');
		}

		$recordData = array(
			'ProjectID' => $Project->ID
			,'MemberID' => $Member->ID
		);

		if(ProjectMember::getByWhere($recordData)) {
			return static::throwError('This member is already in this project');
		}

		$ProjectMember = ProjectMember::create($recordData);
		
		if(!empty($_POST['role'])) {
			$ProjectMember->Role = $_POST['role'];
		}
		
		$ProjectMember->save();
		
		return static::respond('memberAdded', array(
			'data' => $ProjectMember
			,'Project' => $Project
			,'Member' => $Member
		));
	}

	static public function handleRemoveMemberRequest(Project $Project)
	{
		if(empty($_REQUEST['username'])) {
			return static::throwError('Parameter "username" required');
		}
		
		if(!$Member = Member::getByUsername($_REQUEST['username'])) {
			return static::throwError('User not found');
		}

		if($_SERVER['REQUEST_METHOD'] != 'POST') {
			return static::respond('confirm', array(
				'question' => sprintf(
					'Are you sure you want to remove %s from %s?'
					,htmlspecialchars($Member->FullName)
					,htmlspecialchars($Project->Title)
				)
			));
		}
		
		$ProjectMember = ProjectMember::getByWhere(array(
			'ProjectID' => $Project->ID
			,'MemberID' => $Member->ID
		));

		if($ProjectMember) {
			$ProjectMember->destroy();
		}
		
		return static::respond('memberRemoved', array(
			'data' => $ProjectMember
			,'Project' => $Project
			,'Member' => $Member
		));
	}

	static public function handleChangeMaintainerRequest(Project $Project)
	{
		if(empty($_REQUEST['username'])) {
			return static::throwError('Parameter "username" required');
		}
		
		if(!$Project->Maintainer = Member::getByUsername($_REQUEST['username'])) {
			return static::throwError('User not found');
		}

		if($_SERVER['REQUEST_METHOD'] != 'POST') {
			return static::respond('confirm', array(
				'question' => sprintf(
					'Are you sure you want to make %s the maintainer of %s?'
					,htmlspecialchars($Project->Maintainer->FullName)
					,htmlspecialchars($Project->Title)
				)
			));
		}
		
		$Project->save();

		return static::respond('maintainerChanged', array(
			'data' => $Project
		));
	}
	
	static public function handleUpdatesRequest(Project $Project)
	{
		if($updateNumber = static::shiftPath()) {
			$Update = ProjectUpdate::getByWhere(array(
				'ProjectID' => $Project->ID
				,'Number' => $updateNumber
			));
			
			if(!$Update) {
				return static::throwNotFoundError('Update not found');
			}
			
			return static::respond('projectUpdate', array(
				'data' => $Update
			));
		}
		
		if($_SERVER['REQUEST_METHOD'] == 'POST') {
			if(empty($_POST['body'])) {
				return static::throwError('Update body cannot be blank');
			}
			
			$Update = ProjectUpdate::create(array(
				'Project' => $Project
				,'Number' => $Project->NextUpdate++
				,'Body' => $_POST['body']
			), true);
			
			return static::respond('projectUpdateCreated', array(
				'data' => $Update
			));
		}
		
		return static::respond('projectUpdates', array(
			'data' => $Project->Updates	
			,'Project' => $Project
		));
	}
	
	static public function handleCommentRequest($Project)
	{
		if($_SERVER['REQUEST_METHOD'] == 'POST')
		{
			$Comment = new Comment();
			
			$Comment->ContextClass = $Project->Class;
			$Comment->ContextID = $Project->ID;
			$Comment->Message = $_REQUEST['Message'];
			$Comment->AuthorID = $GLOBALS['Session']->PersonID;
			$Comment->Authored = time;
			
			$Comment->save();
			
			return static::respond('projects/project', array(
				'data' => $Project
			));
		}
	}

	static public function onRecordSaved(Project $Project, $requestData)
	{
		// assign tags
		if(isset($requestData['tags']))
		{
			Tag::setTags($Project, $requestData['tags']);
		}
	}
}