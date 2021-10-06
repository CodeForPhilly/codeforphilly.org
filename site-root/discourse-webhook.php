<?php

/**
 * TODO: create an emergence-discourse repo, move the Discourse connector there,
 * merge this into the connector class and have it publish events
 *
 * Also, this was built against the discourse webhook plugin. Discourse has webhooks
 * built in now that may be slightly different and include signature validation. We
 * should switch to using that and drop the plugin
 */

// settings
$discourseHost = Emergence\Connectors\Discourse::$host;


// only handle post_created for now
$eventName = array_shift(Site::$pathStack);
if ($eventName != 'post_created') {
    die('Ignoring request, only handling /post_created');
}


// decode webhook payload
list($post, $topic, $user) = json_decode(file_get_contents('php://input'), true);


// log to tmp file
file_put_contents('/tmp/last-discourse-webhook-payload', var_export([
    '$post' => $post,
    '$topic' => $topic,
    '$user' => $user
], true));


// skip empty events that seem to get fired when topics get edited:
if (empty($topic['title'])) {
    die('Ignoring request, no topic title');
}


// skip private messages
if ($topic['archetype'] == 'private_message') {
    die('Ignoring request, private message');
}


// compose message for Slack
$messageText = "New topic on $discourseHost";

#// This doesn't work because the category is a number... we'll need to map them on our own to category names or slack rooms
#if (!empty($topic['category'])) {
#    $messageText .= " in $topic[category]";
#}

$messageText .= ": <http://$discourseHost/t/$post[topic_id]|$topic[title]>";
$messageText .= "\n\n> " . str_replace("\n", "\n> ", $post['raw']);

#// post full event payload to Slack
#$messageText .= "\n\n\n" . json_encode(['post' => $post, 'topic' => $topic, 'user' => $user], JSON_PRETTY_PRINT);


// post to slack
$response = Emergence\Slack\API::request('chat.postMessage', [
    'post' => [
        'channel' => Emergence\Slack\API::getChannelId('general'),
        'username' => "$user[username]@$discourseHost",
        'icon_url' => str_replace('{size}', 100, "http://$discourseHost/$user[avatar_template]"),
        'text' => $messageText,
    ]
]);


// write slack response to output
print_r($response);
