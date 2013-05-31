{extends "designs/site.tpl"}

{block "content"}
	{$Request = $data}

	<form action="/requests/create" method="post">
		<div class="field">
			<label for="title"> Title: </label>
        	<input type='text' id='Title' name='Title' value='{refill field=Title default=$Request->Title}' />
        </div>
		<div class="field">
			<label for="description"> Description </label>
			<textarea name="Description" rows="10" cols="50">{refill field=description default=$Request->Description}</textarea>
		</div>
		<div class='field'>
        	<input type='submit' />
        </div>
	</form>
{/block}