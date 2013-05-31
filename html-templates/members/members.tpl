{extends designs/site.tpl}

{block title}Members &mdash; {$dwoo.parent}{/block}

{block content}
	<h2>Registered Members</h2>
	<div class="container members-page-members">
		<ul>
			{foreach item=Member from=$data}
				<li>{memberLink $Member, 256}</li>
			{/foreach}
		</ul>
	</div>
{/block}