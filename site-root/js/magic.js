(function(){
	//Automagically wake up all the Twitter Bootstrap drop-downs on load
	$('.dropdown-toggle').dropdown();
	
	//basically, when a user clicks on the checkin/out 
	//button menu option, we submit a hidden form. HACK-ish.
	//A better way would be to add data-attributes to the link to drive
	//unobtrusive ajax...
	$('#inoutlink').click(function(){ $('#inout').submit();});
})();