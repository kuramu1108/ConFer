<%@ page language="java" contentType="application/xml" pageEncoding="UTF-8" %><?xml version="1.0" encoding="UTF-8"?>
<%@ page import="java.util.*, com.confer.*, com.confer.utility.*"%><?xml-stylesheet type="text/xsl" href="static/userPage.xsl"?>

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
	String state = request.getParameter("state");
	User user = (User) session.getAttribute("user");
	if (state == null) {
		if (user == null) {
%>
		<notLogin>You are not logged in</notLogin>
<%
		} else {
%>
		<user>
			<email><%=user.getEmail() %></email>
		</user>
<%
		}
	}
	else 
	{
		// different operation according to state value, which are passed from the origin page
		// logout is selected in previous page
		if (state.equals("logout"))
		{
%>
		<notLogin>Successfully log out</notLogin>
		
<%
			session.removeAttribute("user");
		}
		// login detail is provided from previous page
		else if (state.equals("login"))
		{
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			User user_current = conferApp.getUsers().login(email, password);
			if (user_current == null) {
%>
		<notLogin>Email/Password incorrect</notLogin>
<%
			} else {
%>
		<user>
			<email><%=user_current.getEmail() %></email>
		</user>
<%
				session.setAttribute("user", user_current);
			}
		}
		// a poll is being closed in previous page
		else if (state.equals("closePoll") && user != null)
		{
			conferApp.closePoll(request.getParameter("pollID"), user);
		}
		else if (state.equals("createPoll") && user != null)
		{
			String title = request.getParameter("title");
			String location = request.getParameter("location");
			String des = request.getParameter("description");
			String[] timeOptions = request.getParameterValues("timeOption");
			String creationDate = request.getParameter("creationDate");
			if (title != null && location != null && des != null && timeOptions != null && creationDate != null)
				conferApp.addPoll(title, user.getEmail(), user.getUsername(), creationDate, "OPEN", location, des, new ArrayList<String>(Arrays.asList(timeOptions)));
		}
	}
%>
	</login>
<%
	User user_after = (User) session.getAttribute("user");
	if (user_after != null) {
%>
	<polls>
<%
		Hashtable<String, Poll> polls = conferApp.getUsersPolls(user_after.getEmail());
		ArrayList<Poll> sortedPolls = new ArrayList<Poll>(polls.values());
		String sort = request.getParameter("sort");
		// array sorting
		if (sort != null){
			if (sort.equals("title")) 
				sortedPolls.sort(new PollTitleComparator());
			else if (sort.equals("status"))
				sortedPolls.sort(new PollStatusComparator());
			else if (sort.equals("date"))
				sortedPolls.sort(new PollDateComparator());
			else
				sort = "date";
		} else {
			sort = "date";
		}
		for (Poll poll: sortedPolls) {
%>
			<poll>
				<id><%= poll.getId() %></id>
                <title><%= poll.getTitle() %></title>
                <creationDate><%= poll.getCreationDate() %></creationDate>
                <status><%= poll.getStatus() %></status>
			</poll>
<%
		}
%>
	</polls>
<%	}	%>
</confer>