//Loads the contact us form via an ajax request
$(document).ready(function() {	
	$('#contact-us-modal').spin();
	//Load via ajax the contact form in html
	$.get("/contacts/new.js", function(data) {
			$('#contact-us-modal').empty();
	});
});