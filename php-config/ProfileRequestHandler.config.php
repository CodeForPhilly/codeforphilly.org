<?php

ProfileRequestHandler::$profileFields[] = 'Twitter';

ProfileRequestHandler::$onProfileSaved = function($User, $profileChanges, $requestData) {
	// assign tags
	if(isset($requestData['tags']))
	{
		Tag::setTags($User, $requestData['tags']);
	}
};