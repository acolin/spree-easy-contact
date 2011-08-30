//Loads the contact us form via an ajax request from a link with attribute load_contact_us=path_to_contact_us_form

$('#contact-us').click(function(event) {
	$.get("/contacts/new.js", function(data) {
		// Show Spin while contact form is loading
		// $('#contact-us-modal').spin();

		// When image finishes loading, remove the spinner and show contact form
		$('#contact-us-modal').load(function (){
			$(this).find("div:first").remove();	
			$(this).fadeIn("slow");
		});
	});
});

	