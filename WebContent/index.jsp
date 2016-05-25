<%@ page language="java" contentType="application/xml" pageEncoding="UTF-8" %><?xml version="1.0" encoding="UTF-8"?>
<%@ page import="java.util.*, com.confer.*, com.confer.utility.*"%><?xml-stylesheet type="text/xsl" href="static/index.xsl"?>

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
	else 
	{
		int count = openPolls.size();
		ArrayList<Poll> openPollsArray = new ArrayList<Poll>(openPolls.values());
		String sort = request.getParameter("sort");
		// array sorting
		if (sort != null){
			if (sort.equals("title")) 
				openPollsArray.sort(new PollTitleComparator());
			else if (sort.equals("creatorName"))
				openPollsArray.sort(new PollCreatorComparator());
			else if (sort.equals("date"))
				openPollsArray.sort(new PollDateComparator());
		}
	
%>
<confer>
<%
		User user = (User)session.getAttribute("user");
		if (user != null) {
		// insert login tag section to xml
%>
	<login>
		<user>
			<email><%=user.getEmail() %></email>
		</user>
	</login>
<%
		} else {
%>
	<login>
		<notLogin></notLogin>
	</login>

<%  	} // end of else checking user login %>
	<polls>
		<count><%= count %></count>
		<list>
<%
		for (Poll poll: openPollsArray)
		{
			String key = poll.getId();
		// insert poll entry
%>
			<entry>
				<key><%= key %></key>
				<value>
                	<id><%= poll.getId() %></id>
                	<title><%= poll.getTitle() %></title>
                	<creatorName><%= poll.getCreatorName() %></creatorName>
                	<creationDate><%= poll.getCreationDate() %></creationDate>
            	</value>
        	</entry>
    <% 	} // End of list entry loop %>
	</list>
</polls>
</confer>
<% } // end of if else statement for checking whether openPolls = null or not %>