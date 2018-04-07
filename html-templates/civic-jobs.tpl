{extends designs/site.tpl}

{block title}{_ "Civic jobs"} &mdash; {$dwoo.parent}{/block}

{block content}
    <h2>{_ "Civic jobs"}</h2>
    {contentBlock "civic-jobs"}
{/block}


{block css}
    {$dwoo.parent}

    {if $.User->hasAccountLevel('Staff')}
        {cssmin "features/content-editable.css"}
    {/if}
{/block}

{block js-bottom}
    {$dwoo.parent}

    {if $.User->hasAccountLevel('Staff')}
        {jsmin "jquery.filedrop.js+markdown.js+features/content-editable.js"}
    {/if}
{/block}