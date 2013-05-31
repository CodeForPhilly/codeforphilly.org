<?php

class ProjectUpdatesRequestHandler extends RecordsRequestHandler
{
	static public $recordClass = 'ProjectUpdate';
	static public $accountLevelBrowse = false;
	static public $accountLevelWrite = 'User'; // TODO: implement custom write checker that authenticats only project members
	static public $browseOrder = array('ID' => 'DESC');

}