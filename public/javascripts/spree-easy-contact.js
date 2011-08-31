//Loads the contact us form via an ajax request
$(document).ready(function() {
	//Show spinner if form hasn't loaded yet	
	$('#contact-us-modal').spin();
	//Load via ajax the contact form in html
	$.get("/contacts/new.js")
});