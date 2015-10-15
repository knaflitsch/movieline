<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<link href="res/css/bootstrap.min.css" rel="stylesheet">
<link href="res/css/carousel.css" rel="stylesheet">
</head>
<<<<<<< HEAD


<script>
	$(function(){
		
		$(document).ready(function(){
			login();
		});
		
		
		function login() {
		 	$("#loginBtn").click(function(){
		 		var un = $("#userName").val();	 		
		 		var pw = $("#password").val();
		 		if (un == '' || pw == '') {
		            $('#userName');
		            $('#password');
		            alert("Please fill all fields...!!!!!!");
		        }else{
		        	if((un == 'admin') && (pw == '123')){
		        		alert("Yesssss");
		        	} else{
		        		alert("Noooooo");
		        	}
		        }
		        
		 	});
		 	
		 	
		}
	});
		
</script>
=======
>>>>>>> c8d5255bda38f72b0a4c14730d9e237a6733edec
<body>
	<div id="wrapper">
		<div id="menuebar"></div>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">

					<div class="container">
						<div class="carousel-caption" style="color: #5a5a5a;">
							<h1>Überschrift 1</h1>
							<p>Text</p>
							<p>
								<a class="btn2" href="History.jsp" role="button">>Mehr Anzeigen</a>
							</p>
						</div>
					</div>
				</div>
				<div class="item">

					<div class="container">
						<div class="carousel-caption" style="color: #5a5a5a;">
							<h1>Überschrift 2</h1>
							<p>Text 2</p>

							<p>
								<a class="btn2" href="#" role="button">Mehr Anzeigen</a>
							</p>
						</div>
					</div>
				</div>
				<div class="item">

<<<<<<< HEAD
	<div id="login">
	
		
			<h1 class="form-signin-heading text-muted">Sign In</h1>
			<input id="userName" type="text" class="form-control" name="usr" placeholder="Admin">
			<input id="password" type="password" class="form-control" name="pword" placeholder="Password" required="">
			<button id="loginBtn"class="btn btn-lg btn-primary btn-block" type="submit">
				Sign In
			</button>
		
	
=======
					<div class="container">
						<div class="carousel-caption" style="color: #5a5a5a;">
							<h1>Überschrift 3</h1>
							<p>Text 3</p>
							<p>
								<a class="btn2" href="#" role="button">Mehr Anzeigen</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Zurück</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Weiter</span>
			</a>
		</div>
		<!-- /.carousel -->
>>>>>>> c8d5255bda38f72b0a4c14730d9e237a6733edec
	</div>

</body>
</html>