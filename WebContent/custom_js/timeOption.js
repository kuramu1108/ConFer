$(function() {
	$('#datetimepicker1').datetimepicker({
    	format: 'DD/MM/YYYY HH:mm',           
    });
});

var datetimepicker_count = 1;

function addTimeOption() {
			datetimepicker_count++;
			var htmlText_1 = "<li><div class='form-group' id='taskTemplate'><div class='row'><div class='col-sm-6'><div class='form-group'><div class='input-group date' id='datetimepicker";
			
			var htmlText_2 = "'><input type='text' class='form-control' name='timeOption'/> <span class='input-group-addon'> <span class='glyphicon glyphicon-calendar'></span></span></div></div></div><div class='col-xs-1'><button type='button' class='btn btn-default removeButton' onclick='removeTimeOption();'>-</button></div></div></div></li>";
            var html = $(htmlText_1 + datetimepicker_count.toString() + htmlText_2);
            html.appendTo('#timeOptions');
            var dtpID = "#datetimepicker" + datetimepicker_count.toString();
            $(dtpID).datetimepicker({
            	format: 'DD/MM/YYYY HH:mm',           
            });
}

function removeTimeOption() {
	$("ul li:last").fadeOut('fast').remove();
}
