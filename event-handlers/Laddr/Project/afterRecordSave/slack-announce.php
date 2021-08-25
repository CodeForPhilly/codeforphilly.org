<?php

$Project = $_EVENT['Record'];

if (!$Project->isNew) {
    return;
}

$attachment = [
    'pretext' => ':construction: A new project has been posted!',
    'title' => $Project->getTitle(),
    'title_link' => Emergence\Util\Url::buildAbsolute($Project->getUrl()),
    'text' => $Project->README,
    'author_name' => $Project->Creator->FullName,
    'author_link' => Emergence\Util\Url::buildAbsolute($Project->Creator->getUrl()),
    'author_icon' => Emergence\Util\Url::buildAbsolute($Project->Creator->getUrl('/thumbnail')),
    'mrkdwn_in' => ['text'],
    'color' => 'good',
    'fields' => []
];

if ($Project->DevelopersUrl) {
    $attachment['fields'][] = [
        'title' => 'Developers\' URL',
        'value' => $Project->DevelopersUrl
    ];
}

if ($Project->UsersUrl) {
    $attachment['fields'][] = [
        'title' => 'Users\' URL',
        'value' => $Project->UsersUrl
    ];
}

if ($Project->ChatChannel) {
    $channelId = Emergence\Slack\API::getChannelId($Project->ChatChannel);

    $attachment['fields'][] = [
        'title' => 'Chat Channel',
        'value' => $channelId ? sprintf('<#%s|%s>', $channelId, $Project->ChatChannel) : $Project->ChatChannel
    ];
}

Emergence\Slack\API::request('chat.postMessage', [
    'post' => [
        'channel' => Emergence\Slack\API::getChannelId('general'),
        'attachments' => json_encode([$attachment])
    ]
]);