<?php

/**
 * PRE-FLIGHT CHECKLIST
 *
 * - [ ] Subject updated
 * - [ ] Body updated to new template
 * - [ ] Test send to admins
 * - [ ] Verify all links
 * - [ ] Verify all images being server from codeforphilly.org with 2x resolution
 */

$GLOBALS['Session']->requireAccountLevel('Developer');

#if ($_SERVER['REQUEST_METHOD'] != 'POST') {
#    die('must be post');
#}

header('X-Accel-Buffering: no');
header('Content-Type: text/plain; charset=utf-8');
ob_end_flush();
set_time_limit(0);


// select newsletter
$newsletterDate = '2018-05-21';


// get body markup
if (!$mjmlNode = Site::resolvePath("newsletters/$newsletterDate/index.mjml")) {
    RequestHandler::throwNotFoundError('Newsletter markup not found');
}

$html = shell_exec('hab pkg exec jarvus/mjml mjml -r '.escapeshellarg($mjmlNode->RealPath));

$url = Emergence\Util\Url::buildAbsolute(['newsletters', $newsletterDate, '']);
$html = str_replace('[[SHORT_PERMALINK]]', $url, $html);


// get recipients
$Users = Emergence\People\User::getAllByWhere([
    'Newsletter' => true,
    'Email IS NOT NULL'

    // toggle to test:
    ,'Username' => [
        'values' => ['chris', 'a_priori_rainbows', 'rmcmillen50', 'Tonimacattack']
    ]
]);
printf("Found %u subscribed users\n\n", count($Users));


// send to each recipient
foreach ($Users as $i => $User) {
    printf("Sending #%u to %s\n", $i+1, $User->EmailRecipient);

#    Emergence\Mailer\Mailer::send(
#        $User->EmailRecipient,
##        '🔔 Open Data, Open Source, Open this email! 🔔',
##        '🚀 This weekend: Help a project lift off at our Civic Engagement Launchpad 🚀',
#        '🎉 Celebrate a successful launch: it’s time for demo night! 🎉',
#        $html,
#        'Code for Philly <hello@codeforphilly.org>'
#    );

    ob_flush();
    flush();
}


printf("\n\nDone\n");
