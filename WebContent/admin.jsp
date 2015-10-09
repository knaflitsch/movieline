<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./res/js/jquery-ui.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="./res/css/jquery-ui.min.css">
<link
	href="//netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css"
	rel="stylesheet" id="bootstrap">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="./res/js/bootstrap.js" type="text/javascript"></script>
<script src="./res/js/jquery.session.js" type="text/javascript"></script>
<script src="./res/js/bootbox.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script  type="text/javascript">
$(document).ready(function() {
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
<div id="adminTable">
	<div class="row">
        <div class="col-md-2">
                <div class="input-group">
                    <input class="form-control" id="system-search" name="q" placeholder="Search for" required>
                </div>
        </div>
		<div class="col-md-10">
    	 <table class="table table-list-search">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Genre</th>
                            <th>Release</th>
                            <th>Info</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<tr>
                    		<td>Them Hoes</td>
                    		<td>Hardcore XXX</td>
                    		<td>1999</td>
                    		<td>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</td>
                     	</tr>
                     	<tr>
                    		<td>Racing Grid eXtReME</td>
                    		<td>Hardcore Race</td>
                    		<td>1752</td>
                    		<td>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</td>
                     	</tr>
                     	<tr>
                    		<td>Fishing Lies Within</td>
                    		<td>Hardcore XXX Documentray</td>
                    		<td>2202</td>
                    		<td>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</td>
                     	</tr>
                     	<tr>
                    		<td>Milos in the Hawt</td>
                    		<td>Hardcore Action Sheit</td>
                    		<td>2016</td>
                    		<td>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</td>
                     	</tr>
                    </tbody>
                </table>   
		</div>
	</div>
</div>
</body>
</html>