{extends "designs/site.tpl"}

{block "title"}{$data->FullNamePossessive} Profile &mdash; {$dwoo.parent}{/block}


{block "content"}
	{$Person = $data}

	{if MICS::isReferred()}<a href="{$.server.HTTP_REFERER}" onclick="history.go(-1);return false;">&laquo; Back</a>{/if}
	
	<div id="photos">
		{if $Person->PrimaryPhoto}
			<a href="{$Person->PrimaryPhoto->WebPath}" id="display-photo-link"><img src="{$Person->PrimaryPhoto->getThumbnailRequest(200,200)}" alt="Profile Photo: {$Person->FullName|escape}" id="display-photo" /></a>
		{else}
			<img src="/thumbnail/person/200x200" alt="Profile Photo: {$Person->FullName|escape}" id="profilePhoto" />
		{/if}
		<div id="photo-thumbs" class="clearfix">
			{foreach item=Photo from=$Person->Photos}
				<a href="{$Photo->getThumbnailRequest(1024,768)}" class="photo-thumb" id="t{$Photo->ID}" title="{$Photo->Caption|escape}"><img src="{$Photo->getThumbnailRequest(48,48)}" /></a>
			{/foreach}
		</div>
	</div>
	
	<div id="page-intro" class="">
		<h1 class="run-in">{$Person->FullName|escape}</h1>
		{if $Person->Location}
		<div class="quick-info"><a href="http://maps.google.com/?q={$Person->Location|escape}" target="_blank">{$Person->Location|escape}</a></div>
		{/if}
	</div>

	<div id="info" class="">

		{if $Person->About}
			<h2>About Me</h2>
			<section class="about">
				{$Person->About|micstext}
			</section>
		{/if}
		
{dump $Person}
		{if $.User}
		<h2>Contact Information</h2>
		<dl class="section">
			{if $Person->Email}
				<dt>Email</dt>
				<dd><a href="mailto:{$Person->Email}" title="Email {$Person->FullName|escape}">{$Person->Email}</a></dd>
			{/if}


			{if $Person->Phone}
				<dt>Phone</dt>
				<!-- tel: URL scheme fails in desktop browsers -->
				<dd><!-- <a href="tel:{$Person->Phone}"> -->{$Person->Phone|phone}<!-- </a> --></dd>
			{/if}		
		</dl>
		{/if}
	
	</div>
	
	
{/block}