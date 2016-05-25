<%@ page language="java" contentType="application/xml" pageEncoding="UTF-8" %><?xml version="1.0" encoding="UTF-8"?>
<%@ page import="java.util.*, com.confer.*"%><?xml-stylesheet type="text/xsl" href="static/votePage.xsl"?>

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
	if (user != null) {
%>
		<user>
			<email><%= user.getEmail()%></email>
			<name><%= user.getUsername()%></name>
		</user>
<%	
	} else {
%>
		<notLogin></notLogin>
<%	
	}
%>
	</login>
	<poll>
<%
	// fetch the selected poll's ID
	String pollID = (String) request.getParameter("pollID");
	if (pollID == null) {
%>
		<error>poll ID not provided</error>
<%
	} else {
		Poll result = conferApp.getPolls().getPoll(pollID);
		if (result == null) {
%>
		<error>poll not found in database</error>
<%		
		} else {
			if (result.getStatus().equals("CLOSE"))
			{
%>
		<error>poll has been closed</error>
<%
			} else {
%>
		<id><%=result.getId() %></id>
		<title><%=result.getTitle() %></title>
		<creatorName><%=result.getCreatorName() %></creatorName>
		<creationDate><%=result.getCreationDate() %></creationDate>
		<location><%=result.getLocation() %></location>
		<description><%=result.getDescription() %></description>
		<timeOptions>
<%
				ArrayList<String> timeOptions = result.getTimeOptions();
				for (String timeOption: timeOptions)
				{
%>
			<timeOption><%=timeOption %></timeOption>
<%				} %>
		</timeOptions>
<% 			} // end of else (ckeck poll status)
		} // end of else (check poll == null)
	} // end of else (check pollID) 
%>
	</poll>
</confer>