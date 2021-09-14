<?php

if (!($topicId = array_shift(Site::$pathStack))) {
    RequestHandler::throwInvalidRequestError('topicId required');
}

$topicJson = @file_get_contents("http://forum.codeforphilly.org/t/$topicId.json");
if (!$topicJson) {
    RequestHandler::throwNotFoundError('Could not find or load requested topic');
}


$topic = json_decode($topicJson, true);

RequestHandler::respond('topic', $topic);
