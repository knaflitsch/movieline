<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flo du Kranka Biasch</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="res/images/thet.png">
<script src="res/js/jquery.js" type="text/javascript"></script>
<script src="res/js/jquery-ui.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="res/css/jquery-ui.min.css">
<link href="//netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css" rel="stylesheet" id="bootstrap">
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
<link href="res/assets/docs.css" rel="stylesheet">
<link href="res/css/bootstrap.min.css" rel="stylesheet">
<link href="res/css/carousel.css" rel="stylesheet">


<script type="text/javascript">

	function hideElements(){
		$("#logout").hide();
	}


	$(function(){
		
		$(document).ready(function(){
			login();
			logout();
			hideElements();
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
		        		$("#login").hide();
		        		$('#logout').show();
		        		
		        	} else{
		        		alert("Noooooo");
		        	}
		        }
		        
		 	});
		 	
		 	
		}
		
		function logout() {
			$("#logoutBtn").click(function(){
				$("#userName").val("");
				$("#password").val("");
				$("#login").show();
        		$('#logout').hide();
        		alert("tschau");
			});
		}
	});
		
</script>
</head>
<body>
	<div id="login">
			<h1 class="form-signin-heading text-muted">Sign In</h1>
			<input id="userName" type="text" class="form-control" name="usr" placeholder="Admin">
			<input id="password" type="password" class="form-control" name="pword" placeholder="Password" required="">
			<button id="loginBtn"class="btn btn-lg btn-primary btn-block" type="submit">
				Sign In
			</button>
	</div>
	<div id="logout">
		<button id="logoutBtn"class="btn btn-lg btn-primary btn-block" type="delete">Logout</button>
	</div>
</body>
</html>