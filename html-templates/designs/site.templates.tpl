{template avatar Member size=32 pixelRatio=2}
	{$pixels = $size}
	{if $pixelRatio}
		{$pixels = $size * $pixelRatio}
	{/if}
	{if $Member->PrimaryPhoto}
		{$src = $Member->PrimaryPhoto->getThumbnailRequest($pixels, $pixels)}
	{elseif $Member->Email}
		{$src = cat("//www.gravatar.com/avatar/", md5(strtolower($Member->Email)), "?s=", $pixels, "&r=g&d=http%3A%2F%2Fcodeforphilly.org%2Fimg%2Fcode_for_philly_placeholder_darker.png")}
	{/if}
	<img style="max-height:{$pixels}px" alt="Profile Photo: {$Member->FullName|escape}" src="{$src}" class="avatar img-rounded">
{/template}

{template memberLink Member avatar=32 showName=true}
<span class="member {tif $avatar ? 'with-avatar'}">
	{if $avatar}
		<a href="/members/{$Member->Username}" class="member-thumbnail" title="{$Member->FullName|escape}" data-toggle="tooltip" data-placement="bottom">
			{avatar $Member size=$avatar}
		</a>
	{/if}
	{if $showName}
		<a href="/members/{$Member->Username}" class="name-link">
			{$Member->FullName|escape}
		</a>
	{/if}
</span>
{/template}

{template projectLink Project}
	<a href="/projects/{$Project->Handle}">{$Project->Title|escape}</a>
{/template}

{template meetup event headingLevel=h4}
	{$endTime = $event.time + $event.duration}
	<article class="event">
		<{$headingLevel}>{$event.name}</{$headingLevel}>
		<p>When: {$event.time/1000|date_format:"%A, %b %e - %l:%M%P"}&ndash;{$endTime/1000|date_format:"%l:%M%P"}</p>
		<p>Where: <a href="http://maps.google.com/?q={$event.venue.address_1},%20{$event.venue.zip}">{$event.venue.name}</a></p>
		<p><a href="{$event.event_url}">RSVP @ meetup.com</a> {if $event.yes_rsvp_count}({$event.yes_rsvp_count} so far){/if}</p>
	</article>
{/template}

{template projectUpdate Update headingLevel=h4 showHeading=true showProject=false articleClass=""}
	<article class="project-update {$articleClass}">
		{if $showHeading}
			<{$headingLevel}>
				{if $showProject}
					<a href="/projects/{$Update->Project->Handle}">{$Update->Project->Title|escape}</a> &mdash; 
				{/if}
				<a href="/projects/{$Update->Project->Handle}/updates/{$Update->Number}">Update #{$Update->Number}</a>
			</{$headingLevel}>
		{/if}
		<blockquote>
			{$Update->Body|escape|markdown}
			<small>Posted on {$Update->Created|date_format:"%c"} by {memberLink $Update->Creator avatar=off}</small>
		</blockquote>
	</article>
{/template}



{template userLink User avatar=no avatarSize=32}{strip}
<a href="/people/{$User->Username}">
	{if $avatar}
		{avatar $User size=$avatarSize}
	{/if}
	{$User->FullName}
</a>
{/strip}{/template}

{template commentForm Context url=no}
	{if $.Session->Person}
		<form id="postCommentForm" action="{tif $url ? $url : cat('/' 'requests' '/' $Context->Handle '/comment')}" method="POST">
			<fieldset class="comment stretch">
				<div class="author"></div>
				
				<div class="message">
					<label for="Message">
						<span>{$.User->FullName}</span>
						<textarea id="Message" name="Message"></textarea>
					</label>
					
					<p class="hint">You can use <a href="http://daringfireball.net/projects/markdown/basics">Markdown</a> for formatting.</p>
	
					<input type="submit" class="submit" value="Post Comment">
				</div>
			</fieldset>		
		</form>
	{else}
		<p class="login-hint"><a href="/login?return=requests/{$Context->Handle}">Log in</a> to post a comment.</p>
	{/if}
{/template}

{template commentsList comments contextLinks=off}
	<div class="comments">
	{foreach item=Comment from=$comments}
		<div class="comment" id="comment-{$Comment->ID}">
			<div class="author">
				<a href="/members/{$Comment->Author->Username}">{avatar $Comment->Author size=16}</a>
			</div>
			<div class="message">
				<div class="message-body">{userLink $Comment->Author} {$Comment->Message|markdown}</div>
				<time>{$Comment->Created|date_format:'%c'}</time>
				{if $Comment->userCanWrite}
					{*<a href="/comments/{$Comment->ID}/edit" class="edit">Edit</a>*}
					<a href="/comments/{$Comment->ID}/delete" class="delete action-link">Delete</a>
				{/if}
			</div>
		</div>
	{foreachelse}
		<p class="nocomments">No comments have been posted yet.</p>		
	{/foreach}
	</div>
{/template}