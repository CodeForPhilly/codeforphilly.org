<?php

$ProjectUpdate = $_EVENT['Record'];

if (
    !$ProjectUpdate->isNew
) {
    return;
}

$attachment = [
    'pretext' => ':tada: New project update!',
    'title' => $ProjectUpdate->getTitle(),
    'title_link' => Emergence\Util\Url::buildAbsolute($ProjectUpdate->getUrl()),
    'text' => $ProjectUpdate->Body,
    'author_name' => $ProjectUpdate->Creator->FullName,
    'author_link' => Emergence\Util\Url::buildAbsolute($ProjectUpdate->Creator->getUrl()),
    'author_icon' => Emergence\Util\Url::buildAbsolute($ProjectUpdate->Creator->getUrl('/thumbnail')),
    'mrkdwn_in' => ['text'],
    'color' => 'good',
    'fields' => []
];

Emergence\Slack\API::request('chat.postMessage', [
    'post' => [
        'channel' => Emergence\Slack\API::getChannelId('general'),
        'attachments' => json_encode([$attachment])
    ]
]);