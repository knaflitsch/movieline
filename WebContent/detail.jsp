<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dr.Eier der Hydrapenis</title>
<script src="res/js/jquery.js" type="text/javascript"></script>
<script src="res/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="like-dislike-master/js/like-dislike.min.js"></script>
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
			like();
			detail();
		
		});
		
		function like(){
			$('#rating').likeDislike({
			    reverseMode: true,
			    activeBtn: localStorage['key']? localStorage['key'] : '',
			    click: function(btnType, likes, dislikes, event) {
			      var self = this;

			      // lock the buttons
			      self.readOnly(true);

			      // send data to the server
			      $.ajax({
			        url: '/action',
			        type: 'GET',
			        data: 'id=1' + '&likes=' + likes + '&dislikes=' + dislikes,
			        success: function (data) {
			          // show new values
			          $(self).find('.likes').text(data.likes);
			          $(self).find('.dislikes').text(data.dislikes);
			          localStorage['key'] = btnType;

			          // unlock the buttons
			          self.readOnly(false);
			        }
			      });
			    }
			  });
		}
		

		function loadData() {
			$.ajax({
				headers : {
					Accept : 'application/json'
				},
				type : 'GET',
				url : "http://10.115.1.7:8080/13_REST_Movieline/rest/movieDetails/movie/id",
		
				success : function(data) {
					var html = '<div id="rest"><table><tr><td>Titel</td><td>Jahr</td><td>Stern</td><td>Inhalt</td><td></td>Urauffuehrung<td></td><td>Drehbuch</td><td></td>Laenge<td></td><td>Land</td><td>Regie</td><td>FSK-Freigabe</td><td>Kamera</td><td>Musik</td><td>Drehbuchautor</td><td>Ton</td><td>Produktionsfirma</td><td>Produzent</td><td>Genre</td></tr>';
					var movieArr = data.movie;
					for (i = 0; i < movieArr.length; i++) {
						html = html + "<tr><td>" + movieArr[i].titel + "</td>"+
						"<td>"+ movieArr[i].year +"</td>"+
						"<td>"+ movieArr[i].likes +"</td>"+
						"<td>"+ movieArr[i].plott +"</td>"+
						"<td>"+ movieArr[i].premiere +"</td>"+
						"<td>"+ movieArr[i].scenario +"</td>"+
						"<td>"+ movieArr[i].duration +"</td>"+
						"<td>"+ movieArr[i].country +"</td>"+
						"<td>"+ movieArr[i].regie +"</td>"+
						"<td>"+ movieArr[i].agerating +"</td>"+
						"<td>"+ movieArr[i].camera +"</td>"+
						"<td>"+ movieArr[i].music +"</td>"+
						"<td>"+ movieArr[i].scenarioactor +"</td>"+
						"<td>"+ movieArr[i].soundeffect +"</td>"+	
						"<td>"+ movieArr[i].company +"</td>"+
						"<td>"+ movieArr[i].producer +"</td>"+
						"<td>"+ movieArr[i].genre +"</td>"+
						"</tr>";

				}
					
					html = html + "</table></div>";
					$("#wrapper").html(html);
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
	#rest {
		margin-top:100px;
		margin-left: auto ;
  		margin-right: auto ;
		width: 80%;
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
		
		<div id="rating">
		  <button class="like">Like</button>
		  <span class="likes">0</span>
		  <button class="dislike">Dislike</button>
		  <span class="dislikes">0</span>
		</div>

	</div>

	
</body>
</html>
