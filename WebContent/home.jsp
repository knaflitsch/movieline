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
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css"
	rel="stylesheet">
<link href="res/assets/docs.css" rel="stylesheet">
<link href="res/css/style.css" rel="stylesheet">
<link href="res/css/carousel.css" rel="stylesheet">
<link href="res/css/component.css" rel="stylesheet">
<link href="res/css/content.css" rel="stylesheet">
<link href="res/css/demo.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./res/css/bootstrap.min.css">
<link href="res/css/normalize.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="./res/js/bootstrap.min.js"></script>
	
<script src="./res/js/modernizr.custom.js"></script>
<style>

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}
</style>

<script type="text/javascript">
	var searchIndex = 0;
	var movieArr = [];
	var lastGenre;
	var pointer = 0;
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

		function reloadCarussel() {
			switch (pointer) {
			case 0:
				loadData("comedy");
				break;

			default:
				break;
			}
			pointer++;
			if (pointer == 5) {
				pointer = 0;
			}
		}

		function loadData(genre) {
			$
					.ajax({
						headers : {
							Accept : 'application/json'
						},
						type : 'Get',
						contentType : 'application/json',
						type : 'GET',
						contentType : 'application/json',
						url : 'http://10.115.1.7:8080/Movieline/rest/movieDetails/movie/',
						url : 'http://10.115.1.7:8080/13_REST_Movieline/rest/movieDetails/movie/genre/'
								+ genre,
						success : function(data) {
							movieArr = data.movie;
							alert(movieArr.length);
							var html = +"<div class='item' >"
									+ "<div id='action' class='genre'>"
									+ "<h3 class='title'>"
									+ movieArr[0].genre
									+ "<span class='label label-success pull-right'></span>"
									+ "</h3>" + "<div class='list-group'>";

							lastGenre;
							for (i = 0; i < movieArr.length; i++) {
								lastGenre = movieArr[i].genre;
								//if (lastGenre == movieArr[i].genre) {
								html = html
										+ "<a href='#' class='list-group-item'>"
										+ "<span class='truncate pull-left' id='filmTitle'>"
										+ movieArr[i].titel
										+ "</span><span class='badge'>14views</span></a>";
								//}
								lastGenre = movieArr.genre;
								//i = movieArr.length;
							}
							html = html + "</div></div></div>";
							alert(html);
							$("#data").html(html);

							//console.log(data);

						},
						error : function(e) {
							console.log(e);
						}
					});
		}

		//Realtime Search function of Table
		var activeSystemClass = $('.list-group-item.active');

		//something is entered in search form
		$('#system-search')
				.keyup(
						function() {
							var addedQuery = false;
							searchIndex++;
							var that = this;
							// affect all table rows on in systems table
							var tableBody = $('.table-list-search tbody');
							var tableRowsClass = $('.table-list-search tbody tr');
							$('.search-sf').remove();
							tableRowsClass
									.each(function(i, val) {

										//Lower text for case insensitive
										var rowText = $(val).text()
												.toLowerCase();
										var inputText = $(that).val()
												.toLowerCase();

										if (inputText != '') {
											$('.search-query-sf').remove();
											tableBody
													.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
															+ $(that).val()
															+ '"</strong></td></tr>');
										} else {
											$('.search-query-sf').remove();
										}

										if (rowText.indexOf(inputText) == -1) {
											//hide rows
											tableRowsClass.eq(i).hide();

										} else {
											$('.search-sf').remove();
											tableRowsClass.eq(i).show();
										}
									});
							//all tr elements are hidden
							if (tableRowsClass.children(':visible').length == 0) {
								tableBody
										.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
							}
						});

	});
	//Realtime Search function of Table
	var activeSystemClass = $('.list-group-item.active');

	//something is entered in search form
	$('#system-search')
			.keyup(
					function() {
						var that = this;
						// affect all table rows on in systems table
						var tableBody = $('.table-list-search tbody');
						var tableRowsClass = $('.table-list-search tbody tr');
						$('.search-sf').remove();
						tableRowsClass
								.each(function(i, val) {

									//Lower text for case insensitive
									var rowText = $(val).text().toLowerCase();
									var inputText = $(that).val().toLowerCase();

									if (hasWhiteSpace(inputText)) {
										alert("true");
									}

									if (inputText != '') {
										$('.search-query-sf').remove();
										tableBody
												.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
														+ $(that).val()
														+ '"</strong></td></tr>');
									} else {
										$('.search-query-sf').remove();
									}

									if (rowText.indexOf(inputText) == -1) {
										//hide rows
										tableRowsClass.eq(i).hide();

									} else {
										$('.search-sf').remove();
										tableRowsClass.eq(i).show();
									}
								});
						//all tr elements are hidden
						if (tableRowsClass.children(':visible').length == 0) {
							tableBody
									.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
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
			<a class="navbar-brand" href="#"><img src="./res/img/movielinelogo.png" id="logo"></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">

				<li><a href="#"> </a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a> <input class="form-control" id="system-search"
						name="q" placeholder="Suche eingeben" required>
				</a></li>

				<li><a> <input id="userName" type="text"
						class="form-control" name="usr" placeholder="Admin">
				</a></li>

				<li><a><input id="password" type="password"
						class="form-control" name="pword" placeholder="Password"
						required=""> </a></li>

				<li><a href="#">
						<button id="loginBtn" type="submit" class="btn btn-info">Sign
							In</button>
				</a></li>

			</ul>
		</div>
	</div>
	<div class="carousel">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<table>
						<tr>
							<td><p>Hallo</p></td>
						</tr>
						<tr>
							<td><p>Hallo</p></td>
							<td><p>Hallo</p></td>
							<td><p>Hallo</p></td>
							<td><p>
								<div id="detailBtn">
									<div class="mockup-content">
										<div class="morph-button morph-button-modal morph-button-modal-1 morph-button-fixed">
											<button type="button" class="btn btn-info">Details</button>
											<div class="morph-content">
												<div>
													<div class="content-style-text">
														<span class="icon icon-close">Close the dialog</span>
														<h2>Informations</h2>
														<p>Fill in some informations about the movie!!</p>
														<p>
															<input id="terms" type="checkbox" /><label for="terms"></label>
														</p>
													</div>
												</div>
											</div>
										</div>
										<!-- morph-button -->
									</div>
									<!-- /form-mockup -->
									</section>
								</div> <!-- /container --> <script src="./res/js/classie.js"></script> 
								<script src="./res/js/uiMorphingButton_fixed.js"></script> 
								<script>
										(function() {
											var docElem = window.document.documentElement, didScroll, scrollPosition;

											// trick to prevent scrolling when opening/closing button
											function noScrollFn() {
												window
														.scrollTo(
																scrollPosition ? scrollPosition.x
																		: 0,
																scrollPosition ? scrollPosition.y
																		: 0);
											}

											function noScroll() {
												window
														.removeEventListener(
																'scroll',
																scrollHandler);
												window.addEventListener(
														'scroll', noScrollFn);
											}

											function scrollFn() {
												window
														.addEventListener(
																'scroll',
																scrollHandler);
											}

											function canScroll() {
												window.removeEventListener(
														'scroll', noScrollFn);
												scrollFn();
											}

											function scrollHandler() {
												if (!didScroll) {
													didScroll = true;
													setTimeout(function() {
														scrollPage();
													}, 60);
												}
											}
											;

											function scrollPage() {
												scrollPosition = {
													x : window.pageXOffset
															|| docElem.scrollLeft,
													y : window.pageYOffset
															|| docElem.scrollTop
												};
												didScroll = false;
											}
											;

											scrollFn();

											var UIBtnn = new UIMorphingButton(
													document
															.querySelector('.morph-button'),
													{
														closeEl : '.icon-close',
														onBeforeOpen : function() {
															// don't allow to scroll
															noScroll();
														},
														onAfterOpen : function() {
															// can scroll again
															canScroll();
														},
														onBeforeClose : function() {
															// don't allow to scroll
															noScroll();
														},
														onAfterClose : function() {
															// can scroll again
															canScroll();
														}
													});

											document
													.getElementById('terms')
													.addEventListener(
															'change',
															function() {
																UIBtnn.toggle();
															});
										})();
									</script>
								</td>
						</tr>
						<tr>
							<td><p>Hallo</p></td>
						</tr>
						<tr>
							<td><p>Hallo</p></td>
						</tr>

					</table>
				</div>
				<div class="item">
					<div id="table" class="col-md-10">
						<table id="data" class="table table-list-search">
							<thead>
								<tr>
									<th>Name</th>
									<th>Genre</th>
									<th>Release</th>
									<th>Info</th>
									<th>Actors</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
						</table>

					</div>
				</div>

				<div class="item">he</div>

				<div class="item">ho</div>
			</div>
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
		<br>
		<div id="footer">© Team Fenster</div>
	</div>
</body>
</html>