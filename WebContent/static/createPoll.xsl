<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<title>Create Poll</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script src="static/js/moment.js"></script>
<script src="custom_js/validate.js"></script>
	
<link rel="stylesheet" href="static/css/bootstrap-datetimepicker.css" />
<script src="static/js/bootstrap-datetimepicker.min.js"></script>
<style>
ul
{
    list-style-type: none;
}
</style>
</head>
<body>
<xsl:choose>
	<xsl:when test="confer/login/notLogin">
		<nav class="navbar navbar-inverse">
	  		<div class="container-fluid">
	    		<div class="navbar-header">
	      			<a class="navbar-brand" href="index.jsp">ConFer</a>
	    		</div>
	<!--        			top right functionality buttons  	below					-->
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
	<!--          			top right functionality buttons  	above					--> 
	  		</div>
		</nav>
		<div class="container col-sm-9">
			<div style="margin: 0 0 0 35%">
				<div class="container col-sm-6">
					<h2>Your are not logged in</h2>
				</div>
			</div>
		</div>
	</xsl:when>
	<!-- if a user is found in session -->
	<xsl:otherwise>
		<nav class="navbar navbar-inverse">
		<div class="container-fluid">
		<div class="navbar-header"><a class="navbar-brand" href="index.jsp">ConFer</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="userPage.jsp"><span class="glyphicon glyphicon-home"></span>
			Home</a></li>
			<li><a href="userPage.jsp?state=logout"><span class="glyphicon glyphicon-log-out"></span>
			Logout</a></li>
		</ul>
		</div>
		</nav>
		
			<div class="container com-sm-12">
				<form role="form" action="userPage.jsp" method="POST" onsubmit="return validateCreatePoll();">
					<input type="hidden" name="state" value="createPoll"/>
					<div class="form-group" id="title-div">
						<label for="title">Title: <span style="color:red">*</span></label>
						<input type="text" class="form-control" id="title" name="title"/>
					</div>
		
					<div class="form-group" id="location-div">
						<label for="location">Meeting Location: <span style="color:red">*</span></label> 
						<input type="text" class="form-control" id="location" name="location"/>
					</div>
		
					<div class="form-group" id="description-div">
						<label for="description">Description: <span style="color:red">*</span></label>
						<textarea name="description" id="description" class="form-control"
							style="height: 200px"></textarea>
					</div>
					<div class="form-group" id="timeOptions-div">
						<label for="timeOptions">Time Options: <span style='color:red'>*</span></label>
						<ul id="timeOptions">
							<li>
								<div class="form-group">
									<div class="row">
										<div class='col-sm-6'>
											<div class="form-group">
												<div class='input-group date' id='datetimepicker1'>
													<input type='text' class="form-control" name="timeOption"/> <span
														class="input-group-addon"> <span
														class="glyphicon glyphicon-calendar"></span>
													</span>
												</div>
											</div>
										</div>
										<div class="col-xs-1">
											<button type="button" class="btn btn-default addButton"
												onclick="addTimeOption();">+</button>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<input type="hidden" id="creationDate" name="creationDate" value=""/>
					<input type="submit" class="btn btn-default" value="Create"/>
				</form>
			</div>
		
		<script src="custom_js/timeOption.js"/>
	</xsl:otherwise>
</xsl:choose>
</body>
</html>
</xsl:template>
</xsl:stylesheet>