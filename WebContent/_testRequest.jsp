<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	//String[] timeOptions = request.getParameterValues("timeOption");
	//String des = request.getParameter("description");
	//String creationDate = request.getParameter("creationDate");
	//String email = request.getParameter("email");
	//String password = request.getParameter("password");
%>
<body>
<p>
<%
	/* out.println(creationDate);
	
	for(String option: timeOptions)
	{
		out.println(option);
	}
	
	out.println(des); */
	
	/* out.println("<br>email: " + email);
	out.println("<br>password: " + password); */
	out.println(request.getParameter("signupEmail"));
	out.println(request.getParameter("signupName"));
	out.println(request.getParameter("signupPassword"));
%>
</p>
</body>
</html>