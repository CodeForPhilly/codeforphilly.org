{extends designs/site.tpl}

{block title}{$data->Title|escape} &mdash; Projects &mdash; {$dwoo.parent}{/block}

{block content}
	{$Project = $data}

	<h2>
		{$Project->Title|escape}
		<div class="btn-group pull-right">
			<a href="/projects/{$Project->Handle}/edit" class="btn">Edit Project</a>
			<button class="btn dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
			<ul class="dropdown-menu">
				<li><a href="#add-member" data-toggle="modal">Add Member</a></li>
				{if $.User && $Project->hasMember($.User)}
					<li><a href="#post-update" data-toggle="modal">Post Update</a></li>
				{/if}
				{if $.Session->hasAccountLevel('Staff')}
					<li><a href="#manage-members" data-toggle="modal">Manage Members</a></li>
				{/if}
			</ul>
		</div>
	</h2>
	
	<div class="row-fluid">
		<article class="project span8">
			<dl class="dl-horizontal">
				{if $Project->UsersUrl}
					<dt>Users' URL</dt>
					<dd><a href="{$Project->UsersUrl|escape}">{$Project->UsersUrl|escape}</a></dd>
				{/if}
				
				{if $Project->DevelopersUrl}
					<dt>Developers' URL</dt>
					<dd><a href="{$Project->DevelopersUrl|escape}">{$Project->DevelopersUrl|escape}</a></dd>
				{/if}
			
				{if $Project->Memberships}
					<dt>Members</dt>
					<dd>
						<ul class="inline people-list">
						{foreach item=Membership from=$Project->Memberships}
							{$Member = $Membership->Member}
							<li class="listed-person {tif $Project->MaintainerID == $Member->ID ? maintainer}">
								<a
									href="/members/{$Member->Username}"
									class="thumbnail member-thumbnail"
									data-toggle="tooltip"
									data-placement="bottom"
									title="{$Member->FullName|escape}{if $Membership->Role}&mdash;{$Membership->Role}{/if}{if $Project->MaintainerID == $Member->ID}{tif $Membership->Role ? ' and ' : '&mdash;'}Maintainer{/if}"
								>
									{avatar $Member size=60}
								</a>
							</li>
						{foreachelse}
							<li class="muted">None registered</li>
						{/foreach}
							<li><a href="#add-member" data-toggle="modal" style="line-height:60px">+add</a></li>
						</ul>
					</dd>
				{/if}
	
				{if $Project->README}
					<dt>README</dt>
					<dd class="markdown readme well">{$Project->README|escape|markdown}</dd>
				{/if}

				{*
				<dt>COMMENTS: </dt>
				<dd>
					<form method="post" action="/projects/{$Project->Handle}/comment">
					<textarea name="Message"></textarea>
					<input type="submit" value="Submit">
					</form>
				</dd>
				{foreach item=Comment from=$Project->$Comments}
					<p>
					{$Comment->Message}
					</p>
				{/foreach}
				*}

			</dl>

			{if ($.User && $Project->hasMember($.User))}
				<form action="/projects/{$Project->Handle}/json/create-request">
					<button class="btn btn-success" type="submit">Need Help?&hellip;</button>
				</form>
			{/if}


			{if ($.User && $Project->hasMember($.User)) || count($Project->Updates)}
				<h3>
					Project Updates
					{if $.User && $Project->hasMember($.User)}
						<a href="#post-update" class="btn btn-mini" data-toggle="modal">Post Update</a>
					{/if}
				</h3>
			{/if}
	
			{if count($Project->Updates)}
				{foreach item=Update from=$Project->Updates}
					{projectUpdate $Update}
				{/foreach}
			{/if}
		</article>

		<aside class="twitterstream span4">
			<h3>
				Twitter mentions
				<a class="btn btn-mini" href="http://twitter.com/home?status={"Check out $Project->Title: http://codeforphilly.org/projects/$Project->Handle"|escape:url}">Spread the word!</a>
			</h3>
	
			{twitter query="http://codeforphilly.org/projects/$Project->Handle" count=10}
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

{block js-bottom}
	{$dwoo.parent}

	<form id="add-member" class="modal fade hide form-horizontal" action="/projects/{$Project->Handle}/add-member" method="POST">
		<header class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3>Add project member</h3>
		</header>
		<section class="modal-body">
			<div class="control-group">
				<label class="control-label" for="inputUsername">Username</label>
				<div class="controls">
					<input type="text" id="inputUsername" name="username" required>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputRole">Role</label>
				<div class="controls">
					<input type="text" id="inputRole" name="role" placeholder="optional">
				</div>
			</div>
		</section>
		<footer class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			<button class="btn btn-primary">Add member</button>
		</footer>
	</form>

	{if $.User && $Project->hasMember($.User)}
		<form id="post-update" class="modal fade hide" action="/projects/{$Project->Handle}/updates" method="POST">
			<header class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Post project update</h3>
			</header>
			<section class="modal-body">
				<textarea class="input-block-level" name="body" rows="10" required></textarea>
				<span class="help-block">Markdown is supported</span>
			</section>
			<footer class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
				<button class="btn btn-primary">Post Update</button>
			</footer>
		</form>
	{/if}

	{if $.Session->hasAccountLevel('Staff')}
		<div id="manage-members" class="modal fade hide">
			<header class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>Manage project members</h3>
			</header>
			<section class="modal-body">
				<ul class="thumbnails">
				{foreach item=Membership from=$Project->Memberships}
					<li class="thumbnail">
						{memberLink $Membership->Member}
						<span class="role {tif !$Membership->Role && $Membership->MemberID != $Project->MaintainerID ? muted}">
							{if $Membership->Role && $Membership->MemberID == $Project->MaintainerID}
								{$Membership->Role|escape} and Maintainer
							{elseif $Membership->Role}
								{$Membership->Role|escape}
							{elseif $Membership->MemberID == $Project->MaintainerID}
								Maintainer
							{else}
								Member
							{/if}
						</span>
		
						<div class="btn-group">
							{if $Membership->MemberID != $Project->MaintainerID}
								<a href="/projects/{$Project->Handle}/change-maintainer?username={$Membership->Member->Username|escape:url}" class="btn btn-mini">Make Maintainer</a>
							{/if}
							<a href="/projects/{$Project->Handle}/remove-member?username={$Membership->Member->Username|escape:url}" class="btn btn-mini btn-danger">Remove</a>
						</div>
					</li>
				{foreachelse}
					<li class="muted">None registered</li>
				{/foreach}
				</ul>
			</section>
		</div>
	{/if}
{/block}