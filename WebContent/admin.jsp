<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./res/js/jquery.js" type="text/javascript"></script>
<script src="./res/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="./res/js/bootstrap.js" type="text/javascript"></script>
<script src="./res/js/bootstrap-select/bootstrap-select.js" type="text/javascript"></script>
<link rel="stylesheet" href="./res/css/jquery-ui.min.css">
<link rel="stylesheet" href="./res/css/jquery-ui.structure.min.css">
<link rel="stylesheet" href="./res/css/bootstrap-select.min.css">
<link href="//netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css" rel="stylesheet" id="bootstrap">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script  type="text/javascript">
var pointer = 0;

$(document).ready(function() {
	$('.selectpicker').selectpicker();
	
	
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
			loadNormalData();
		});
	
	//Startup
	function loadNormalData() {
		$.ajax({
			headers : {
				Accept : 'application/json'
			},
			type : 'GET',
			url : "<%=request.getContextPath()%>/rest/movieDetails/movie/",
	
			success : function(data) {
				alert("YES");
			},
	
			error : function(e) {
				console.log(e);
			}
	
		});
	}
		
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
		var tableRow = "#tableRow_"+$("#delete-id").val();
		//TODO: REST einbau
		$("#dialog_delete").dialog("close");
		$(tableRow).fadeOut('slow');
	});
	
	$("#deleteFalse").click(function() {
		$("#dialog_delete").dialog("close");
	});
	
	//Change Function
	$(document).on("click","#changeBtn", function(){
			var tableRow = "tableRow_"+$(this).attr("data-id");
			var tableTITLE = "tableTITLE_"+$(this).attr("data-id");
			var tableGENRE = "tableGENRE_"+$(this).attr("data-id");
			var tableRELEASE = "tableRELEASE_"+$(this).attr("data-id");
			var tableINFO = "tableINFO_"+$(this).attr("data-id");
			var tableACTORS = "tableACTORS_"+$(this).attr("data-id");
			var tableCHANGE = "tableCHANGE_"+$(this).attr("data-id");
			var tableDELETE = "tableDELETE_"+$(this).attr("data-id");
			
			var inputTITLE = "changeTitle_"+$(this).attr("data-id");
			var inputGENRE = "changeGenre_"+$(this).attr("data-id");
			var selectRELEASE = "selectRelease_"+$(this).attr("data-id");
			var inputINFO = "changeInfo_"+$(this).attr("data-id");
			var inputACTORS = "changeActors_"+$(this).attr("data-id");
			
			var id = $(this).attr("data-id");
			var oldTitle = $(this).attr("data-title");
			var oldGenre = $(this).attr("data-genre");
			var oldRelease = $(this).attr("data-release");
			var oldInfo = $(this).attr("data-info");
			var oldActors = $(this).attr("data-actors");
			
			var newTable = "<td id="+tableTITLE+"><input type='text' name='changeTitle' placeholder='Titel' class='form-control' id="+inputTITLE+"></td><td id="+tableGENRE+"><input type='text' name='changeGenre' placeholder='Genre' class='form-control' id="+inputGENRE+"></td><td id="+tableRELEASE+"><select class='selectpicker' id="+selectRELEASE+" data-width='auto'><option value='2000'>2000</option><option value='1999'>1999</option></select></td><td id="+tableINFO+"  class=\"infoTD\"><input type='text' name='changeInfo' placeholder='Info' class='form-control' id="+inputINFO+"></td><td id="+tableACTORS+"><input type='text' name='changeActors' placeholder='Actors' class='form-control' id="+inputACTORS+"></td><td id="+tableCHANGE+"><button id='btnAcceptChange' data-id="+id+" class='btn btn-success'><span class=\"glyphicon glyphicon-ok\" aria-hidden=\"true\"></span></button></td><td id='"+tableDELETE+"'><button id='btnDiscardChange' data-id="+id+" data-title="+oldTitle+" data-genre="+oldGenre+" data-release="+oldRelease+" data-info="+oldInfo+" data-actors="+oldActors+" class='btn btn-danger'><span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span></button></td>";

			$("#"+tableRow).fadeOut("slow", function(){
				$("#"+tableRow).html("");
				$("#"+tableRow).html(newTable);
				$("#"+inputTITLE).val(""+oldTitle);
				$("#"+inputGENRE).val(""+oldGenre);
				$("#"+inputINFO).val(""+oldInfo);
				$("#"+inputACTORS).val(""+oldActors);
				$("#"+tableRow).fadeIn("slow");
				$('.selectpicker').selectpicker('refresh');
			});
			
		});
		
		$(document).on("click","#btnDiscardChange", function(){
			var id = $(this).attr("data-id");
			var title = $(this).attr("data-title");
			var genre = $(this).attr("data-genre");
			var release = $(this).attr("data-release");
			var info = $(this).attr("data-info");
			var actors = $(this).attr("data-actors");
			
			var tableRow = "tableRow_"+id;
			
			var newTable = "<td id='tableTITLE_"+id+"'> " + title + " </td><td id='tableGENRE_"+id+"'> " + genre + " </td><td id='tableRELEASE_"+id+"'> " + release + " </td><td id='tableINFO_"+id+"'> " + info + " </td><td id='tableACTORS_"+id+"'> " + actors + " </td><td id='tableCHANGE_"+id+"'><button id='changeBtn' data-id='"+id+"' data-title='"+title+"' data-genre='"+genre+"' data-release='"+release+"' data-info='"+info+"' data-actors='"+actors+"' class='btn btn-default'>Change</button></td><td id='tableDELETE_"+id+"'><button id='deleteBtn' data-id='"+id+"' class='btn btn-default'>Delete</button></td>";
		
			discardChangeFadeOut(tableRow, newTable);
		});
		
		$(document).on("click","#btnAcceptChange", function(){
			var id = $(this).attr("data-id");
			var newTitle = ""+$("#changeTitle_"+id).val();
			var newGenre = ""+$("#changeGenre_"+id).val();
			var newRelease = $("#selectRelease_"+id).val();
			var newInfo = ""+$("#changeInfo_"+id).val();
			var newActors = ""+$("#changeActors_"+id).val();
			
			var data = {
					id:id,
					title:newTitle,
					genre:newGenre,
					release:newRelease,
					info:newInfo,
					actors:newActors,
			}
			
			updateData(data);
		});
		
		function discardChangeFadeOut(tableRow, newTable){
			$("#"+tableRow).fadeOut("slow", function(){
				$("#"+tableRow).html("");
				$("#"+tableRow).html(newTable);
				$("#"+tableRow).fadeIn("slow");
			});
		}
		
		function updateData(user){ //TODO: REST upgrade
		<%-- 	$.ajax({
				type : 'PUT',
				url : '<%=request.getContextPath()%>/rest/admin/',
				data : JSON.stringify(user),
				contentType : 'application/json',
				success : function(data) {
					setUpDataFromUpdate(data);
				},
				error : function(e) {
					console.log(e);
				}
			}); --%>
			setUpDataFromUpdate(user);
		}

		
		function setUpDataFromUpdate(data){ //TODO: REST upgrade
			var id = data.id;
			var title = data.title;
			var genre = data.genre;
			var release = data.release;
			var info = data.info;
			var actors = data.actors;
			
			var tableRow = "tableRow_"+id;
			
			var newTable = "<td id='tableTITLE_"+id+"'> " + title + " </td><td id='tableGENRE_"+id+"'> " + genre + " </td><td id='tableRELEASE_"+id+"'> " + release + " </td><td id='tableINFO_"+id+"'> " + info + " </td><td id='tableACTORS_"+id+"'> " + actors + " </td><td id='tableCHANGE_"+id+"'><button id='changeBtn' data-id='"+id+"' data-title='"+title+"' data-genre='"+genre+"' data-release='"+release+"' data-info='"+info+"' data-actors='"+actors+"' class='btn btn-default'>Change</button></td><td id='tableDELETE_"+id+"'><button id='deleteBtn' data-id='"+id+"' class='btn btn-default'>Delete</button></td>";
			
			discardChangeFadeOut(tableRow, newTable);
		}
	
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

.infoTD{
	width: 25%;
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
                    		<td class="infoTD">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</td>
                     		<td>Some Fags</td>
                     		<td><button class='btn btn-default' id='changeBtn' data-id="1" data-title="Title" data-genre="Genre" data-release="8888" data-info="Info" data-actors="Actors">Change</button></td>
                     		<td><button class='btn btn-default' id='deleteBtn' data-id="1" data-name="1">Delete</button></td>
                     	</tr>
                     	<tr id="tableRow_2">
                    		<td>Racing Grid eXtReME</td>
                    		<td>Hardcore Race</td>
                    		<td>1752</td>
                    		<td class="infoTD">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</td>
                     		<td>Some more Fags</td>
                     		<td><button class='btn btn-default' id='changeBtn' data-id="2" data-title="Title" data-genre="Genre" data-release="8888" data-info="Info" data-actors="Actors">Change</button></td>
                     		<td><button class='btn btn-default' id='deleteBtn' data-id="2" data-name="2">Delete</button></td>
                     	</tr>
                     	<tr id="tableRow_3">
                    		<td>Fishing Lies Within</td>
                    		<td>Hardcore XXX Documentray</td>
                    		<td>2202</td>
                    		<td class="infoTD">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</td>
                     		<td>Some stupid Fags</td>
                     		<td><button class='btn btn-default' id='changeBtn' data-id="3" data-title="Title" data-genre="Genre" data-release="8888" data-info="Info" data-actors="Actors">Change</button></td>
                     		<td><button class='btn btn-default' id='deleteBtn' data-id="3" data-name="3">Delete</button></td>
                     	</tr>
                     	<tr id="tableRow_4">
                    		<td>Milos in the Hawt</td>
                    		<td>Hardcore Action Sheit</td>
                    		<td>2016</td>
                    		<td class="infoTD">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</td>
                     		<td>The bals Fag</td>
                     		<td><button class='btn btn-default' id='changeBtn' data-id="4" data-title="Title" data-genre="Genre" data-release="8888" data-info="Info" data-actors="Actors">Change</button></td>
                     		<td><button class='btn btn-default' id='deleteBtn' data-id="4" data-name="4">Delete</button></td>
                     	</tr>
                    </tbody>
                </table>   
		</div>
	</div>
</div>
</body>
</html>