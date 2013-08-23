{extends "designs/site.tpl"}

{block "title"}{$data->FullNamePossessive} Profile &mdash; {$dwoo.parent}{/block}


{block "content"}
	{$Member = $data}

	<article class="member-profile">
		{avatar $Member size=200}
		<h2 class="run-in">{$Member->FullName|escape} {if $.User && $Member->ID == $.User->ID}<a href="/profile">edit your profile</a>{/if}</h2>
		
		{if $Member->Location}
			<p class="location"><a href="http://maps.google.com/?q={$Member->Location|escape}" target="_blank">{$Person->Location|escape}</a></p>
		{/if}
	
{*
		{if $Member->OpenCheckin}
			<form action="/members/{$Member->Username}/checkout" method="POST">
				Checked in at {$Member->OpenCheckin->InTime|date_format:'%c'}
				<input type="submit" value="Check {$Member->FirstName|escape} out">
			</form>
		{else}
			<form action="/members/{$Member->Username}/checkin" method="POST">
				{if $Member->LastCheckin}
					Last checked out at {$Member->LastCheckin->OutTime|date_format:'%c'}
				{else}
					Never checked in
				{/if}
				<input type="submit" value="Check {$Member->FirstName|escape} in">
			</form>
		{/if}
*}
	
		{if $Member->About}
			<h3>About Me</h3>
			<section class="about">
				{$Member->About|escape|markdown}
			</section>
		{/if}
		
		{* Only logged-in users can view contact information *}
		{if $.User}
			<h3>Contact Information</h3>
			<dl>
				{if $Member->Email}
					<dt>Email</dt>
					<dd><a href="mailto:{$Member->Email}" title="Email {$Member->FullName|escape}">{$Member->Email}</a></dd>
				{/if}

				{if $Member->Twitter}
					<dt>Twitter</dt>
					<dd><a href="https://twitter.com/{$Member->Twitter}">{$Member->Twitter}</a></dd>
				{/if}
				
				{if $Member->Phone}
					<dt>Phone</dt>
					<dd><a href="tel:{$Member->Phone}" target="_blank">{$Member->Phone|phone}</a></dd>
				{/if}	
			</dl>
	        {$currentProjects =  ProjectMember::getAllByField('MemberID',$Member->ID) }
			{if count($currentProjects)}
				<dt> My projects </dt>
				{foreach item=ProjectMembership from=$currentProjects}
					{$projectObj  = $ProjectMembership->Project}
					<li> 
						<a name="{$projectObj->Handle}" href="/projects/{$projectObj->Handle}">{$projectObj->Title|escape}</a>
					</li>
				{/foreach}
			{/if}
		{/if}
	</article>
	
{/block}