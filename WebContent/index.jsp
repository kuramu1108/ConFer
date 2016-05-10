<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="static/index.xsl"?>
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
	Hashtable<String, Poll> openPolls = conferApp.getOpenPolls();
	if (openPolls == null)
		out.print("0 open polls");
		else {
	int count = openPolls.size();
%>
<polls>
	<count><%= count %></count>
	<list>
<%
	for (Map.Entry<String, Poll> entry: openPolls.entrySet())
	{
		String key = entry.getKey();
		Poll poll = entry.getValue();
	
%>
		<entry>
			<key><%= key %></key>
			<value>
                <id><%= poll.getId() %></id>
                <title><%= poll.getTitle() %></title>
                <creatorEmail><%= poll.getCreatorEmail() %></creatorEmail>
                <creatorName><%= poll.getCreatorName() %></creatorName>
                <creationDate><%= poll.getCreationDate() %></creationDate>
                <status><%= poll.getStatus() %></status>
                <location><%= poll.getLocation() %></location>
                <description><%= poll.getDescription() %></description>
                <timeOptions>
                <%
                	ArrayList<String> timeOptions = poll.getTimeOptions();
                	for (String option: timeOptions)
                	{
                %>
                    <timeOption><%= option %></timeOption>
                <%  } // End of time options loop %>
                </timeOptions>
                <responses>
                <%
                	ArrayList<Response> responses = poll.getResponses();
                	for (Response respon: responses)
                	{
                %>
                    <response>
                        <name><%= respon.getName() %></name>
                        <times>
                        <%
                        	ArrayList<String> times = respon.getTimeSelected();
                        	for (String time: times)
                        	{
                       	%>
                            <timeSelected><%= time %></timeSelected>
                        <%  } // End of time selected loop %>
                        </times>
                    </response>
                <%  } // End of Responses loop %>
                </responses>
            </value>
        </entry>
    <% } // End of list entry loop %>
	</list>
</polls>
<% } // end of if else statement for checking whether openPolls = null or not %>