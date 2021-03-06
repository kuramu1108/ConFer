<%@ page language="java" contentType="application/xml" pageEncoding="UTF-8" %><?xml version="1.0" encoding="UTF-8"?>
<%@ page import="java.util.*, com.confer.*, com.confer.utility.*"%><?xml-stylesheet type="text/xsl" href="static/createPoll.xsl"?>

 
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
	<login>
<%
	User user = (User) session.getAttribute("user");
	if (user == null) {
%>
		<notLogin></notLogin>
<%
	} else {
%>
		<user>
			<email><%= user.getEmail() %></email>
		</user>
<%
	}
%>
	</login>
</confer>