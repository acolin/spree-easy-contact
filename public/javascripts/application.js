//Loads the contact us form via an ajax request from a link with attribute load_contact_us=path_to_contact_us_form

$('#contact-us').click(function(event) {

	// Show Spin while contact form is loading
	$("#contact-us-modal").spin();
	
	//Load via ajax the contact form in html
	$.get("/contacts/new", function(data) {
		// When image finishes loading, remove the spinner and show contact form
			$('#contact-us-modal').empty();	
			$('#contact-us-modal').append(data);
			$('#contact-us-modal').fadeIn("slow");
	});
});