function hasDuplicates(array) {
    var valuesSoFar = Object.create(null);
    for (var i = 0; i < array.length; ++i) {
        var value = array[i];
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
	    alert("Please fill in all the fields");
	    return false;
	}
	
	if (!timeOptionEntered)
	{
		alert("Please provide at least on time option");
		return false;
	}
	else
	{
		var time_re = new RegExp("[0-9]{2}/\[0-9]{2}/[0-9]{4} [0-9]{2}:[0-9]{2}");
		for (var i = 0; i<timeOptions.length; i++)
		{
			if (!timeOptions[i].value.match(time_re))
			{
				alert("time format invalid, please don't modify the time");
				return false;
			}
		}
	}
	
	if (hasDuplicates(timeOptions))
	{
		alert("Please do not select same time options");
		return false;
	}
	return true;
}

function validateLogin()
{
	var email = "";
	var password = "";
	
	if (email == "" || password == "")
	{
		alert("Please fill in all the field");
		return false;
	}
	
	var email_re = new RegExp("[a-z0-9\.]+@[a-z]+(\.[a-z]+)+");
	if (!email.match(email_re))
	{
		alert("invalid email address");
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
		alert("Please Input your name");
		return false;
	}
	
	for (var i = 0; i < timeOptions.length; i++) {
		if (timeOptions[i].checked == true) {
			
			return true;
		}
	}
	alert("Please select at least one seat");
	return false; 
}