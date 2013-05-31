{extends designs/site.tpl}

{block title}Checkin Complete &mdash; {$dwoo.parent}{/block}

{block content}
	{$Checkin = $data}
	<p>{memberLink $Checkin->Member} has been checked in as of {$Checkin->InTime|date_format:'%c'}</p>
{/block}