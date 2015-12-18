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
					var pointer = 0;
					var movNotFound = 0;
					var movFound = 0;
					var movFoundUpdatet = 0;
					
					var updateMovie;
					
                  $(document).ready(function () {
                    $("#loader").hide();
                  });

                  $("#update").click(function () {
                    $("#update").html("Now Searching");
                    $("#update").fadeOut("slow", function () {
                      startUpdate();
                    });
                  });

                  function startUpdate(){
                      $("#loader").fadeIn();
                      loadNormalData(pointer);
                    };
                    
                  //Startup
                	function loadNormalData(pointer) {
                		$.ajax({
                 			headers : {
                				Accept : 'application/json'
                			},
                			type : 'GET',
                			url : "http://10.115.1.7:8080/13_REST_Movieline/rest/movieDetails/movie/"+pointer+"/500",
                	
                			success : function(data) {                				
                				var movieArr = data.movie;
                				var updateQuery;
                				for (var i = 0; i < movieArr.length; i++) {
                					updateQuery = "";
                					
                					updateQuery = checkMovie(movieArr[i]);
                					
                					if (updateQuery.length > 0) {
										var title = movieArr[i].titel.split(' ').join('+');

										getDataFromOMD(title);
										
										var receivedQuery = updateMovie;
										
										if (receivedQuery != null && receivedQuery.Response === "True") {
											var updateFields = updateQuery.split('-');
											
											var Query = "UPDATE MovieLin SET ";
											
											for (var j = 0; j < updateFields.length; j++) {
													Query = Query + buildUpdateQuery(updateFields[j], receivedQuery);				
											}
											Query = Query + " WHERE titel ='"+movieArr[i].titel+"';";

											alert(Query);
											updateData(Query);
											movFoundUpdatet++;
										}
										
										else {
											movNotFound++;
										}						
								}
                					
							/*  pointer = pointer + 500;
                			
                				loadNormalData(pointer); */
                				
                				alert("Not Found: "+movNotFound + " Found Movies: "+movFoundUpdatet);
                				}
                			},
                	
                			error : function(e) {
                				alert("Failed");
                				console.log(e);
                				
                			}
                	
                		});
                		
                		function buildUpdateQuery(string, movie){
                			var query = "";

                			switch (string) {
								
							case "country":
								query = "country='"+movie.Country+"', ";
								break;
								
							case "duration":
								query = query + "duration='"+movie.Runtime+"', ";
								break;
								
							case "genre":
								query = query + "genre='"+movie.Genre+"', ";
								break;
								
							case "plott":
								query = query + "plott='"+movie.Plot+"', ";
								break;
								
							case "producer":
								query = query + "producer='"+movie.Writer+"', ";
								break;
								
							case "regie":
								query = query + "regie='"+movie.Director+"', ";
								break;
								
							case "scenarioactor":
								query = query + "scenariactor='"+movie.Actors+"', ";
								break;
								
							case "title":
								query = query + "titel='"+movie.Title+"', ";
								break;
								
							case "year":
								query = query + "year='"+movie.Year+"', ";
								break;

							default:
								break;
							}
                			
                			return query;
                		}
                		
                		function getDataFromOMD(title){
                			$.ajax({
                     			headers : {
                    				Accept : 'application/json'
                    			},
                    			type : 'GET',
                    			url : "http://www.omdbapi.com/?t="+title+"&y=&plot=full&r=json",
                    	
                    			success : function(data) {                				
                    				updateMovie = data;
                    			},
                    	
                    			error : function(e) {
                    				console.log(e);
                    				
                    			}
                    	
                    		});
                		}
                		
                		function updateData(query){
                			$.ajax({
                				type : 'POST',
                				url : "http://10.115.1.7:8080/13_REST_Movieline/rest/movieDetails/movie/"+query,
                				success : function(data) {
                					alert("Success");
                				},
                				error : function(e) {
                					console.log(e);
                				}

                			});
                		}
                		
                		function checkMovie(movie){
                			var update = "";
                			
                			if (movie.agerating.length == 0) {
                				update = update + "agerating";
							}
                			
                			if (movie.camera.length == 0) {
                				update = update + "-camera";
							}
                			
                			if (movie.company.length == 0) {
                				update = update + "-company";
							}
                			
                			if (movie.country.length == 0) {
                				update = update + "-country";
							}
                			
                			if (movie.duration.length == 0) {
                				update = update + "-duration";
							}
                			
                			if (movie.genre.length == 0) {
                				update = update + "-genre";
							}
                			
                			if (movie.music.length == 0) {
                				update = update + "-music";
							}
                			
                			if (movie.plott.length == 0) {
                				update = update + "-plott";
							}
                			
                			if (movie.premiere.length == 0) {
                				update = update + "-premiere";
							}
                			
                			if (movie.producer.length == 0) {
                				update = update + "-producer";
							}
                			
                			if (movie.regie.length == 0) {
                				update = update + "-regie";
							}
                			
                			if (movie.scenario.length == 0) {
                				update = update + "-scenario";
							}
                			
                			if (movie.scenarioactor.length == 0) {
                				update = update + "-scenarioactor";
							}
                			
                			if (movie.soundeffect.length == 0) {
                				update = update + "-soundeffect";
							}
                			
                			if (movie.titel.length == 0) {
                				update = update + "-titel";
							}
                			
                			if (movie.year.length == 0) {
                				update = update + "-year";
							}
                			
                			return update;
                		}
                	}
                    
                    //http://www.omdbapi.com/?t=tropic+thunder&y=&plot=short&r=json

                });
              </script>
            </head>
            <body>
              <div style="margin:5%">
                <button class='btn btn-default' id="update" name="update" type="button">Movies updaten</button>
                <table>
                	<tr>
                		<td>
                			
                		</td>
                	</tr>
                </table>
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
