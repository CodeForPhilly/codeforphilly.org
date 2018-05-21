<?php

#if (Site::$debug) {
#    file_put_contents(Site::$rootPath.'/site-data/slack.log', PHP_EOL.PHP_EOL.print_r([
#        'date' => date('Y-m-d H:i:s'),
#        '_EVENT' => $_EVENT
#    ], true), FILE_APPEND);
#}