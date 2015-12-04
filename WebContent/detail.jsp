<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dr.Eier der Hydrapenis</title>
<script src="res/js/jquery.js" type="text/javascript"></script>
<script src="res/js/jquery-ui.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="res/css/jquery-ui.min.css">
<link
	href="//netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css"
	rel="stylesheet" id="bootstrap">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css"
	rel="stylesheet">
<link href="res/assets/docs.css" rel="stylesheet">
<link href="res/css/bootstrap.min.css" rel="stylesheet">
<link href="res/css/carousel.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {

		$(document).ready(function() {
			loadData();
			detail();
		
		});

		function loadData() {
			$.ajax({
				headers : {
					Accept : 'application/json'
				},
				type : 'GET',
				url : "http://10.115.1.7:8080/13_REST_Movieline/rest/movieDetails/movie",
		
				success : function(data) {
					alert("YES");
					var html = '<table class="table table-striped table-hover table-responsive"><tr class="fontrow"><td>ToDo</td><td class="col-md-1">check</td><td class="col-md-2">Delete</td></tr>';
					var movieArr = data.movieline;
					for (i = 0; i < movieArr.length; i++) {
						html = html + "<tr><td>" + movieArr[i].todo+ "</td><td align='center'><label><input type='checkbox' value=''></label></td><td align='center' data-id='"+todoArr[i].id+"' class='btn btn-danger' id='btnDel'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></td></tr>";

				}
					
					html = html + "</tabel>";
					$("#data").html(html);
			},
		
				error : function(e) {
					console.log(e);
				}
		
			});
		}
		
		function detail() {

		}
	});
</script>
<style>
	#movie {
		margin-top:100px;
		margin-left: auto ;
  		margin-right: auto ;
		width: 1000px;
		padding: 20px 20px 20px 20px;
		background-color:white;
	}

	#pic{
		width: 100px;
		heigt:200px;
		border-style: solid;
		float: left;
		margin-right: 10px;
	}

	#title{
		width: 5000;
		heigt: 50px;
	}

	#rightSide{
		margin-left:10px;
		width: 150px;
	}

	#content {
		margin-top:50px;
		margin-left: auto ;
  		margin-right: auto ;
		width: 1000px;
		padding: 20px 20px 20px 20px;
		background-color:white;
	}


</style>
</head>
<body>

	<div id="wrapper">
		<div id="movie">
			<div id="pic">Bild</div>
			<div id="rightSide">
				<div id="title">Title</div>
				<div id="year">Year</div>
				<div id="scenario">Scenario</div>
				<div id="plot">Plot</div>
				<div id="duration">Duration</div>
				<div id="primiere">Primiere</div>
				<div id="likes">Likes</div>
			</div>
		</div>

		<div id="content">
			<div id="actor">Actor</div>
			<div id="scenarioActor">ScenarioActor</div>
			<div id="country">Country</div>
			<div id="regie">Regie</div>
			<div id="genre">Genre</div>
			<div id="music">Music</div>
			<div id="soundeffect">Soundeffect</div>
			<div id="camera">Camera</div>
			<div id="producer">Producer</div>
			<div id="company">Company</div>
			<div id="ageRating">AgeRating</div>
		</div>
	</div>

</body>
</html>
