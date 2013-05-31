<?php

Git::$repositories['CodeForPhilly'] = array(
	'remote' => 'git@github.com:CfABrigadePhiladelphia/codeforphilly.org.git'
	,'originBranch' => 'master'
	,'workingBranch' => 'master'
	,'localOnly' => true
	,'trees' => array(
		'html-templates'
		,'php-classes'
		,'php-config'
		,'site-root'
	)
);