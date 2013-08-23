$(function() {

	/*
	$('.checkin .project-picker').typeahead({                                
		name: 'projects'
		,valueKey: 'Title'
		,remote: {
			url: '/projects/json'
			,filter: function(r) {
				return r.data;
			}
		}
		,limit: 5
	});
	*/
	$('.checkin .project-picker').combobox();

});