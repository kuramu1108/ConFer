<%@ page language="java" contentType="application/xml" pageEncoding="UTF-8" %><?xml version="1.0" encoding="UTF-8"?>
<%@ page import="java.util.*, com.confer.*"%><?xml-stylesheet type="text/xsl" href="static/summaryPage.xsl"?>
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
	User user = (User)session.getAttribute("user");
	if (user == null) {
%>
		<notLogin></notLogin>
<%
	} else {
%>
		<user>
			<email><%= user.getEmail()%></email>
		</user>
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
		Poll poll = conferApp.getPolls().getPoll(pollID);
		if (poll == null) {
%>
		<error>poll not found in database</error>
<%		
		} else {
			// poll result not null
			String[] result = request.getParameterValues("timeOption");
			String voterName = request.getParameter("name");
			if (result != null && voterName != null)
			{
				if (!poll.alreadyResponse(voterName))
					conferApp.addResponse(pollID, voterName, result);
				else {
%>
		<error>You already vote</error>
<%
				}
			}
			
			if (user != null && user.getEmail().equals(poll.getCreatorEmail())) {
%>
		<creator></creator>
<%		
			} else {
%>
		<notCreator></notCreator>
<%
			}
%>
		<id><%=poll.getId() %></id>
		<title><%=poll.getTitle() %></title>
		<creatorName><%=poll.getCreatorName() %></creatorName>
		<creationDate><%=poll.getCreationDate() %></creationDate>
		<creatorEmail><%=poll.getCreatorEmail() %></creatorEmail>
		<location><%=poll.getLocation() %></location>
		<status><%= poll.getStatus() %></status>
		<description><%=poll.getDescription() %></description>
		<timeOptions>
<%
			
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
		<responsers>
<%
			ArrayList<Response> responsers = poll.getResponses();
			for (Response responser: responsers)
			{
%>               
			<responser>
				<name><%= responser.getName() %></name>
				<timesSelected>
<%
				for (String timeSelected: responser.getTimeSelected()) {
%>
					<timeSelected><%= timeSelected %></timeSelected>
<%
				}
%>
				</timesSelected>
			</responser>
<%
			}
%>	
		</responsers>
		<highestResponses>
<%
			int highest = 0;
			for (Map.Entry<String, Integer> entry: responses.entrySet())
			{
				if (entry.getValue() > highest)
					highest = entry.getValue();
			}
			for (Map.Entry<String, Integer> entry: responses.entrySet())
			{
				if (entry.getValue() == highest)
				{
%>
			<highestResponse><%= entry.getKey() %></highestResponse>
<%				}
			} // end of for loop for highest response
%>
		</highestResponses>
<% 
		} // end of else (check poll == null)
	} // end of else (check pollID) 
%>
	</poll>
</confer>