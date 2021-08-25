{extends designs/site.tpl}

{block title}Projects Activity &mdash; {$dwoo.parent}{/block}

{block content}
    <svg width="960" height="500"></svg>

    <table class="table table-striped table-condensed table-hover">
        <thead>
            <tr>
                <th>Project</th>
                <th>Slack Channel</th>
                <th>Messages<br><small>This Month</small></th>
                <th>GitHub Repository</th>
                <th>Commits<br><small>This Month</small></th>
                <th>Errors</th>
            </tr>
        </thead>

        <tbody>
        {foreach item=project from=$data}
            <tr>
                <td>{contextLink $project.Project}</td>
                <td>
                    {if $project.Project->ChatChannel}
                        <a href="/chat?channel={$project.Project->ChatChannel|escape:url}" target="_blank">#{$project.Project->ChatChannel|escape}</a>
                    {else}
                        &mdash;
                    {/if}
                </td>
                <td>{$project.messagesCount|number_format}</td>
                <td>
                    {if $project.gitHubOwner}
                        <a href="https://github.com/{$project.gitHubOwner|escape}/{$project.gitHubRepo|escape}" target="_blank">{$project.gitHubOwner|escape}/{$project.gitHubRepo|escape}</a>
                    {else}
                        &mdash;
                    {/if}
                </td>
                <td>{$project.commitsCount|number_format}</td>
                <td class="{tif $project.errors ? danger}">
                    <ul>
                        {foreach item=error from=$project.errors}
                            <li>{$error|escape}</li>
                        {/foreach}
                    </ul>
                </td>
            </tr>
        {/foreach}
        </tbody>
    </table>
{/block}

{block js-bottom}
    {$dwoo.parent}

    <script src="https://d3js.org/d3.v4.min.js"></script>
    <script src="https://d3js.org/d3-scale-chromatic.v1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twix.js/1.2.0/twix.min.js"></script>

    {jsmin projects-activity.js}
{/block}