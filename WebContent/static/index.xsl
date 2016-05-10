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
	<style>
	</style>
</head>
<body>
	<nav class="navbar navbar-inverse">
  		<div class="container-fluid">
    		<div class="navbar-header">
      			<a class="navbar-brand" href="#">ConFer</a>
    		</div>
    
    		<ul class="nav navbar-nav navbar-right">
      			<li><a href="#" ><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      			<li><a href="#" data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-log-in"  ></span> Login</a></li>
    
    				<!-- Login modal content-->
    				<div id="loginModal" class="modal fade" role="dialog">
  						<div class="modal-dialog">
    						<div class="modal-content">
      							<div class="modal-header">
        							<button type="button" class="close" data-dismiss="modal">X</button>
        							<h4 class="modal-title">Login</h4>
      							</div>
      	
      							<div class="modal-body">
      								<div class="container">
  										<h2 align="left">Login</h2>
  										<form class="form-horizontal" role="form">
    										<div class="form-group">
      											<label class="control-label col-sm-2" for="email">Email:</label>
      											<div class="col-sm-4">
        											<input type="text" class="form-control" id="email" placeholder="Enter email"/>
      											</div>
    										</div>
    
    										<div class="form-group">
      											<label class="control-label col-sm-2" for="pwd">Password:</label>
      											<div class="col-sm-4">          
        											<input type="password" class="form-control" id="pwd" placeholder="Enter password"/>
      											</div>
    										</div>
    									</form>
    								</div>
      
      								<div class="modal-footer">
      	 								<button type="submit" class="btn btn-default">Login</button>
        								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      								</div>
    							</div>
  							</div>
						</div>
					</div>
    		</ul>
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
                        				<li><a href="#">Date</a></li>
                        				<li><a href="#">Creator Name</a></li>
                        				<li><a href="#">Title</a></li>
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
				      			<xsl:apply-templates/>
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

<xsl:template match="/polls">
	<xsl:for-each select="list/entry">
	<tr onclick="document.location = '#';">
		<td><xsl:value-of select="value/title"/></td>
		<td><xsl:value-of select="value/creatorName"/></td>
		<td><xsl:value-of select="value/creationDate"/></td>
	</tr>
	</xsl:for-each>
</xsl:template>
</xsl:stylesheet>