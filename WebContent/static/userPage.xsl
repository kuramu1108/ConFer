<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
	<title>User page</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<style>
	
	tr {
		width: 95%;
		display: inline-table;
	}
	
	table {
		height: 410px;
	}
	
	tbody {
	overflow-y: auto;
	
		height: 400px;
		position: absolute;
		
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
	<xsl:otherwise>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header"><a class="navbar-brand" href="indxe.jsp">ConFer</a></div>
				
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-home"></span>Home</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
				</ul>
			</div>
		</nav>
<!--          			top right functionality buttons  	above					--> 
		<div class="container col-sm-9">
			<div style="margin: 0 0 0 35%">
				<div class="container col-sm-6">
					<h2>Your Polls</h2>
				</div>
		
				<div class="container col-sm-6">
					<div class="btn pull-right">
						<form action="createPoll.jsp">
							<input type="submit" style="margin:13px 0 0 0" class="btn btn-default" value="Create"/>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="container col-sm-9">
				<div style="margin: 0 0 0 35%">
		  			<div class="panel-group">
		    			<div class="panel panel-default">
		        			<div class="panel-heading clearfix"> 
		         				<p class="panel-title pull-left" style="padding-top: 7.5px;">Please click on one of these polls </p>
		      						<div class="input-group">
		                    			<div class="input-group-btn">
		                        			<button class="btn btn-inverse pull-right" data-toggle="dropdown"><i class="glyphicon glyphicon-sort"></i></button>
		                        			<ul class="dropdown-menu pull-right">
		                        				<li><a href="?sort=date">Date</a></li>
		                        				<li><a href="?sort=status">Status</a></li>
		                        				<li><a href="?sort=title">Title</a></li>
		                        			</ul>
		                    			</div>
		                			</div>
		     			 	</div>
		      
		      			<div class="panel-body">          
		  					<table class="table table-hover">
		    	
						    	<thead>
						      <tr>
						        <th class="col-sm-6">Title</th>
						        <th class="col-sm-3" style="padding-left:20px">Creation Date</th>
						        <th class="col-sm-3" style="padding-left:25px">Status</th>
						      </tr>
						    </thead>
						    <xsl:apply-templates select="confer/polls"/>
			  				</table>
		
			  				</div>
			   			</div>
			   		</div>
			    </div>
		</div>
	</xsl:otherwise>
</xsl:choose>
</body>
</html>

</xsl:template>

<xsl:template match="polls">
	<tbody>
		<xsl:for-each select="poll">
		<tr onclick="location.href = 'votePage.jsp?pollID={value/id}';">
	    	<td class="col-sm-6"><xsl:value-of select="title"/></td>
	        <td class="col-sm-3"><xsl:value-of select="creationDate"/></td>
	        <td class="col-sm-3"><xsl:value-of select="status"/></td>
	    </tr>	
		</xsl:for-each>		     
 	</tbody>
</xsl:template>
</xsl:stylesheet>