{extends designs/site.tpl}

{block title}{$fancy_title|escape} &mdash; {$dwoo.parent}{/block}

{block content}
    <h2>{$fancy_title|escape}</h2>
    {$post_stream.posts[0].cooked}

    <hr>
    {$url = "http://forum.codeforphilly.org/t/$slug/$id"}
    Edit or discuss this page at <a href="{$url|escape}">{$url|escape}</a>


    <hr>

    <div id="discourse-comments"></div>

    <script type="text/javascript">
        var DiscourseEmbed = {
            discourseUrl: '//forum.codeforphilly.org/',
            topicId: {$id|json_encode}
        };

        (function() {
            var d = document.createElement('script'); d.type = 'text/javascript'; d.async = true;
            d.src = DiscourseEmbed.discourseUrl + 'javascripts/embed.js';

            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(d);
        })();
    </script>

{/block}
