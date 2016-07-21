$(function() {

	//Get function to retrieve and populate gpNames in select picker.
	$("#login").click(function() {
		var inputname = $("#username").val();
		$.getJSON("http://ukl5cg6195g1q:8080/users",{uname:inputname}).success(function(result) {
				alert(inputname);	
				alert(result.forename);
					if (inputname == (result.username)) {
							window.location = "home.html";
					}


		});
	});

	

});