<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <script src="./res/js/jquery.js" type="text/javascript"></script>
    <script src="./res/js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="./res/js/bootstrap.js" type="text/javascript"></script>
    <script src="./res/js/bootstrap-select/bootstrap-select.js" type="text/javascript"></script>
    <link href="./res/css/jquery-ui.min.css" rel="stylesheet">
      <link href="./res/css/jquery-ui.structure.min.css" rel="stylesheet">
        <link href="./res/css/bootstrap-select.min.css" rel="stylesheet">
          <link href="//netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css" id="bootstrap" rel="stylesheet">
            <meta content="text/html; charset=ISO-8859-1" http-equiv="Content-Type">
              <title>Insert title here</title>
              <script type="text/javascript">

                $(function () {

                  $(document).ready(function () {
                    $("#loader").hide();
                    loadNormalData();
                  });

                  $("#update").click(function () {
                    $("#update").html("Now Searching");
                    $("#update").fadeOut("slow", function () {
                      startUpdate();
                    });
                  });

                  function startUpdate(){
                      $("#loader").fadeIn();
                    };
                    
                  //Startup
                	function loadNormalData() {
                		$.ajax({
                 			headers : {
                				Accept : 'application/json'
                			},
                			type : 'GET',
                			url : "http://10.115.1.7:8080/Movieline/rest/movieDetails/movie/",
                	
                			success : function(data) {
                				
                				alert("Success");
                			},
                	
                			error : function(e) {
                				alert("Nigga ");
                				console.log(e);
                				
                			}
                	
                		});
                	}
                    
                    //http://www.omdbapi.com/?t=tropic+thunder&y=&plot=short&r=json

                });
              </script>
            </head>
            <body>
              <div style="margin:5%">
                <button class='btn btn-default' id="update" name="update" type="button">Movies updaten</button>
              </div>
              <div id="loader">
                <h2 style="text-align: center">Your Movies will be updatet!</h2>
                <img style="margin-left:49%" alt="" src="res/img/loader.gif"/>
                <p id="resultSet" style="text-align: center">
                  updated 0 out of 10000 Movies
                </p>
              </div>
            </body>
          </html>
