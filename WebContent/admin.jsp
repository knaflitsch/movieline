<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./res/js/jquery.js" type="text/javascript"></script>
<script src="./res/js/jquery-ui.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="./res/css/jquery-ui.min.css">
<link rel="stylesheet" href="./res/css/jquery-ui.structure.min.css">
<link
	href="//netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css"
	rel="stylesheet" id="bootstrap">
<script src="./res/js/bootstrap.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script  type="text/javascript">
var pointer = 0;

$(document).ready(function() {
	//Glyphon Function
	$("#btnBack").click(function(){
			pointer = pointer - 5;
			$("#data").fadeOut('slow', function() {

			});
		});
		
		$("#btnNext").click(function(){
			pointer = pointer + 5;
			$("#data").fadeOut('slow', function() {

			});
		});
		
	//Set Up Data
	$( document ).ready(function() {
			//loadNormalData();
		});
		
	//Delete Function 
	$("#dialog_delete").hide();
		
	$("#dialog_delete").dialog({
		autoOpen: false,
		show: {
		effect: "clip",
		duration: 500
		},
		hide: {
		effect: "clip",
		duration: 500
		}
		});
		
	$(document).on("click","#deleteBtn", function(){
			var id = $(this).attr("data-id");
			var name = $(this).attr("data-name");
			
			$("#deleteTitle").html("Delete Movie -"+name+"-?");
			$("#delete-id").val(id);
			$("#dialog_delete").dialog("open");
		});
	
	$("#deleteTrue").click(function() {
		var movie = {
				id:$("#delete-id").val()
		}
		var tableID = "#tableRow_"+$("#delete-id").val();
		
		$("#dialog_delete").dialog("close");
		$(tableID).fadeOut('slow');
	});
	
	$("#deleteFalse").click(function() {
		$("#dialog_delete").dialog("close");
	});
	
	//Realtime Search function of Table
    var activeSystemClass = $('.list-group-item.active');

    //something is entered in search form
    $('#system-search').keyup( function() {
       var that = this;
        // affect all table rows on in systems table
        var tableBody = $('.table-list-search tbody');
        var tableRowsClass = $('.table-list-search tbody tr');
        $('.search-sf').remove();
        tableRowsClass.each( function(i, val) {
        
            //Lower text for case insensitive
            var rowText = $(val).text().toLowerCase();
            var inputText = $(that).val().toLowerCase();
            if(inputText != '')
            {
                $('.search-query-sf').remove();
                tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
                    + $(that).val()
                    + '"</strong></td></tr>');
            }
            else
            {
                $('.search-query-sf').remove();
            }

            if( rowText.indexOf( inputText ) == -1 )
            {
                //hide rows
                tableRowsClass.eq(i).hide();
                
            }
            else
            {
                $('.search-sf').remove();
                tableRowsClass.eq(i).show();
            }
        });
        //all tr elements are hidden
        if(tableRowsClass.children(':visible').length == 0)
        {
            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
        }
    });
});
</script>

<style type="text/css">
#adminTable{
	margin-top:3%;
	margin-right:10%;
	margin-left:10%;
}
</style>
</head>
<body>
<div id="dialog_delete" title="Delete Movie">
		<p id="deleteTitle"></p>
		<table class="table">
			<tr>
				<td><button id="deleteTrue" class="btn btn-default">Yes</button></td>
				<td><button id="deleteFalse" class="btn btn-default">No</button></td>
				<td><input type="hidden" id="delete-id"></td>
			</tr>
		</table>

</div>
<div id="adminTable">
	<div class="row">
        <div class="col-md-2">
                <div class="input-group">
                    <input class="form-control" id="system-search" name="q" placeholder="Search for" required>
                </div>
                <div style="margin-top:5px;" id="componentsGlyph">
				<button title="Previous Page" class="btn btn-default" id="btnBack">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				</button>
				<button title="Next Page" class="btn btn-default" id="btnNext">				
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				</button>
			</div>
        </div>
		<div class="col-md-10">
    	 <table id="data" class="table table-list-search">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Genre</th>
                            <th>Release</th>
                            <th>Info</th>
                            <th>Actors</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    	<tr id="tableRow_1">
                    		<td>Them Hoes</td>
                    		<td>Hardcore XXX</td>
                    		<td>1999</td>
                    		<td>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</td>
                     		<td>Some Fags</td>
                     		<td><button class='btn btn-default' id='deleteBtn' data-id="1" data-name="1">Delete</button></td>
                     		<td><button class='btn btn-default' id='changeBtn' data-id="1">Change</button></td>
                     	</tr>
                     	<tr id="tableRow_22">
                    		<td>Racing Grid eXtReME</td>
                    		<td>Hardcore Race</td>
                    		<td>1752</td>
                    		<td>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</td>
                     		<td>Some more Fags</td>
                     		<td><button class='btn btn-default' id='deleteBtn' data-id="2" data-name="2">Delete</button></td>
                     		<td><button class='btn btn-default' id='changeBtn' data-id="2">Change</button></td>
                     	</tr>
                     	<tr id="tableRow_3">
                    		<td>Fishing Lies Within</td>
                    		<td>Hardcore XXX Documentray</td>
                    		<td>2202</td>
                    		<td>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</td>
                     		<td>Some stupid Fags</td>
                     		<td><button class='btn btn-default' id='deleteBtn' data-id="3" data-name="3">Delete</button></td>
                     		<td><button class='btn btn-default' id='changeBtn' data-id="3">Change</button></td>
                     	</tr>
                     	<tr id="tableRow_4">
                    		<td>Milos in the Hawt</td>
                    		<td>Hardcore Action Sheit</td>
                    		<td>2016</td>
                    		<td>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</td>
                     		<td>The bals Fag</td>
                     		<td><button class='btn btn-default' id='deleteBtn' data-id="4" data-name="4">Delete</button></td>
                     		<td><button class='btn btn-default' id='changeBtn' data-id="4">Change</button></td>
                     	</tr>
                    </tbody>
                </table>   
		</div>
	</div>
</div>
</body>
</html>