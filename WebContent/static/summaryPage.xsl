<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<link rel="stylesheet"
					href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
				<script
					src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
				<script>
					$(document).ready(function(){
					$("#1").hide();
					$("#show").click(function(){
					$("#1").show();
					});
					$("#hide").click(function(){
					$("#1").hide();
					});
					});
				</script>
				<title>Summary</title>
			</head>
			<body>

				<nav class="navbar navbar-inverse">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand" href="#">ConFer</a>
						</div>

						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="#">
									<span class="glyphicon glyphicon-user"></span>
									Sign Up
								</a>
							</li>
							<li>
								<a href="#" data-toggle="modal" data-target="#loginModal">
									<span class="glyphicon glyphicon-log-in"></span>
									Login
								</a>
							</li>

							<!-- Login modal content -->
							<div id="loginModal" class="modal fade" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;
											</button>
											<h4 class="modal-title">Login</h4>
										</div>

										<div class="modal-body">
											<div class="container">
												<h2 align="left">Login</h2>
												<form class="form-horizontal" role="form">
													<div class="form-group">
														<label class="control-label col-sm-2" for="email">Email:</label>
														<div class="col-sm-4">
															<input type="text" class="form-control" id="email"
																placeholder="Enter email"></input>
														</div>
													</div>

													<div class="form-group">
														<label class="control-label col-sm-2" for="pwd">Password:</label>
														<div class="col-sm-4">
															<input type="password" class="form-control" id="pwd"
																placeholder="Enter password"></input>
														</div>
													</div>
												</form>

											</div>

											<div class="modal-footer">
												<button type="submit" class="btn btn-default">Login</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>

							</div>
						</ul>
					</div>
				</nav>

				<xsl:apply-templates select="/polls/list/entry" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="/polls/list/entry">
		<xsl:choose>
			<xsl:when test="key = 1">
				<xsl:apply-templates select="value" />
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="value">
		<div class="container com-sm-12">
			<form role="form">
				<div class="form-group">
					<label for="title">Title:</label>
					<div> 
						Final iteration meeting something very new and very long 
					</div>
				</div>

				<div class="form-group">
					<label for="creator">Date Created:</label>
					<div> 22/07/2019 </div>
				</div>

				<div class="form-group">
					<label for="creator">Creator:</label>
					<div> Solo Original Lemon </div>
				</div>

				<div class="form-group">
					<label for="location">Meeting Location:</label>
					<div> B11.B03.400 </div>
				</div>

				<div class="form-group">
					<label for="description">Description:</label>
					<p> Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nam
						pulvinar velit dui, vitae pretium erat lacinia id. Integer
						fringilla aliquet tempus. Suspendisse lacinia, arcu a
						scelerisque dictum,
						leo magna gravida magna, a tincidunt nulla
						odio nec ex. Integer
						pharetra
						vulputate quam vitae faucibus. Ut
						venenatis, ante vel sodales fermentum,
						ex augue sagittis nunc,
						nec viverra ex libero at nisi. Aenean eu
						varius odio.
						Cras odio
						nibh, consectetur eu consectetur id, consequat nec orci.
						Pellentesque
						at turpis pharetra, mollis quam pulvinar, dapibus
						dui.

						Etiam molestie, risus eget tempus condimentum, ligula nibh
						iaculis
						urna, tincidunt
						ullamcorper eros quam quis arcu. Donec
						dignissim tincidunt massa eget
						porta. Mauris
						ligula ante,
						condimentum eget convallis ut, condimentum quis odio. In
						dictum
						massa
						vel lorem rhoncus, ut posuere dui commodo. Aliquam ut
						tempor purus.
						Duis lacinia
						cursus eros, vel viverra sapien
						bibendum sit amet. Nullam ut sagittis
						dui, vitae blandit
						lorem.
						Aliquam erat volutpat. Nunc et interdum eros, vel aliquet
						felis.
						Phasellus a nibh est.
						Curabitur venenatis mi id hendrerit
						commodo. Aenean rutrum dignissim
						nisi, eu consectetur
						massa congue
						vel. Phasellus commodo viverra leo ut imperdiet. Nunc
						sagittis
						non augue eu ullamcorper. 
	</p>
				</div>


				<div class="form-group" style="inline-table">
					<label for="title">Time choice:</label>
					<div class="form inline">
						<ul>
							<li>
								<label style="width:100px">12/JAN/2016</label>
								<label>09.00</label>
							</li>
							<li>
								<label style="width:100px">12/JAN/2016</label>
								<label>13.00</label>
							</li>
							<li>
								<label style="width:100px">21/MAY/2019</label>
								<label>14.00</label>
							</li>
							<li>
								<label style="width:100px">31/DEC/2020</label>
								<label>24.00</label>
							</li>
						</ul>
					</div>
				</div>

				<button type="button" class="btn btn-default" id="show">Show
					result</button>
				<button type="button" class="btn btn-default" id="hide">Hide
					result</button>
				<button type="submit" class="btn btn-default">Close Poll</button>


				<div id="1" class="container col-sm-12" style="margin-top:20px;">
					<div class="panel-group">
						<div class="panel panel-default">
							<div class="panel-heading clearfix">
								<p class="panel-title pull-left" style="padding-top: 7.5px;">Summary table of the
									poll </p>
								<div class="panel-body">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>Choice</th>
												<th>Date</th>
												<th>Time</th>
												<th>Result</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>#1</td>
												<td>12/JAN/2016</td>
												<td>09.00</td>
												<td></td>
											</tr>

											<tr>
												<td>#2</td>
												<td>12/JAN/2016</td>
												<td>13.00</td>
												<td></td>
											</tr>

											<tr>
												<td>#3</td>
												<td>21/MAY/2019</td>
												<td>14.00</td>
												<td></td>
											</tr>

											<tr>
												<td>#4</td>
												<td>31/DEC/2020</td>
												<td>24.00</td>
												<td></td>
											</tr>
										</tbody>
									</table>

									<p>Number of voters: 200</p>
								</div>
							</div>
						</div>
					</div>

				</div>

			</form>
		</div>

	</xsl:template>
</xsl:stylesheet>