<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="java.util.*, com.confer.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<% 
	String userFilePath = application.getRealPath("WEB-INF/users.xml");
	String pollFilePath = application.getRealPath("WEB-INF/polls.xml");
%>
<jsp:useBean id="conferApp" class="com.confer.ConferApplication" scope="application">
	<jsp:setProperty name="conferApp" property="userFilePath" value="<%=userFilePath %>"/>
	<jsp:setProperty name="conferApp" property="pollFilePath" value="<%=pollFilePath %>"/>
</jsp:useBean>
<%
User user = (User)session.getAttribute("user");	
out.println(user.getEmail());
%>

<body>

</body>
</html>