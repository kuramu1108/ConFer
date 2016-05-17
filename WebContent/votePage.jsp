<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="static/votePage.xsl"?>
<%@ page language="java" contentType="application/xml" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.confer.*"%>
 
<!-- initialize confer application -->
<% 
	String userFilePath = application.getRealPath("WEB-INF/users.xml");
	String pollFilePath = application.getRealPath("WEB-INF/polls.xml");
%>
<jsp:useBean id="conferApp" class="com.confer.ConferApplication" scope="application">
	<jsp:setProperty name="conferApp" property="userFilePath" value="<%=userFilePath %>"/>
	<jsp:setProperty name="conferApp" property="pollFilePath" value="<%=pollFilePath %>"/>
</jsp:useBean>

<%
	// fetch the selected poll's ID
	String pollID = (String) request.getParameter("pollID");
	if (pollID == null) {
%>
<poll>
	<error>poll ID not provided</error>
</poll>
<%
	} else {
		Poll result = conferApp.getPolls().getPoll(pollID);
		if (result == null) {
%>
<poll>
	<error>poll not found in database</error>
</poll>
<%		
		} else {
			if (result.getStatus().equals("CLOSE"))
			{
%>
<poll>
	<error>poll has been closed</error>
</poll>
<%
			} else {
%>
<poll>
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
	
</poll>

<% 			} // end of else (ckeck poll status)
		} // end of else (check poll == null)
	} // end of else (check pollID) 
%>