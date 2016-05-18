<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<title>Welcome Page</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
  		<div class="container-fluid">
    		<div class="navbar-header">
      			<a class="navbar-brand" href="index.jsp">ConFer</a>
    		</div>
    
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
			
										<div class="form-group">
											<label class="control-label col-sm-2" for="pwd">Password: <span style='color:red'>*</span></label>
											<div class="col-sm-4" id="password-div">
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
  		</div>
	</nav>
	<div align="center">
		<xsl:choose>
			<xsl:when test="confer/signup/fail">
				<h1 style="font-size:60px; margin-top:100px">Fail to Register</h1>
				<h4>- <xsl:value-of select="confer/signup/email"/> is already used</h4>
				<button type="submit" class="btn btn-inverse" data-toggle="modal" data-target="#signupModal">Try different Email?</button>
				<p style="margin-top:10px"> Or </p>
				<button type="submit" class="btn btn-inverse" data-toggle="modal" data-target="#loginModal">Login as an User</button>
			</xsl:when>
			<xsl:otherwise>
				<h1 style="font-size:60px; margin-top:100px">Welcome to Confer, <xsl:value-of select="confer/signup/name"/></h1>
				<h4>- A Place to Vote for Your Meetings</h4>
				<button type="submit" class="btn btn-inverse" data-toggle="modal" data-target="#loginModal">Login</button>
				<p style="margin-top:10px"> Or </p>
				<button type="submit" class="btn btn-inverse" onclick="location.href='index.jsp';">View some polls</button>
			</xsl:otherwise>
		</xsl:choose>
	</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>