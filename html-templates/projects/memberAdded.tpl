{extends designs/site.tpl}

{block title}Members &mdash; {$dwoo.parent}{/block}

{block content}
	<p>{memberLink $Member}	{if $data->Role}({$data->Role|escape}){/if} has been added to {projectLink $Project}</p>
{/block}