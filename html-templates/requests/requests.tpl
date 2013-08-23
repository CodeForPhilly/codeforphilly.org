{extends "designs/site.tpl"}

{block "content"}

{$Request = $data}
{$Creator = Person::getByID("1")}
	{*dump $Creator*}

	<div class="page-header">
		<h2>Request Board</h2>
		<form action="/requests/create">
				<button class="btn btn-success" type="submit">Add Request&hellip;</button>
		</form>
	</div>


	{foreach item=Request from=$data}
		<div class="row-fluid">	
			<div class="span8">
				<h3>
					<a name="{$Request->Title}" href="/requests/{$Request->ID}">{$Request->Title|escape}</a>
				</h3>

				<div class="well">
					{if $Request->Description}
						<div class="markdown readme">{$Request->Description|escape|markdown}</div>
					{/if}
					Posted {date_format $Request->Created} By 1
				</div>
			</div>
		</div>
    {/foreach}
{/block}