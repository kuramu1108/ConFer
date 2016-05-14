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
		var time_re = new RegExp("[0-9]{2}/\[0-9]{2}/[0-9]{4} [0-9]{2}:[0-9]{2} AM");
		for (var i = 0; i<timeOptions.length; i++)
		{
			alert(timeOptions[i].value);
			if (!timeOptions[i].value.match(time_re))
			{
				alert("time format invalid, please don't modify the time");
				return false;
			}
		}
	}
	return true;
}