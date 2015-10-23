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
<script type="text/javascript">

	$(function(){
		
		$("#searchBtn").click(function(){
			alert($("#searchField").val());
		});
		
	});
		
</script>
</head>
<body>
	<div style="margin:5%">
		<input id="searchField" type="text" name='roboSearch' placeholder="Search for ..." class='form-control'>
		<button id="searchBtn" title="Search" class="btn btn-default">Search</button>
	</div>
</body>
</html>