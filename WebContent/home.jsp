<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Movieline</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="res/images/thet.png">
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
<link href="res/css/style.css" rel="stylesheet">
<link href="res/css/bootstrap.min.css" rel="stylesheet">
<link href="res/css/carousel.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}
</style>

<script type="text/javascript">
	var movieArr;
	var lastGenre;
	function hideElements() {
		$("#logout").hide();

	}

	$(function() {

		$(document).ready(function() {
			login();
			logout();
			hideElements();
			loadData();
		});

		function login() {
			$("#loginBtn").click(function() {
				var un = $("#userName").val();
				var pw = $("#password").val();
				if (un == '' || pw == '') {
					$('#userName');
					$('#password');
					alert("Please fill all fields...!!!!!!");
				} else {
					if ((un == 'admin') && (pw == '123')) {
						alert("Yesssss");
						$("#login").hide();
						$('#logout').show();

					} else {
						alert("Noooooo");
					}
				}

			});

		}
		function hideElements() {
			$("#logout").hide();
		}

		function logout() {
			$("#logoutBtn").click(function() {
				$("#userName").val("");
				$("#password").val("");
				$("#login").show();
				$('#logout').hide();
				alert("tschau");
			});
		}

		function loadData() {
			alert("hello");
			$
					.ajax({
						headers : {
							Accept : 'application/json',
						},
						contentType : 'application/json',
						type : 'GET',
						url : 'http://10.115.1.7:8080/Movieline/rest/movieDetails/movie/',
						success : function(data) {
							var html = +"<div class='item' >"
									+ "<div id='action' class='genre'>"
									+ "<h3 class='title'>"
									+ movieArr.genre
									+ "<span class='label label-success pull-right'></span>"
									+ "</h3>" + "<div class='list-group'>";

							movieArr = data.movie;
							lastGenre;
							for (i = 0; i < movieArr.length; i++) {
								lastGenre = movieArr.genre;
								while (lastGenre == movieArr.genre) {
									html = html
											+ "<a href='#' class='list-group-item'>"
											+ "<span class='truncate pull-left' id='filmTitle'>"
											+ movieArr.title
											+ "</span><span class='badge'>14views</span></a></div></div></div>";
								}
								lastGenre = movieArr.genre;
								i = movieArr.length;
							}
							//html = html + "</tr>";
							$("#data").html(html);

							//console.log(data);

						},
						error : function(e) {
							console.log(e);
						}
					});
		}
	});
</script>
</head>
<body>
	<div id="navbar" class="navbar navbar-default">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Movieline</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">

				<li><a href="#"> </a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="#"> <input id="userName" type="text"
						class="form-control" name="usr" placeholder="Admin">
				</a></li>
				<li><a href="#"><input id="password" type="password"
						class="form-control" name="pword" placeholder="Password"
						required=""> </a></li>
				<li><a href="#">
						<button id="loginBtn" type="submit">Sign In</button>
				</a></li>
			</ul>
		</div>
	</div>

	<div class="carousel">
		<br>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" id="data"></div>
			<div id="footer">©</div>


			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<div id="footer">© Team Fenster and Sam</div>
	</div>
</body>
</html>