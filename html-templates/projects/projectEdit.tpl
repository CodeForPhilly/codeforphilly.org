{extends designs/site.tpl}

{block title}{if $data->isPhantom}Create{else}Edit {$data->Title|escape}{/if} &mdash; Projects &mdash; {$dwoo.parent}{/block}

{block content}
	{$Project = $data}
	
	<h2>
		{if $Project->isPhantom}
			Create new project
		{else}
			Edit project <strong>{$Project->Title|escape}
		{/if}
	</h2>
		

	<form method="POST" class="form-horizontal">
		<div class="control-group">
			<label for="Title" class="control-label">Title:</label>
			<div class="controls">
				<input name="Title" placeholder="Train Schedule Analyzer" 
					value="{refill field=Title default=$Project->Title}" />
			</div>
		</div>
		<div class="control-group">
			<label for="DevelopersUrl" class="control-label">Users' URL:</label>
			<div class="controls">
				<input name="UsersUrl" placeholder="http://www.example.com/develop"
				 value="{refill field=UsersUrl default=$Project->UsersUrl}"/>
			</div>
		</div>
		<div class="control-group">
			<label for="DevelopersUrl" class="control-label">Developers' URL:</label>
			<div class="controls">
				<input name="DevelopersUrl" placeholder="http://www.example.com/develop" value="{refill field=DevelopersUrl default=$Project->DevelopersUrl}"/>
			</div>
		</div>
		<div class="control-group">
			<label for="tagsInput" class="control-label">Tags:</label>
			<div class="controls">
				<input id="tagsInput" name="tags" placeholder="tech:php, topic:outdoors" value="{refill field=tags default=Tag::getTagsString($Project->Tags)}"/>
			</div>
		</div>
		<div class="control-group">
			<label for="README" class="control-label">README(.md)</label>
			<div class="controls">
				<textarea name="README" class="input-block-level" rows="10">{refill field=README default=$Project->README}</textarea>
				<br/><br/>
				<input type="submit" class="btn-small btn" value="{tif $Project->isPhantom ? 'Create Project' : 'Save Changes'}"/>
			</div>
		</div>
		</div>
	</form>
{/block}

{block js-bottom}
	{$dwoo.parent}
	<script>
		$('#tagsInput').tagsinput({
			typeahead: {
				source: {DB::allValues('Title', 'SELECT Title FROM tags')|json_encode}
			}
			,tagClass: function(item) {
				var cls = ['label'];

				if (item.match(/^tech:/)) {
					cls.push('tag-tech');
				} else if (item.match(/^topic:/)) {
					cls.push('tag-topic');
				}

				return cls.join(' ');
			}
		});
	</script>
{/block}

{*block js-bottom}
	{$dwoo.parent}
	<script src="/lib/epiceditor/js/epiceditor.min.js"></script>
	<script>
		(function() {
			var textareaEl = Ext.getBody().down('textarea[name=README]')
				,markdownStr = textareaEl.getValue()
				,hiddenInput
				,readmeEditorCt, readmeEditor;
	
			readmeEditorCt = textareaEl.replaceWith({
				tag: 'div'
				,cls: 'markdown-editor readme'
			});

			hiddenInput = readmeEditorCt.insertSibling({
				tag: 'input'
				,type: 'hidden'
				,name: 'README'
			}, 'after');

			readmeEditor = new EpicEditor({
				container: readmeEditorCt.dom
				,basePath: '/lib/epiceditor'
				,theme: {
					preview: '/themes/preview/cfa.css'
				}
			});

			readmeEditor.load(function() {
				readmeEditor.importFile('README', markdownStr);
			});

			textareaEl.up('form').on('submit', function(ev, t) {
				hiddenInput.dom.value = readmeEditor.exportFile();
			});
		})();
	</script>
{/block*}