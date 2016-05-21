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
				<script src="custom_js/validate.js"></script>
				<title>Summary</title>
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
		<xsl:when test="error">
			<div class="container com-sm-12">
				<xsl:apply-templates select="error"/>
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div class="container com-sm-12">
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


				<div id="1" class="container col-sm-12" style="margin-top:20px;">
					<div class="panel-group">
						<div class="panel panel-default">
							<div class="panel-heading clearfix">
								<p class="panel-title pull-left" style="padding-top: 7.5px;">Poll Summary</p>
								<div class="panel-body">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>Date Time</th>
												<th>Votes</th>
											</tr>
										</thead>
										<tbody>
											<xsl:apply-templates select="timeOptions/timeOption"/>
										</tbody>
									</table>

									<p>
										Total Voters:  <xsl:value-of select="totalResponse"/>
										<br></br>
										<xsl:apply-templates select="responsers"/>
										<xsl:apply-templates select="highestResponses"/>
									</p>
								</div>
							</div>
						</div>
					</div>
					<xsl:choose>
						<xsl:when test="/confer/login/user">
							<form action="userPage.jsp">
								<button type="submit" class="btn btn-default">Back to home page</button>
							</form>
						</xsl:when>
						<xsl:otherwise>
							<form action="index.jsp">
								<button type="submit" class="btn btn-default">Back to home page</button>
							</form>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="status='OPEN'">
							<form role="form" method="GET" action="votePage.jsp" style="float:left">
								<input type="hidden" name="pollID" value="{id}"/>
								<button type="submit" class="btn btn-info">Back to vote page</button>
							</form>
						</xsl:when>
					</xsl:choose>
					<xsl:choose>
						<xsl:when test="/confer/login/user and status='OPEN' and /confer/login/user = creatorEmail">
							<form role="form" method="PUT" action="userPage.jsp" style="float:left; margin-left:50px">
								<input type="hidden" name="state" value="closePoll"/>
								<input type="hidden" name="pollID" value="{id}"/>
								<button type="submit" class="btn btn-danger">Close the Poll</button>
							</form>
						</xsl:when>
					</xsl:choose>
				</div>
			</div>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="timeOptions">
	<ul>
		<xsl:for-each select="timeOption">
			<li>
				<xsl:value-of select="datetime"/>
			</li>
		</xsl:for-each>
	</ul>
	</xsl:template>
	
	<xsl:template match="timeOption">
		<tr>
			<th><xsl:value-of select="datetime"/></th>
			<th><xsl:value-of select="result"/></th>
		</tr>
	</xsl:template>
	
	<xsl:template match="responsers">
	<ul>	
		<xsl:for-each select="responser">
			<li><xsl:apply-templates/></li>
		</xsl:for-each>
	</ul>
	</xsl:template>
	
	<xsl:template match="highestResponses">
		<br/>Current Highest Response(s):
		<ul>
		<xsl:for-each select="highestResponse">
			<li><xsl:apply-templates/></li>
		</xsl:for-each>
		</ul>
	</xsl:template>
	
	<xsl:template match="error">
		<p>The poll you are looking for is not in the record<br></br>or you haven't select a poll<br></br>ERROR: <xsl:apply-templates/></p>
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
					<a href="#" data-toggle="modal" data-target="#signupModal">
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
				<!-- Signup modal content-->
    			<div id="signupModal" class="modal fade" role="dialog">
  					<div class="modal-dialog">
    					<div class="modal-content">
      						<div class="modal-header">
       							<button type="button" class="close" data-dismiss="modal">x</button>
        						<h4 class="modal-title">Start creating poll today?</h4>
      						</div>
      						<div class="modal-body">
      							<div class="container">
  									<h2 align="left">Sign Up</h2>
  									<form class="form-horizontal" role="form" method="POST" action="welcome.jsp" id="signupForm" onsubmit="return validateSignup();">
    										<div class="form-group">
      											<label class="control-label col-sm-2" for="signupEmail">Email: <span style='color:red'>*</span></label>
      											<div class="col-sm-4" id="signupEmail-div">
        											<input type="text" class="form-control" id="signupEmail" name="signupEmail" placeholder="Enter email"/>
      											</div>
    										</div>
        									<div class="form-group">
      											<label class="control-label col-sm-2" for="signupPassword">Password: <span style='color:red'>*</span></label>
      											<div class="col-sm-4" id="signupPassword-div">          
        											<input type="password" class="form-control" id="signupPassword" name="signupPassword" placeholder="Enter password"/>
      											</div>
    										</div>
    										<div class="form-group">
      											<label class="control-label col-sm-2" for="signupName">Name: <span style='color:red'>*</span></label>
      											<div class="col-sm-4" id="signupName-div">          
        											<input type="text" class="form-control" id="signupName" name="signupName" placeholder="Enter Preferred Name"/>
      											</div>
    										</div>
    									</form>
    								</div>
      
      								<div class="modal-footer">
      	 								<button type="submit" class="btn btn-default" form="signupForm">Submit</button>
        								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      								</div>
    						</div>
  						</div>
					</div>
				</div>
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
</xsl:stylesheet>