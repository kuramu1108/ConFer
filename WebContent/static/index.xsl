<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
	<title>Confer - Vote for your meeting</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  		<script src="custom_js/validate.js"></script>
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
 
 

	<div class="container col-sm-9">
		<div style="margin: 0 0 0 35%">
  			<h2>Open Poll</h2>
  			<div class="panel-group">
    			<div class="panel panel-default">
        			<div class="panel-heading clearfix"> 
         				<p class="panel-title pull-left" style="padding-top: 7.5px;">Please click on one of these polls </p>
      						<div class="input-group">
                    			<div class="input-group-btn">
                        			<button class="btn btn-inverse pull-right" data-toggle="dropdown"><i class="glyphicon glyphicon-sort"></i></button>
                        			<ul class="dropdown-menu pull-right">
                        				<li><a href="?sort=date">Date</a></li>
                        				<li><a href="?sort=creatorName">Creator Name</a></li>
                        				<li><a href="?sort=title">Title</a></li>
                        			</ul>
                    			</div>
                			</div>
     			 	</div>
      
      				<div class="panel-body">          
  						<table class="table table-hover">
    						<thead>
				      			<tr>
				        			<th>Title</th>
				        			<th>Name</th>
				        			<th>Creation Date</th>
				      			</tr>
				    		</thead>
				    		<tbody>
				    <!-- Applying later templates -->
				      			<xsl:apply-templates select="confer/polls"/>
 							</tbody>
	  					</table>
	  				</div>
	   			</div>
	   		</div>
	    </div>
	</div>
</body>
</html>
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
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<xsl:template match="polls">
	<xsl:for-each select="list/entry">
	<tr onclick="location.href = 'votePage.jsp?pollID={value/id}';">
		<td><xsl:value-of select="value/title"/></td>
		<td><xsl:value-of select="value/creatorName"/></td>
		<td><xsl:value-of select="value/creationDate"/></td>
	</tr>
	</xsl:for-each>
</xsl:template>
</xsl:stylesheet>