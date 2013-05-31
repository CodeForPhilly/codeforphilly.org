$('pre.markdown').replaceWith(function(){
	return $('<div></div>', {
		html: markdown.toHTML($(this).text())
	}).attr('class', $(this).attr('class'));
});