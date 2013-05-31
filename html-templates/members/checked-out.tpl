{extends designs/site.tpl}

{block title}Checkin Complete &mdash; {$dwoo.parent}{/block}

{block content}
	{$Checkin = $data}
	<p>{memberLink $Checkin->Member} has been checked out as of {$Checkin->OutTime|date_format:'%c'}</p>
{/block}