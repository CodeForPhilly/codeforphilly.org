{extends "designs/site.tpl"}

{block "content"}
	<h1>Please Confirm</h1>
	<p class="confirm lead">{$question}</p>
	{if $data->Class == 'Comment'}
		{$Comment = $data}

		<div class="comment" id="comment-{$Comment->ID}">
			<div class="author">
				<a href="/member/{$Comment->Author->Username}">{avatar $Comment->Author size=128}</a>
			</div>
			<div class="message">
				<div class="message-body">{userLink $Comment->Author} {$Comment->Message|markdown}</div>
				<time>{$Comment->Created|date_format:'%c'}</time>
			</div>
		</div>
	{/if}
	<form method="POST">
		<fieldset>
			<input class="destructive" type="submit" name="Sure" value="{if $data->Class == 'Comment'}Delete Comment{else}Yes{/if}">
			<a href="/" onclick="javascript:history.go(-1);return false;">{if $data->Class == 'Comment'}Don’t Delete{else}No{/if}</a>
		</fieldset>
	</form>
{/block}