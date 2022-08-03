<?php

Emergence\Slack\API::request('chat.postMessage', [
    'post' => [
        'channel' => Emergence\Slack\API::getChannelId('general'),
        'text' => ":waving: Welcome, <@{$_EVENT['user']['id']}>! When you get the chance, please reply to this message in a thread to introduce yourself and mention anything you're hoping to get out of your time with Code for Philly"
    ]
]);
