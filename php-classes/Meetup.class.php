<?php

class Meetup
{
	static public $signedEventsUrl;
	
	static public function getEvents($ttl = 1800)
	{
		$cacheKey = 'meetup/events';
		
		if(!$data = Cache::fetch($cacheKey)) {
			$data = json_decode(file_get_contents(static::$signedEventsUrl), true);
			
			if(!empty($data['results'])) {
				Cache::store($cacheKey, $data, $ttl);
			}
		}
		
		return $data['results'];
	}
}