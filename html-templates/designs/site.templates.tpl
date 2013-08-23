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
	<div class="avatar" style="width:{$size}px;height:{$size}px;background-image:url({$src})"></div>
{/template}

{template memberLink Member avatar=32 showName=true}
    <a href="/members/{$Member->Username}" title="{$Member->FullName|escape}" data-toggle="tooltip" data-placement="bottom">{strip}
	{if $avatar}
		{avatar $Member size=$avatar}
	{/if}
	{if $showName}
		<span class="member-name">{$Member->FullName|escape}</span>
	{/if}
    {/strip}</a>
{/template}

{template tagLink tagData rootUrl}
	<a href="{$rootUrl}?tag={$tagData.Handle}">{$tagData.Title|regex_replace:'/^[^:]+:\s*/':''}{if $tagData.itemsCount} <span class="badge pull-right">{$tagData.itemsCount|number_format}</span>{/if}</a>
{/template}

{template projectLink Project}
	<a href="/projects/{$Project->Handle}">{$Project->Title|escape}</a>
{/template}

{template meetup event headingLevel=h4 showRsvp=true}
	{$endTime = $event.time + $event.duration}
	<article class="event">
		<{$headingLevel}>{$event.name}</{$headingLevel}>

		<p class="muted">{strip}
		    {$event.time/1000|date_format:"%A, %b %e <br> %l:%M%P"}&ndash;
		    {$endTime/1000|date_format:"%l:%M%P"}
            &#32;@&nbsp;<a href="http://maps.google.com/?q={$event.venue.address_1},%20{$event.venue.zip}">{$event.venue.name}</a>
        {/strip}</p>

		{if $showRsvp}
			<p><a href="{$event.event_url}">RSVP @ meetup.com</a> {if $event.yes_rsvp_count}({$event.yes_rsvp_count} so far){/if}</p>
		{/if}
	</article>
{/template}

{template projectUpdate Update headingLevel=h4 showHeading=true showProject=false articleClass=""}
	<article class="project-update {$articleClass}">
		{if $showHeading}
			<{$headingLevel}>
				{if $showProject}
					<a href="/projects/{$Update->Project->Handle}">{$Update->Project->Title|escape}</a> 
				{/if}
				<small><a href="/projects/{$Update->Project->Handle}/updates/{$Update->Number}">Update #{$Update->Number}</a></small>
			</{$headingLevel}>
		{/if}
		<div class="update-body well">
			{$Update->Body|escape|markdown}
			<p class="muted"><small>Posted on {$Update->Created|date_format:"%c"} by {memberLink $Update->Creator avatar=off}</small></p>
		</div>
	</article>
{/template}

{template comment Comment headingLevel=h5 showHeading=true showProject=false articleClass=""}
	<article class="comment {$articleClass}">
		{if $showHeading}
			<{$headingLevel}>
				{$Comment->Message}
			</{$headingLevel}>
		{/if}
		<blockquote>
			<small>Posted on {$Comment->Created|date_format:"%c"} by {memberLink $Comment->Creator avatar=off}</small>
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