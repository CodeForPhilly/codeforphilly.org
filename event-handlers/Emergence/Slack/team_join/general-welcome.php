<?php

Emergence\Slack\API::request('chat.postMessage', [
    'post' => [
        'channel' => Emergence\Slack\API::getChannelId('general'),
        'text' => ":waving: Welcome, <@{$_EVENT['user']['id']}>! What are you hoping to get out of your time with Code for Philly?"
    ]
]);