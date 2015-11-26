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
<script src="res/js/classie.js" type="text/javascript"></script>
<script src="res/js/modernizr.custom.js" type="text/javascript"></script>
<script src="res/js/uiMorphingButton_fixed.js" type="text/javascript"></script>
<script src="res/js/uiMorphingButton_inflow.js" type="text/javascript"></script>
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
<link href="res/css/component.css" rel="stylesheet">
<link href="res/css/content.css" rel="stylesheet">
<link href="res/css/demo.css" rel="stylesheet">
<link href="res/css/normalize.css" rel="stylesheet">
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
							Accept : 'application/json'
						},
						type : 'Get',
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
			<a class="navbar-brand" href="#"><img
				src="./res/img/movielinelogo.png" alt="Mountain View"
				style="height: 60px; padding-bottom: 30px;">
			<p style="float: left;">Find your Movies.</p></a>

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
						<button id="loginBtn" type="submit" class="btn btn-info">Sign
							In</button>
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
			<div class="carousel-inner" role="listbox" id="data">
				<div class="item active"><section>
	<p>
		Click the button below to see it expanding into a <strong>modal
			dialog</strong>:
	</p>
	<div class="mockup-content">
		<span></span><span></span><span></span><span></span>
		<div
			class="morph-button morph-button-modal morph-button-modal-1 morph-button-fixed">
			<button type="button">Terms &amp; Conditions</button>
			<div class="morph-content">
				<div>
					<div class="content-style-text">
						<span class="icon icon-close">Close the dialog</span>
						<h2>Terms &amp; Conditions</h2>
						<p>
							Pea horseradish azuki bean lettuce avocado asparagus okra.
							Kohlrabi radish okra azuki bean corn fava bean mustard tigernut
							juccama green bean celtuce collard greens avocado quandong <strong>fennel
								gumbo</strong> black-eyed pea. Grape silver beet watercress potato
							tigernut corn groundnut. Chickweed okra pea winter purslane
							coriander yarrow sweet pepper radish garlic brussels sprout
							groundnut summer purslane earthnut pea <strong>tomato
								spring onion</strong> azuki bean gourd.
						</p>
						<p>
							<input id="terms" type="checkbox" /><label for="terms">I
								accept the terms &amp; conditions.</label>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- morph-button -->
		<span></span> <span></span>
	</div>
	<!-- /form-mockup --> </section>
	</div>
	<!-- /container -->
	<script src="res/js/classie.js"></script>
	<script src="res/js/uiMorphingButton_fixed.js"></script>
	<script>
			(function() {	
				var docElem = window.document.documentElement, didScroll, scrollPosition;

				// trick to prevent scrolling when opening/closing button
				function noScrollFn() {
					window.scrollTo( scrollPosition ? scrollPosition.x : 0, scrollPosition ? scrollPosition.y : 0 );
				}

				function noScroll() {
					window.removeEventListener( 'scroll', scrollHandler );
					window.addEventListener( 'scroll', noScrollFn );
				}

				function scrollFn() {
					window.addEventListener( 'scroll', scrollHandler );
				}

				function canScroll() {
					window.removeEventListener( 'scroll', noScrollFn );
					scrollFn();
				}

				function scrollHandler() {
					if( !didScroll ) {
						didScroll = true;
						setTimeout( function() { scrollPage(); }, 60 );
					}
				};

				function scrollPage() {
					scrollPosition = { x : window.pageXOffset || docElem.scrollLeft, y : window.pageYOffset || docElem.scrollTop };
					didScroll = false;
				};

				scrollFn();

				var UIBtnn = new UIMorphingButton( document.querySelector( '.morph-button' ), {
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
				} );

<<<<<<< HEAD
				document.getElementById( 'terms' ).addEventListener( 'change', function() {
					UIBtnn.toggle();
				} );
			})();
		</script></div>
=======
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" id="data">
<<<<<<< HEAD

=======
>>>>>>> f607956576f1fcf27e9cba972dcbc2191f2d122c
				<div class="item active">HALLO</div>
>>>>>>> caf76330440024f4df0747c6439b5a3e16bb8884

				<div class="item">SERVUS</div>
			</div>
<<<<<<< HEAD

				<div class="item active">
						HALLO
				</div>

				<div class="item">
						SERVUS
				</div>
			</div>

			<div id="footer">©</div>
=======
		</div>

		<div id="footer">©</div>
>>>>>>> f607956576f1fcf27e9cba972dcbc2191f2d122c


		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
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