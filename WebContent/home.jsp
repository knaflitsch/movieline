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
<<<<<<< HEAD
<link href="res/css/component.css" rel="stylesheet">
<link href="res/css/content.css" rel="stylesheet">
<link href="res/css/demo.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="./res/css/bootstrap.min.css">
<link href="res/css/normalize.css" rel="stylesheet">
=======
>>>>>>> e4d4ed4ade696c5e0062ade1dabe2f9f91355991
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
		
		function reloadCarussel(){
			switch (pointer) {
			case 0:
				loadData("comedy");
				break;

			default:
				break;
			}
			pointer++;
			if (pointer == 5){
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
<<<<<<< HEAD
						type : 'GET',
						contentType : 'application/json',
						url : 'http://10.115.1.7:8080/Movieline/rest/movieDetails/movie/',
=======
						url : 'http://10.115.1.7:8080/13_REST_Movieline/rest/movieDetails/movie/genre/'+genre,
>>>>>>> e4d4ed4ade696c5e0062ade1dabe2f9f91355991
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
	    $('#system-search').keyup( function() {
	    	var addedQuery = false;
	    	searchIndex++;
	       var that = this;
	        // affect all table rows on in systems table
	        var tableBody = $('.table-list-search tbody');
	        var tableRowsClass = $('.table-list-search tbody tr');
	        $('.search-sf').remove();
	        tableRowsClass.each( function(i, val) {
	        
	            //Lower text for case insensitive
	            var rowText = $(val).text().toLowerCase();
	            var inputText = $(that).val().toLowerCase();
	            
	            if(inputText != '')
	            {
	                $('.search-query-sf').remove();
	                tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
	                    + $(that).val()
	                    + '"</strong></td></tr>');
	            }
	            else
	            {
	                $('.search-query-sf').remove();
	            }

	            if( rowText.indexOf( inputText ) == -1 )
	            {
	                //hide rows
	                tableRowsClass.eq(i).hide();
	                
	            }
	            else
	            {
	                $('.search-sf').remove();
	                tableRowsClass.eq(i).show();
	            }
	        });
	        //all tr elements are hidden
	        if(tableRowsClass.children(':visible').length == 0)
	        {
	            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
	        }
	    });
		
	});
<<<<<<< HEAD
	
	
	
	//Realtime Search function of Table
    var activeSystemClass = $('.list-group-item.active');

    //something is entered in search form
    $('#system-search').keyup( function() {
       var that = this;
        // affect all table rows on in systems table
        var tableBody = $('.table-list-search tbody');
        var tableRowsClass = $('.table-list-search tbody tr');
        $('.search-sf').remove();
        tableRowsClass.each( function(i, val) {
        
            //Lower text for case insensitive
            var rowText = $(val).text().toLowerCase();
            var inputText = $(that).val().toLowerCase();
            
            if (hasWhiteSpace(inputText)) {
				alert("true");
			}
            
            if(inputText != '')
            {
                $('.search-query-sf').remove();
                tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>Searching for: "'
                    + $(that).val()
                    + '"</strong></td></tr>');
            }
            else
            {
                $('.search-query-sf').remove();
            }

            if( rowText.indexOf( inputText ) == -1 )
            {
                //hide rows
                tableRowsClass.eq(i).hide();
                
            }
            else
            {
                $('.search-sf').remove();
                tableRowsClass.eq(i).show();
            }
        });
        //all tr elements are hidden
        if(tableRowsClass.children(':visible').length == 0)
        {
            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
        }
    });
=======

	
>>>>>>> e4d4ed4ade696c5e0062ade1dabe2f9f91355991
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
				<li><a> <input class="form-control" id="system-search"
						name="q" placeholder="Suche eingeben" required>
				</a></li>
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
<<<<<<< HEAD

=======
		<div id=adminTable class="col-md-2">
			<div class="input-group">
				<input class="form-control" id="system-search" name="q"
					placeholder="Suche eingeben" required>
			</div>
			<div style="margin-top: 5px;" id="componentsGlyph"></div>
		</div>
>>>>>>> e4d4ed4ade696c5e0062ade1dabe2f9f91355991
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
<<<<<<< HEAD
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
										<div
											class="morph-button morph-button-modal morph-button-modal-1 morph-button-fixed">
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
								</div> <!-- /container --> <script src="res/js/classie.js"></script> <script
									src="res/js/uiMorphingButton_fixed.js"></script> <script>
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

				document.getElementById( 'terms' ).addEventListener( 'change', function() {
					UIBtnn.toggle();
				} );
			})();
		</script>
								</p></td>
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
					<div class="carousel-inner" role="listbox" id="data">
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
							<table>
								<tbody>
									<tr id="tableRow_1">
										<td>Them Hoes</td>
										<td>Hardcore XXX</td>
										<td>1999</td>
										<td class="infoTD">Lorem ipsum dolor sit amet, consetetur
											sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
											labore et dolore magna aliquyam erat, sed diam voluptua. At
											vero eos et accusam et justo duo dolores et ea rebum. Stet
											clita kasd gubergren, no sea takimata sanctus est Lorem ipsum
											dolor sit amet. Lorem ipsum dolor sit amet, consetetur
											sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
											labore et dolore magna aliquyam erat, sed diam voluptua. At
											vero eos et accusam et justo duo dolores et ea rebum. Stet
											clita kasd gubergren, no sea takimata sanctus est Lorem ipsum
											dolor sit amet.</td>
										<td>Some Fags</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr id="tableRow_2">
										<td>Racing Grid eXtReME</td>
										<td>Hardcore Race</td>
										<td>1752</td>
										<td class="infoTD">Lorem ipsum dolor sit amet, consetetur
											sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
											labore et dolore magna aliquyam erat, sed diam voluptua. At
											vero eos et accusam et justo duo dolores et ea rebum. Stet
											clita kasd gubergren, no sea takimata sanctus est Lorem ipsum
											dolor sit amet. Lorem ipsum dolor sit amet, consetetur
											sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
											labore et dolore magna aliquyam erat, sed diam voluptua. At
											vero eos et accusam et justo duo dolores et ea rebum. Stet
											clita kasd gubergren, no sea takimata sanctus est Lorem ipsum
											dolor sit amet.</td>
										<td>Some more Fags</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr id="tableRow_3">
										<td>Fishing Lies Within</td>
										<td>Hardcore XXX Documentray</td>
										<td>2202</td>
										<td class="infoTD">Lorem ipsum dolor sit amet, consetetur
											sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
											labore et dolore magna aliquyam erat, sed diam voluptua. At
											vero eos et accusam et justo duo dolores et ea rebum. Stet
											clita kasd gubergren, no sea takimata sanctus est Lorem ipsum
											dolor sit amet. Lorem ipsum dolor sit amet, consetetur
											sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
											labore et dolore magna aliquyam erat, sed diam voluptua. At
											vero eos et accusam et justo duo dolores et ea rebum. Stet
											clita kasd gubergren, no sea takimata sanctus est Lorem ipsum
											dolor sit amet.</td>
										<td>Some stupid Fags</td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr id="tableRow_4">
										<td>Milos in the Hawt</td>
										<td>Hardcore Action Sheit</td>
										<td>2016</td>
										<td class="infoTD">Lorem ipsum dolor sit amet, consetetur
											sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
											labore et dolore magna aliquyam erat, sed diam voluptua. At
											vero eos et accusam et justo duo dolores et ea rebum. Stet
											clita kasd gubergren, no sea takimata sanctus est Lorem ipsum
											dolor sit amet. Lorem ipsum dolor sit amet, consetetur
											sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
											labore et dolore magna aliquyam erat, sed diam voluptua. At
											vero eos et accusam et justo duo dolores et ea rebum. Stet
											clita kasd gubergren, no sea takimata sanctus est Lorem ipsum
											dolor sit amet.</td>
										<td>The bals Fag</td>
									</tr>
								</tbody>
							</table>
					</div>
				</div>

				<div class="item">he</div>

				<div class="item">ho</div>
			</div>

=======
			<div class="carousel-inner" role="listbox" id="data">
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
				<div class="item active">
					<table class="table table-list-search">
						<tbody>
							<tr id="tableRow_1">
								<td>Them Hoes</td>
								<td>Hardcore XXX</td>
								<td>1999</td>
								<td class="infoTD">Lorem ipsum dolor sit amet, consetetur
									sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
									labore et dolore magna aliquyam erat, sed diam voluptua. At
									vero eos et accusam et justo duo dolores et ea rebum. Stet
									clita kasd gubergren, no sea takimata sanctus est Lorem ipsum
									dolor sit amet. Lorem ipsum dolor sit amet, consetetur
									sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
									labore et dolore magna aliquyam erat, sed diam voluptua. At
									vero eos et accusam et justo duo dolores et ea rebum. Stet
									clita kasd gubergren, no sea takimata sanctus est Lorem ipsum
									dolor sit amet.</td>
								<td>Some Fags</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div id="footer">©</div>


>>>>>>> e4d4ed4ade696c5e0062ade1dabe2f9f91355991
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
<<<<<<< HEAD

		<br>
=======
>>>>>>> e4d4ed4ade696c5e0062ade1dabe2f9f91355991
		<div id="footer">© Team Fenster and Sam</div>
	</div>
</body>
</html>