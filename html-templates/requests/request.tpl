{extends "designs/site.tpl"}

{block "title"}{$data->Title|escape} &mdash; {$dwoo.parent}{/block}

{block "content"}
	{$Request = $data}
	{$Creator = Person::getByID("$Request->CreatorID")}

	<h2>{$Request->Title}</h2>
	<p>By <a href="/members/{$Request->CreatorID}">{$Creator->FirstName} {$Creator->LastName}</a><br />	
	<p>Description: {$Request->Description}</p>

	{commentForm $Request url=false}
	{commentsList $Request->Comments headingLevel='h3' contextLinks=true}


	{*<p class="json"><a href="/requests/json/{$Request->ID}?{MICS::getQueryString()}">JSON feed</a></p>*}
	{*dump $Creator*}
{/block}