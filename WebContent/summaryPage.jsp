<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="static/summaryPage.xsl"?>
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
<confer>
<poll>
	<error>poll ID not provided</error>
</poll>
</confer>
<%
	} else {
		Poll poll = conferApp.getPolls().getPoll(pollID);
		if (poll == null) {
%>
<confer>
<poll>
	<error>poll not found in database</error>
</poll>
</confer>
<%		
		} else {			
			String[] result = request.getParameterValues("timeOption");
			String voterName = request.getParameter("name");
			conferApp.addResponse(pollID, voterName, result);
%>
<confer>
<poll>
	<id><%=poll.getId() %></id>
	<title><%=poll.getTitle() %></title>
	<creatorName><%=poll.getCreatorName() %></creatorName>
	<creationDate><%=poll.getCreationDate() %></creationDate>
	<location><%=poll.getLocation() %></location>
	<description><%=poll.getDescription() %></description>
	<timeOptions>
<%
			// poll result not null
			Hashtable<String, Integer> responses = poll.getResult();
			for (Map.Entry<String, Integer> entry : responses.entrySet())
			{
%>
		<timeOption>
			<datetime><%=entry.getKey() %></datetime>
			<result><%=entry.getValue() %></result>
		</timeOption>
<%			} %>
	</timeOptions>
	<totalResponse><%=poll.getResponseCount() %></totalResponse>
</poll>
</confer>
<% 
		} // end of else (check poll == null)
	} // end of else (check pollID) 
%>