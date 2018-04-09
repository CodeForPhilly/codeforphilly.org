<?php

//$GLOBALS['Session']->requireAccountLevel('Staff');

$cacheKey = 'projects-activity';

if (!($responseData = Cache::fetch($cacheKey)) || !empty($_GET['refresh'])) {

    // loop through projects
    $oneMonthAgo = strtotime(empty($_GET['since']) ? '1 month ago' : $_GET['since']);
    $projectsActivity = [];
    $commitsByDate = [];

    foreach (Laddr\Project::getAll(['order' => ['ID' => 'DESC']]) AS $Project) {
        $projectActivity = [
            'Project' => $Project,
            'errors' => [],
            'commitsCount' => null,
            'messagesCount' => null
        ];

        if ($Project->DevelopersUrl && preg_match('#^https://github.com/(?<owner>[^/]+)/(?<repo>[^/]+)#', $Project->DevelopersUrl, $matches)) {
            $projectActivity['gitHubOwner'] = $matches['owner'];
            $projectActivity['gitHubRepo'] = $matches['repo'];

            $gitHubCommitsResponse = Emergence\GitHub\API::request("/repos/$projectActivity[gitHubOwner]/$projectActivity[gitHubRepo]/commits?since=".date('c', $oneMonthAgo));

            if (!empty($gitHubCommitsResponse['message'])) {
                $projectActivity['errors'][] = 'GitHub repo commits unavailable: '.$gitHubCommitsResponse['message'];
            } elseif (is_array($gitHubCommitsResponse)) {
                $projectActivity['commitsCount'] = count($gitHubCommitsResponse);
    #            $projectActivity['commits'] = $gitHubCommitsResponse;

                foreach ($gitHubCommitsResponse AS $commit) {
                    $commitsByDate[substr($commit['commit']['author']['date'], 0, 10)][$Project->Handle]++;
                }
            }
        }

        if ($Project->ChatChannel) {
            if ($projectActivity['slackChannelId'] = Emergence\Slack\API::getChannelId($Project->ChatChannel)) {
                $channelHistoryResponse = Emergence\Slack\API::request('channels.history', [
                    'get' => [
                        'channel' => $projectActivity['slackChannelId'],
                        'oldest' => $oneMonthAgo
                    ]
                ]);
                $projectActivity['messagesCount'] = count($channelHistoryResponse['messages']);
            } else {
                $projectActivity['errors'][] = "Slack channel $Project->ChatChannel does not exist";
            }
        }

        $projectsActivity[] = $projectActivity;
    }

    $responseData = [
        'data' => $projectsActivity,
        'commitsByDate' => $commitsByDate
    ];

    Cache::store($cacheKey, $responseData, 600);
}

RequestHandler::$userResponseModes = [
    'application/json' => 'json',
    'text/csv' => 'csv'
];

RequestHandler::respond('projectsActivity', $responseData);