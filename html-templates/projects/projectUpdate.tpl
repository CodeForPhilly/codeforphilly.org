{extends designs/site.tpl}

{block title}Update #{$data->Number|escape} &mdash; {$data->Project->Title|escape} &mdash; {$dwoo.parent}{/block}

{block content}
	{$Update = $data}
	{$Project = $Update->Project}
	{$updateUrl = "http://codeforphilly.org/projects/$Project->Handle/updates/$Update->Number"}

	<h2><a href="/projects/{$Project->Handle}">{$Project->Title|escape}</a> &mdash; <a href="{$updateUrl}">Update #{$Update->Number}</a></h2>

	<div class="row-fluid">
		{projectUpdate $Update showHeading=false articleClass="span8"}

		<aside class="twitterstream span4">
			<h3>
				Twitter mentions
				<a class="btn btn-mini" href="http://twitter.com/home?status={"Check out $Project->TitlePossessive update #$Update->Number: $updateUrl"|escape:url}">Spread the word!</a>
			</h3>
	
			{twitter query=$updateUrl count=10}
			<dl class="tweetsCt">
				{foreach item=tweet from=$tweets}
					<dt><img src="{$tweet.profile_image_url}"><a href="http://twitter.com/{$tweet.from_user}" target="_blank"><strong>{$tweet.from_user}:</strong></a></dt>
					<dd>{$tweet.text|linkify:twitter}</dd>
				{foreachelse}
					<dd><em>None yet.</em></dd>
				{/foreach}
			</dl>	
		</aside>
	</div>
{/block}