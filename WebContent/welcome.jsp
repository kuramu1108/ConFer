<%@ page language="java" contentType="application/xml" pageEncoding="UTF-8" %><?xml version="1.0" encoding="UTF-8"?>
<%@ page import="java.util.*, com.confer.*, com.confer.utility.*"%><?xml-stylesheet type="text/xsl" href="static/welcome.xsl"?>
<!-- initialize confer application -->
<% 
	String userFilePath = application.getRealPath("WEB-INF/users.xml");
	String pollFilePath = application.getRealPath("WEB-INF/polls.xml");
%>
<jsp:useBean id="conferApp" class="com.confer.ConferApplication" scope="application">
	<jsp:setProperty name="conferApp" property="userFilePath" value="<%=userFilePath %>"/>
	<jsp:setProperty name="conferApp" property="pollFilePath" value="<%=pollFilePath %>"/>
</jsp:useBean>
<confer>
	<signup>
<%
	String email = request.getParameter("signupEmail");
	String name = request.getParameter("signupName");
	String password = request.getParameter("signupPassword");
	if (email == null || name == null || password == null) {
%>
		<error>Error: No Signup detail provided!</error>
<% 
	}
	else {
		if (conferApp.getUsers().alreadyRegister(email)) {
%>
		<fail></fail>
<%
		} else {
			conferApp.addUser(email, name, password);
		}
%>
		<email><%=email %></email>
		<name><%=name %></name>
<%
	} // end of else to check whether signup detail is passed
%>
	</signup>
</confer>