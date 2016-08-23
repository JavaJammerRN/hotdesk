$(function() {

	//Get function to retrieve and populate gpNames in select picker.
	$("#login").click(function() {
		var inputname = $("#username").val();
		$.getJSON("http://localhost:8080/user/"+ inputname).success(function(result) {
				alert(inputname);	
				alert(result.forename);
				sessionStorage.setItem('userID', result.userID);

					if (inputname == (result.username)) {
					("#username") = result.forname;
					$('#myModal').modal({backdrop: "static"});
					setTimeout(function() { $('#myModal').modal('hide'); }, 3000);
							window.location = "home.html";
					}


		}).fail(function(d, status, error) {
		alert("\nDetails: User not Found");
	});

	});

	

});
