function hasDuplicates(array) {
    var valuesSoFar = Object.create(null);
    for (var i = 0; i < array.length; ++i) {
        var value = array[i].value;
        if (value in valuesSoFar) {
            return true;
        }
        valuesSoFar[value] = true;
    }
    return false;
}

function validateCreatePoll()
{
	var title = document.getElementById("title").value;
	var location = document.getElementById("location").value;
	var description = document.getElementById("description").value;
	var timeOptions = document.getElementsByName("timeOption");
	
	var timeOptionEntered = true;
	if (timeOptions == null || timeOptions.length == 0 || timeOptions[0].value == "")
	{
		timeOptionEntered = false;
	}
	
	if (title == "" || location == "" || description == "")
	{
//	    alert("Please fill in all the fields");
	    $("#error-message").fadeOut('fast').remove();
	    var html = $("<span id='error-message' style='color:red'>* are required fields</span>");
        html.appendTo('#description-div');
	    return false;
	}
	
	if (!timeOptionEntered)
	{
//		alert("Please provide at least on time option");
		$("#error-message").fadeOut('fast').remove();
	    var html = $("<span id='error-message' style='color:red'>* Please provide at least on time option</span>");
        html.appendTo('#timeOptions-div');
		return false;
	}
	else
	{
		var time_re = new RegExp("[0-9]{2}/\[0-9]{2}/[0-9]{4} [0-9]{2}:[0-9]{2}");
		for (var i = 0; i<timeOptions.length; i++)
		{
			if (!timeOptions[i].value.match(time_re))
			{
//				alert("time format invalid, please don't modify the time");
				$("#error-message").fadeOut('fast').remove();
			    var html = $("<span id='error-message' style='color:red'>* time format invalid, please don't modify the time</span>");
		        html.appendTo('#timeOptions-div');
				return false;
			}
		}
	}
	
	if (hasDuplicates(timeOptions))
	{
//		alert("Please do not select same time options");
		$("#error-message").fadeOut('fast').remove();
	    var html = $("<span id='error-message' style='color:red'>* Please do not select same time options</span>");
        html.appendTo('#timeOptions-div');
		return false;
	}
	
	// once everything is good at creation date value;
	var creationDate = new Date();
	var dd = creationDate.getDate();
	var MM = creationDate.getMonth() + 1;
	var yyyy = creationDate.getFullYear();

	if(dd<10)
	    dd = '0' + dd;
	if(MM < 10)
	    MM = '0' + MM;
	
	creationDate = dd + '/' + MM + '/' + yyyy;
	document.getElementById("creationDate").value = creationDate;
	return true;
}

function validateLogin()
{
	var email = document.getElementById("email").value;
	var password = document.getElementById("password").value;
	
	if (email == "" || password == "")
	{
//		alert("Please fill in all the field");
		$("#error-message").fadeOut('fast').remove();
	    var html = $("<span id='error-message' style='color:red'>* fields are required</span>");
        html.appendTo('#password-div');
		return false;
	}
	
	var email_re = new RegExp("[a-z0-9\.]+@[a-z]+(\.[a-z]+)+");
	if (!email.match(email_re))
	{
//		alert("invalid email address");
		$("#error-message").fadeOut('fast').remove();
	    var html = $("<span id='error-message' style='color:red'>Invalid Email address</span>");
        html.appendTo('#email-div');
		return false;
	}
	return true;
}

function validateSignup()
{
	var email = document.getElementById("signupEmail").value;
	var password = document.getElementById("signupPassword").value;
	var name = document.getElementById("signupName").value;
	
	if (email == "" || password == "" || name == "")
	{
		$("#error-message").fadeOut('fast').remove();
	    var html = $("<span id='error-message' style='color:red'>* fields are required</span>");
        html.appendTo('#signupName-div');
		return false;
	}
	
	var email_re = new RegExp("[a-z0-9\.]+@[a-z]+(\.[a-z]+)+");
	if (!email.match(email_re))
	{
//		alert("invalid email address");
		$("#error-message").fadeOut('fast').remove();
	    var html = $("<span id='error-message' style='color:red'>Invalid Email address</span>");
        html.appendTo('#signupEmail-div');
		return false;
	}
	
	var password_re = new RegExp("[a-zA-Z0-9]{4,12}");
	if (!password.match(password_re))
	{
		$("#error-message").fadeOut('fast').remove();
	    var html = $("<span id='error-message' style='color:red'>use 4 to 12 alpha letters or numbers</span>");
        html.appendTo('#signupPassword-div');
		return false;
	}
	return true;
}

function validateVote()
{
	var timeOptions = document.getElementsByName("timeOption");
	var voterName = document.getElementById("name").value;
	
	if (voterName == "")
	{
//		alert("Please Input your name");
		$("#error-message").fadeOut('fast').remove();
	    var html = $("<span id='error-message' style='color:red'>Let others know your name!</span>");
        html.appendTo('#name-div');
		return false;
	}
	
	for (var i = 0; i < timeOptions.length; i++) {
		if (timeOptions[i].checked == true) {
			
			return true;
		}
	}
//	alert("Please select at least one time");
	$("#error-message").fadeOut('fast').remove();
    var html = $("<span id='error-message' style='color:red'>Select at least one time option</span>");
    html.appendTo('#timeOptions-div');
	return false; 
}