<?php

// add new user to a MailChimp list (see http://forum.laddr.us/t/mailchimp-integration/26)
\RemoteSystems\MailChimp::call('lists/subscribe', [
    'id' => '411e7bdbef',
    'email' => [
        'email' => $_EVENT['User']->Email
    ],
    'merge_vars' => [
        'FNAME' => $_EVENT['User']->FirstName,
        'LNAME' => $_EVENT['User']->LastName
    ],
    'double_optin' => false,
    'replace_interests' => false,
    'send_welcome' => false
]);
