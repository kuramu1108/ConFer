<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
				<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
				<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
				<script src="custom_js/validate.js"></script>
				<title>Vote</title>
				<style>

				</style>
			</head>
			<body>
				<nav class="navbar navbar-inverse">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand" href="index.jsp">ConFer</a>
						</div>
<!--        			top right functionality buttons  	below					-->
						<xsl:apply-templates select="confer/login"/>
<!--          			top right functionality buttons  	above					--> 
					</div>
				</nav>
				<xsl:apply-templates select="confer/poll" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="poll">
	<xsl:choose>
		<xsl:when test="id">
		<div class="container com-sm-12">
			<form role="form" id="voteForm" method="POST" action="summaryPage.jsp" onsubmit="return validateVote();">
				<input type="hidden" name="pollID" value="{id}"/>
				<div class="form-group">
					<label for="title">Title:</label>
					<div>
						<xsl:value-of select="title" />
					</div>
				</div>

				<div class="form-group">
					<label for="creator">Date Created:</label>
					<div>
						<xsl:value-of select="creationDate" />
					</div>
				</div>

				<div class="form-group">
					<label for="creator">Creator:</label>
					<div>
						<xsl:value-of select="creatorName" />
					</div>
				</div>

				<div class="form-group">
					<label for="location">Meeting Location:</label>
					<div>
						<xsl:value-of select="location" />
					</div>
				</div>

				<div class="form-group">
					<label for="description">Description:</label>
					<p>
						<xsl:value-of select="description" />
					</p>
				</div>


				<div class="form-group" style="inline-table">
					<label for="title">Time Options:</label>

					<xsl:apply-templates select="timeOptions" />

				</div>

				<div class="form-group">
					<label for="voterName">Voter Full Name: <span style="color:red">*</span></label>
					<div id="name-div">
						<xsl:choose>
							<xsl:when test="/confer/login/user">
								<input type="text" class="form-control" style="width: 300px;"
							id="name" name="name" value="{/confer/login/user/name}"/>
							</xsl:when>
							<xsl:otherwise>
								<input type="text" class="form-control" style="width: 300px;"
							id="name" name="name"/>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>

				<button type="submit" class="btn btn-default">Submit</button>
			</form>
				<form role="form" method="GET" action="summaryPage.jsp" style="float:left">
					<input type="hidden" name="pollID" value="{id}"/>
					<button type="submit" class="btn btn-info">See Current Summary</button>
				</form>
		</div>
		</xsl:when>
		<xsl:otherwise>
			<div class="container com-sm-12">
				<xsl:apply-templates select="error"/>
			</div>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="timeOptions">
		<div class="form" id="timeOptions-div">
			<xsl:apply-templates select="timeOption"/>
		</div>
	</xsl:template>

	<xsl:template match="timeOption">
		<div class="checkbox">
			<label style="width:200px">
				<input type="checkbox" name="timeOption" value="{.}"/> 
				<xsl:apply-templates/>
			</label>
		</div>
	</xsl:template>
	
	<xsl:template match="login">
	<xsl:choose>
		<xsl:when test="user">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="userPage.jsp"><span class="glyphicon glyphicon-home"></span>Home</a></li>
				<li><a href="userPage.jsp?state=logout"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
			</ul>
		</xsl:when>
		<xsl:otherwise>
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
								<button type="button" class="close" data-dismiss="modal">x</button>
								<h4 class="modal-title">Already a User?</h4>
							</div>
			
							<div class="modal-body">
								<div class="container">
									<h2 align="left">Login</h2>
									<form class="form-horizontal" role="form" method="POST" action="userPage.jsp?state=login" id="loginForm" onsubmit="return validateLogin();">
										<div class="form-group">
											<label class="control-label col-sm-2" for="email">Email: <span style='color:red'>*</span></label>
											<div class="col-sm-4" id="email-div">
												<input type="text" class="form-control" id="email" name="email"
													placeholder="Enter email" />
											</div>
										</div>
			
										<div class="form-group" id="password-div">
											<label class="control-label col-sm-2" for="pwd">Password: <span style='color:red'>*</span></label>
											<div class="col-sm-4">
												<input type="password" class="form-control" id="password" name="password"
													placeholder="Enter password" />
											</div>
										</div>
									</form>
								</div>
			
								<div class="modal-footer">
									<button type="submit" class="btn btn-default" form="loginForm">Login</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</ul>
		</xsl:otherwise>
	</xsl:choose>
	</xsl:template>
	
	<xsl:template match="error">
		<p>Oops! seems like something wrong happened<br></br>ERROR: <xsl:apply-templates/></p>
	</xsl:template>
</xsl:stylesheet>