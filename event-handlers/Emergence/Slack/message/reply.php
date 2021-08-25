<?php

#if (!empty($_EVENT['subtype']) && $_EVENT['subtype'] == 'bot_message') {
#    return;
#}
#
#Emergence\Slack\API::request('chat.postMessage', [
#    'post' => [
#        'channel' => Emergence\Slack\API::getChannelId('bot-debug'),//$_EVENT['channel'],
#        'text' => "Hello <@{$_EVENT['user']}>!\n\n```\n".var_export($_EVENT, true)."\n```",
##        'icon_url' => 'http://'.Site::getConfig('primary_hostname').'/img/logo.png',
#        'username' => Site::$title
#    ]
#]);