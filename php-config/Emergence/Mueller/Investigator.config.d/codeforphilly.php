<?php

namespace Emergence\Mueller;

use Emergence\People\IUser;

Investigator::$tests['has-local-location'] = [
    'points' => 500,
    'function' => function (IUser $User, array &$userCache) {
        if (!$User->Location) {
            return false;
        }

        $location = strtolower($User->Location);

        return (
            strpos($location, 'philly') !== false
            || strpos($location, 'phila') !== false
            || strpos($location, 'fishtown') !== false
            || strpos($location, 'delaware') !== false
            || strpos($location, 'west chester') !== false
            || strpos($location, 'drexel') !== false
            || strpos($location, 'temple') !== false
            || strpos($location, 'penn') !== false
            || strpos($location, 'fairmount') !== false
            || strpos($location, 'passyunk') !== false
            || strpos($location, 'center city') !== false
            || strpos($location, 'university city') !== false
            || strpos($location, 'ucity') !== false
            || strpos($location, 'new jersey') !== false
            || strpos($location, 'south jersey') !== false
            || strpos($location, 'swarthmore') !== false
            || strpos($location, 'old city') !== false
            || strpos($location, 'olde city') !== false
            || strpos($location, 'northern liberties') !== false
            || strpos($location, 'nolibs') !== false
            || strpos($location, 'kingsessing') !== false
            || strpos($location, 'kensington') !== false
            || strpos($location, 'port richmond') !== false
            || strpos($location, 'rittenhouse') !== false
            || strpos($location, 'lansdale') !== false
            || strpos($location, 'graduate hospital') !== false
            || strpos($location, 'newtown square') !== false
            || strpos($location, 'roxborough') !== false
            || strpos($location, 'manayunk') !== false
            || strpos($location, 'conshohocken') !== false
            || strpos($location, 'cherry hill') !== false
            || strpos($location, 'phoenixville') !== false
            || strpos($location, 'brewerytown') !== false
            || strpos($location, 'mt. airy') !== false
            || strpos($location, 'mt airy') !== false
            || strpos($location, 'narberth') !== false
            || strpos($location, 'haverford') !== false
            || strpos($location, 'maple shade') !== false
            || strpos($location, 'voorhees') !== false
            || strpos($location, ', pa') !== false
            || preg_match('/191\d\d/', $location)
        );
    }
];
