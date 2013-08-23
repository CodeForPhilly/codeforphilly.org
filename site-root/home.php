<?php


// compile home page data
$now = time() * 1000;
$pageData = array();


// meetups
	if (empty($_GET['use_snapshot'])) {
		$meetups = Meetup::getEvents();
	} else {
		$meetups = json_decode('{"results":[{"rsvpcount":"15","venue_name":"Devnuts","maybe_rsvpcount":"0","payment_required":"0","allow_maybe_rsvp":"0","rsvpable":"CLOSED","member_status":"member","time":"Wed Aug 21 17:00:00 EDT 2013","venue_zip":"19123","venue_visibility":"public","feedesc":"","updated":"Wed Aug 21 22:10:48 EDT 2013","venue_address1":"908 North 3rd Street","description":"<p><b>Special schedule<\/b>: We\'re holding the workshop on <b>Wednesday<\/b> this week to offer a break for all you Tuesday-haters. Also because Devnuts is hosting an <a href=\"http:\/\/www.meetup.com\/Philly-OpenStack-Meetup-Group\/events\/128222352\/\">OpenStack meetup<\/a> on Tuesday -- check it out and bring some OpenStack know-how back for the brigade\'s <a href=\"http:\/\/phl.io\">Philly Cloud<\/a> project!<\/p>\n<p>Stop by Devnuts any time between 5pm and 10pm to work on your civic technology project, to discover active projects, or to begin\/improve your coding skills through civic service. No memberships are required, just bring a laptop be ready to jump into something.<\/p>\n<p>See <a href=\"http:\/\/codeforphilly.org\/projects\">http:\/\/codeforphilly.org\/projects<\/a> for a full directory of members\' projects<\/p>\n<p><b>This Week<\/b><\/p>\n<p>Have something you\'d like to share with or present to the group? Tell us in the comments!<\/p>\n<p>Some currently active projects looking for a hand include:<\/p>\n<p>ï <a href=\"http:\/\/codeforphilly.org\/projects\/localwiki\">LocalWiki for Philly (Wikidelphia)<\/a><\/p>\n<p>ï <a href=\"http:\/\/codeforphilly.org\/projects\/Code_for_Philadelphia\">CodeForPhilly.org<\/a><\/p>\n<p>ï <a href=\"http:\/\/codeforphilly.org\/projects\/Apps_for_Philly\">AppsForPhilly.org<\/a><\/p>\n<p><b>Schedule<\/b><\/p>\n<p>5pm - desks open  <br \/>\n\n6pm - pizza followed by community announcements\/demos  <br \/>\n\n10pm - commit &amp; quit<\/p>","venue_address2":"","venue_address3":"","venue_id":"1512397","rsvp_closed":"0","photo_count":"","lon":"-75.1500015258789","no_rsvpcount":"5","status":"past","photo_url":"http:\/\/photos1.meetupstatic.com\/photos\/event\/2\/e\/6\/global_97500742.jpeg","group_id":"1768166","utc_rsvp_cutoff":"None","questions":[],"rsvp_cutoff":"None","short_link":"","attendee_count":"-1","fee":"0.0","venue_map":"http:\/\/maps.google.com\/staticmap?center=39.965282,-75.142570&zoom=14&size=512x512&maptype=mobile&markers=39.965282,-75.142570,blues&sensor=false","how_to_find_us":"","venue_lat":"39.965282","rsvp_open_time":"None","my_waitlist_status":"","organizer_id":"50367512","feelabel":"","myrsvp":"yes","id":"133750822","ismeetup":"1","venue_city":"Philadelphia","name":"Code for Philly Workshop #43 (Wednesday)","photo_album_id":"","lat":"39.959999084472656","venue_state":"PA","group_name":"Code for America Philly","rsvp_limit":"0","group_photo_url":"http:\/\/photos1.meetupstatic.com\/photos\/event\/2\/e\/6\/global_97500742.jpeg","guest_limit":"2","utc_time":"1377118800000","waiting_rsvpcount":"0","organizer_name":"","feecurrency":"USD","utc_rsvp_open_time":"None","event_hosts":[{"member_name":"Chris Alfano","member_id":14053930}],"venue_phone":"","venue_lon":"-75.142570","rating_count":0,"event_url":"http:\/\/www.meetup.com\/Code-for-America-Philly\/events\/133750822\/","rating":0},{"rsvpcount":"1","venue_name":"3rd Ward Philadelphia","maybe_rsvpcount":"0","payment_required":"0","allow_maybe_rsvp":"0","rsvpable":"OPEN","member_status":"member","time":"Tue Aug 27 17:00:00 EDT 2013","venue_zip":"19122","venue_visibility":"public","feedesc":"","updated":"Wed Aug 21 21:04:27 EDT 2013","venue_address1":"1227 N. 4th St","description":"<p><b>Special location<\/b>: Join us again at <a href=\"https:\/\/philly.3rdward.com\/\">3rd Ward Philadelphia<\/a> this week instead of our usual space at <a href=\"http:\/\/devnuts.com\/\">Devnuts<\/a>.<\/p>\n<p>Stop by any time between 5pm and 10pm to work on your civic technology project, to discover active projects, or to begin\/improve your coding skills through civic service. No memberships are required, just bring a laptop be ready to jump into something.<\/p>\n<p>See <a href=\"http:\/\/codeforphilly.org\/projects\">http:\/\/codeforphilly.org\/projects<\/a> for a full directory of members\' projects<\/p>\n<p> <br \/>\n\n<\/p>\n<p><b>This Week<\/b><\/p>\n<p>Have something you\'d like to share with or present to the group? Tell us in the comments!<\/p>\n<p>Some currently active projects looking for a hand include:<\/p>\n<p>ï <a href=\"http:\/\/codeforphilly.org\/projects\/localwiki\">LocalWiki for Philly (Wikidelphia)<\/a><\/p>\n<p>ï <a href=\"http:\/\/codeforphilly.org\/projects\/Code_for_Philadelphia\">CodeForPhilly.org<\/a><\/p>\n<p>ï <a href=\"http:\/\/codeforphilly.org\/projects\/Apps_for_Philly\">AppsForPhilly.org<\/a><\/p>\n<p> <br \/>\n\n<\/p>\n<p><b>Schedule<\/b><\/p>\n<p>5pm - desks open  <br \/>\n\n 6pm - pizza followed by community announcements\/demos  <br \/>\n\n 10pm - commit &amp; quit<\/p>","venue_address2":"","venue_address3":"","venue_id":"13481832","rsvp_closed":"0","photo_count":"","lon":"-75.1500015258789","no_rsvpcount":"0","status":"upcoming","photo_url":"http:\/\/photos1.meetupstatic.com\/photos\/event\/2\/e\/6\/global_97500742.jpeg","group_id":"1768166","utc_rsvp_cutoff":"None","questions":[],"rsvp_cutoff":"None","short_link":"","attendee_count":"0","fee":"0.0","venue_map":"http:\/\/maps.google.com\/staticmap?center=39.970310,-75.142998&zoom=14&size=512x512&maptype=mobile&markers=39.970310,-75.142998,blues&sensor=false","how_to_find_us":"","venue_lat":"39.970310","rsvp_open_time":"None","my_waitlist_status":"","organizer_id":"50367512","feelabel":"","myrsvp":"yes","id":"136013852","ismeetup":"1","venue_city":"Philadelphia","name":"Code for Philly Workshop #44 @ 3rd Ward Philly","photo_album_id":"","lat":"39.959999084472656","venue_state":"PA","group_name":"Code for America Philly","rsvp_limit":"0","group_photo_url":"http:\/\/photos1.meetupstatic.com\/photos\/event\/2\/e\/6\/global_97500742.jpeg","guest_limit":"2","utc_time":"1377637200000","waiting_rsvpcount":"0","organizer_name":"","feecurrency":"USD","utc_rsvp_open_time":"None","event_hosts":[{"member_name":"Chris Alfano","member_id":14053930}],"venue_phone":"","venue_lon":"-75.142998","rating_count":0,"event_url":"http:\/\/www.meetup.com\/Code-for-America-Philly\/events\/136013852\/","rating":0},{"rsvpcount":"1","venue_name":"Devnuts","maybe_rsvpcount":"0","payment_required":"0","allow_maybe_rsvp":"0","rsvpable":"OPEN","member_status":"member","time":"Tue Sep 03 17:00:00 EDT 2013","venue_zip":"19123","venue_visibility":"public","feedesc":"","updated":"Wed Aug 21 21:02:59 EDT 2013","venue_address1":"908 North 3rd Street","description":"<p><b>Special schedule<\/b>: We\'re holding the workshop on <b>Wednesday<\/b> this week to offer a break for all you Tuesday-haters. Also because Devnuts is hosting an <a href=\"http:\/\/www.meetup.com\/Philly-OpenStack-Meetup-Group\/events\/128222352\/\">OpenStack meetup<\/a> on Tuesday -- check it out and bring some OpenStack know-how back for the brigade\'s <a href=\"http:\/\/phl.io\/\">Philly Cloud<\/a> project!<\/p>\n<p>Stop by Devnuts any time between 5pm and 10pm to work on your civic technology project, to discover active projects, or to begin\/improve your coding skills through civic service. No memberships are required, just bring a laptop be ready to jump into something.<\/p>\n<p>See <a href=\"http:\/\/codeforphilly.org\/projects\">http:\/\/codeforphilly.org\/projects<\/a> for a full directory of members\' projects<\/p>\n<p><b>This Week<\/b><\/p>\n<p>Have something you\'d like to share with or present to the group? Tell us in the comments!<\/p>\n<p>Some currently active projects looking for a hand include:<\/p>\n<p>ï <a href=\"http:\/\/codeforphilly.org\/projects\/localwiki\">LocalWiki for Philly (Wikidelphia)<\/a><\/p>\n<p>ï <a href=\"http:\/\/codeforphilly.org\/projects\/Code_for_Philadelphia\">CodeForPhilly.org<\/a><\/p>\n<p>ï <a href=\"http:\/\/codeforphilly.org\/projects\/Apps_for_Philly\">AppsForPhilly.org<\/a><\/p>\n<p><b>Schedule<\/b><\/p>\n<p>5pm - desks open  <br \/>\n\n 6pm - pizza followed by community announcements\/demos  <br \/>\n\n 10pm - commit &amp; quit<\/p>","venue_address2":"","venue_address3":"","venue_id":"1512397","rsvp_closed":"0","photo_count":"","lon":"-75.1500015258789","no_rsvpcount":"0","status":"upcoming","photo_url":"http:\/\/photos1.meetupstatic.com\/photos\/event\/2\/e\/6\/global_97500742.jpeg","group_id":"1768166","utc_rsvp_cutoff":"None","questions":[],"rsvp_cutoff":"None","short_link":"","attendee_count":"0","fee":"0.0","venue_map":"http:\/\/maps.google.com\/staticmap?center=39.965282,-75.142570&zoom=14&size=512x512&maptype=mobile&markers=39.965282,-75.142570,blues&sensor=false","how_to_find_us":"","venue_lat":"39.965282","rsvp_open_time":"None","my_waitlist_status":"","organizer_id":"50367512","feelabel":"","myrsvp":"yes","id":"135983852","ismeetup":"1","venue_city":"Philadelphia","name":"Code for Philly Workshop #45","photo_album_id":"","lat":"39.959999084472656","venue_state":"PA","group_name":"Code for America Philly","rsvp_limit":"0","group_photo_url":"http:\/\/photos1.meetupstatic.com\/photos\/event\/2\/e\/6\/global_97500742.jpeg","guest_limit":"2","utc_time":"1378242000000","waiting_rsvpcount":"0","organizer_name":"","feecurrency":"USD","utc_rsvp_open_time":"None","event_hosts":[{"member_name":"Chris Alfano","member_id":14053930}],"venue_phone":"","venue_lon":"-75.142570","rating_count":0,"event_url":"http:\/\/www.meetup.com\/Code-for-America-Philly\/events\/135983852\/","rating":0},{"rsvpcount":"1","venue_name":"Devnuts","maybe_rsvpcount":"0","payment_required":"0","allow_maybe_rsvp":"0","rsvpable":"OPEN","member_status":"member","time":"Tue Sep 10 17:00:00 EDT 2013","venue_zip":"19123","venue_visibility":"public","feedesc":"","updated":"Wed Aug 21 21:02:46 EDT 2013","venue_address1":"908 North 3rd Street","description":"<p><b>Special schedule<\/b>: We\'re holding the workshop on <b>Wednesday<\/b> this week to offer a break for all you Tuesday-haters. Also because Devnuts is hosting an <a href=\"http:\/\/www.meetup.com\/Philly-OpenStack-Meetup-Group\/events\/128222352\/\">OpenStack meetup<\/a> on Tuesday -- check it out and bring some OpenStack know-how back for the brigade\'s <a href=\"http:\/\/phl.io\/\">Philly Cloud<\/a> project!<\/p>\n<p>Stop by Devnuts any time between 5pm and 10pm to work on your civic technology project, to discover active projects, or to begin\/improve your coding skills through civic service. No memberships are required, just bring a laptop be ready to jump into something.<\/p>\n<p>See <a href=\"http:\/\/codeforphilly.org\/projects\">http:\/\/codeforphilly.org\/projects<\/a> for a full directory of members\' projects<\/p>\n<p><b>This Week<\/b><\/p>\n<p>Have something you\'d like to share with or present to the group? Tell us in the comments!<\/p>\n<p>Some currently active projects looking for a hand include:<\/p>\n<p>ï <a href=\"http:\/\/codeforphilly.org\/projects\/localwiki\">LocalWiki for Philly (Wikidelphia)<\/a><\/p>\n<p>ï <a href=\"http:\/\/codeforphilly.org\/projects\/Code_for_Philadelphia\">CodeForPhilly.org<\/a><\/p>\n<p>ï <a href=\"http:\/\/codeforphilly.org\/projects\/Apps_for_Philly\">AppsForPhilly.org<\/a><\/p>\n<p><b>Schedule<\/b><\/p>\n<p>5pm - desks open  <br \/>\n\n 6pm - pizza followed by community announcements\/demos  <br \/>\n\n 10pm - commit &amp; quit<\/p>","venue_address2":"","venue_address3":"","venue_id":"1512397","rsvp_closed":"0","photo_count":"","lon":"-75.1500015258789","no_rsvpcount":"0","status":"upcoming","photo_url":"http:\/\/photos1.meetupstatic.com\/photos\/event\/2\/e\/6\/global_97500742.jpeg","group_id":"1768166","utc_rsvp_cutoff":"None","questions":[],"rsvp_cutoff":"None","short_link":"","attendee_count":"0","fee":"0.0","venue_map":"http:\/\/maps.google.com\/staticmap?center=39.965282,-75.142570&zoom=14&size=512x512&maptype=mobile&markers=39.965282,-75.142570,blues&sensor=false","how_to_find_us":"","venue_lat":"39.965282","rsvp_open_time":"None","my_waitlist_status":"","organizer_id":"50367512","feelabel":"","myrsvp":"yes","id":"135984002","ismeetup":"1","venue_city":"Philadelphia","name":"Code for Philly Workshop #46","photo_album_id":"","lat":"39.959999084472656","venue_state":"PA","group_name":"Code for America Philly","rsvp_limit":"0","group_photo_url":"http:\/\/photos1.meetupstatic.com\/photos\/event\/2\/e\/6\/global_97500742.jpeg","guest_limit":"2","utc_time":"1378846800000","waiting_rsvpcount":"0","organizer_name":"Kevin Curry","feecurrency":"USD","utc_rsvp_open_time":"None","event_hosts":[{"member_name":"Chris Alfano","member_id":14053930}],"venue_phone":"","venue_lon":"-75.142570","rating_count":0,"event_url":"http:\/\/www.meetup.com\/Code-for-America-Philly\/events\/135984002\/","rating":0}],"meta":{"lon":"","count":4,"link":"http:\/\/api.meetup.com\/events","next":"","total_count":4,"url":"http:\/\/api.meetup.com\/events?status=past%2Cupcoming&radius=25.0&sig_id=14053930&order=time&group_urlname=Code-for-America-Philly&sig=f942d5a058a8a16249b32cbaa7f81443ff69902b&offset=0&format=json&page=500&fields=","id":"","title":"Meetup Events","updated":"Wed Aug 21 22:10:48 EDT 2013","description":"Deprecated API method for accessing meetup events. Please see [\/2\/events](\/meetup_api\/docs\/2\/events\/) and [\/2\/open_events](\/meetup_api\/docs\/2\/open_events\/) for replacements.","method":"Events","lat":""}}', true);
		$meetups = $meetups['results'];
	}
	
	$nextMeetup = array_shift($meetups);
	
	// detect if meetup is happening right now
	if($nextMeetup && $nextMeetup['time'] < $now) {
		$currentMeetup = $nextMeetup;
		$nextMeetup = array_shift($meetups);
	}
	
	// TODO: delete this!
	elseif(!empty($_GET['force_current'])) {
		$currentMeetup = $nextMeetup;
	}
	
	if($currentMeetup) {
		$currentMeetup['checkins'] = MemberCheckin::getAllForMeetupByProject($currentMeetup['id']);
	}
	
	$pageData['currentMeetup'] = $currentMeetup;
	$pageData['nextMeetup'] = $nextMeetup;
	$pageData['futureMeetups'] = $meetups;


// projects
	$pageData['projectsTotal'] = DB::oneValue('SELECT COUNT(*) FROM `%s`', Project::$tableName);
	$pageData['projectsTags']['byTech'] = TagItem::getTagsSummary(array(
		'tagConditions' => array(
			'Handle LIKE "tech:%"'
		)
		,'itemConditions' => array(
			'ContextClass' => 'Project'
		)
	));
	$pageData['projectsTags']['byTopic'] = TagItem::getTagsSummary(array(
		'tagConditions' => array(
			'Handle LIKE "topic:%"'
		)
		,'itemConditions' => array(
			'ContextClass' => 'Project'
		)
	));


// members
	$pageData['membersTotal'] = DB::oneValue('SELECT COUNT(*) FROM `%s`', Person::$tableName);
	$pageData['membersTags']['byTech'] = TagItem::getTagsSummary(array(
		'tagConditions' => array(
			'Handle LIKE "tech:%"'
		)
		,'itemConditions' => array(
			'ContextClass' => 'Person'
		)
	));
	$pageData['membersTags']['byTopic'] = TagItem::getTagsSummary(array(
		'tagConditions' => array(
			'Handle LIKE "topic:%"'
		)
		,'itemConditions' => array(
			'ContextClass' => 'Person'
		)
	));


// project updates stream
	$pageData['updates'] = ProjectUpdate::getAll(array(
		'limit' => 10
		,'order' => array('ID' => 'DESC')
	));


// render data against home template
RequestHandler::respond('home', $pageData);