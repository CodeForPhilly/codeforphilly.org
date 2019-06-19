<?php

Git::$repositories['codeforphilly'] = [
    'remote' => 'git@github.com:CodeForPhilly/codeforphilly.org.git',
    'originBranch' => 'master',
    'workingBranch' => 'master',
    'trees' => [
        'data-exporters',
        'event-handlers',
        'html-templates',
        'newsletters',
        'php-classes',
        'php-config/Git.config.d',
        'php-config/Laddr.config.d',
        'site-root'
    ]
];