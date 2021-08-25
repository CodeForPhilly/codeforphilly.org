{extends designs/site.tpl}

{block title}{if $data->isPhantom}{_ 'Create'}{else}{_ 'Edit'} {$data->Headline|escape}{/if} &mdash; {_ 'Buzz'} &mdash; {$dwoo.parent}{/block}

{block content}
    {$Buzz = $data}
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
            <div class="page-header">
                <h1>
                    {if $Buzz->isPhantom}
                        {_ "Log new buzz"}
                    {else}
                        {capture assign=buzzHeadline}<strong>{$Buzz->Headline|escape}</strong>{/capture}
                        {sprintf(_("Edit buzz %s"), $buzzHeadline)}
                    {/if}
                </h1>
            </div>

            {if !$Buzz->isValid}
            <div class="error well">
                <strong>{_ "There were problems with your entry:"}"</strong>
                <ul class="errors">
                {foreach item=error key=field from=$Buzz->validationErrors}
                    <li>{$error}</li>
                {/foreach}
                </ul>
            </div>
            {/if}

            <form method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="field-project" class="control-label">{_ "Project:"}</label>
                    {selectField inputName=ProjectID blankOption='Select Project' options=Laddr\Project::getAll() useKeyAsValue=no default=$Buzz->ProjectID required=yes}
                </div>
                <div class="form-group">
                    <label for="field-headline" class="control-label">{_ "Headline:"}</label>
                    <input name="Headline" id="field-headline" placeholder="City Times headline on Budget Project" value="{refill field=Headline default=$Buzz->Headline}" class="form-control" aria-required="true" required autofocus>
                </div>
                <div class="form-group">
                    <label for="field-url" class="control-label">{_ "URL:"}</label>
                    <input name="URL" id="field-url" placeholder="http://citytimes.com/2014/04/28/civic-hackers-analyze-budget" value="{refill field=URL default=$Buzz->URL}" class="form-control" aria-required="true" required>
                </div>
                <div class="form-group">
                    <label for="field-published-date" id="publish-date-label" class="control-label">{_ "Publish date/time:"}</label>
                    <div class="row">
                        <div class="col-xs-6">
                            <input id="field-published-date" class="form-control" type="date" name="Published[date]" placeholder="YYYY-MM-DD" value="{refill field=Published.date default=tif($Buzz->Published, date('Y-m-d', $Buzz->Published))}" aria-required="true" required>
                        </div>
                        <div class="col-xs-6">
                            <input type="time" class="form-control" name="Published[time]" placeholder="HH:MM" value="{refill field=Published.time default=tif($Buzz->Published, date('H:i', $Buzz->Published))}" aria-labelledby="publish-date-label" aria-required="true" required>
                        </div>
                    </div>
                </div>
                {capture assign=optionalSmallLabel}<small class="muted">({_ Optional})</small>{/capture}
                <div class="form-group">
                    <label for="field-image" class="control-label">{sprintf(_("Image %s"), $optionalSmallLabel)}</label>
                    <input type="file" id="field-image" class="form-control" name="image" aria-describedby="image-help">
                </div>
                <div class="form-group">
                    <label for="field-summary" class="control-label">{sprintf(_("Summary %s"), $optionalSmallLabel)}</label>
                    <textarea name="Summary" class="form-control" rows="10" id="field-summary">{refill field=Summary default=$Buzz->Summary}</textarea>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="{tif $Buzz->isPhantom ? 'Create Buzz' : 'Save Changes'}"/>
                </div>
            </form>
        </div>
    </div>
{/block}

{block js-bottom}
    {$dwoo.parent}
    {jsmin "pages/buzz-edit.js"}
{/block}
