<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="res/css/login.css" rel="stylesheet">
<link href="res/css/bootstrap.css" rel="stylesheet">
<script src="./res/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript"></script>
</head>


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
<body>



	

	<div id="login">
	
		
			<h1 class="form-signin-heading text-muted">Sign In</h1>
			<input id="userName" type="text" class="form-control" name="usr" placeholder="Admin">
			<input id="password" type="password" class="form-control" name="pword" placeholder="Password" required="">
			<button id="loginBtn"class="btn btn-lg btn-primary btn-block" type="submit">
				Sign In
			</button>
		
	
	</div>
</body>
</html>