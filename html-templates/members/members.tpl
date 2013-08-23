{extends designs/site.tpl}

{block title}Members &mdash; {$dwoo.parent}{/block}

{block content}
	<h2>Registered Members</h2>
	<ul class="thumbnails members-list">
		{foreach item=Member from=$data}
			<li class="span2">
			    <div class="thumbnail">
			        {$pixels = 400}
    			        <a href="/members/{$Member->Username}">
                    	{if $Member->PrimaryPhoto}
                    		{$src = $Member->PrimaryPhoto->getThumbnailRequest($pixels, $pixels)}
                    	{elseif $Member->Email}
                    		{$src = cat("//www.gravatar.com/avatar/", md5(strtolower($Member->Email)), "?s=", $pixels, "&r=g&d=http%3A%2F%2Fcodeforphilly.org%2Fimg%2Fcode_for_philly_placeholder_darker.png")}
                        {else}
                            {$src = "/img/code_for_philly_placeholder_darker.png"}
                    	{/if}
                        	<div class="avatar flexible" style="background-image:url({$src})"></div>
                            <div class="member-name"><span class="center-helper">{$Member->FullName|escape}</span></div>
                        </a>
			    </div>
			 </li>
		{/foreach}
	</ul>
{/block}