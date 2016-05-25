package com.confer;

import java.util.*;

import javax.xml.bind.*;

import java.io.*;

public class ConferApplication {
	private String userFilePath;
	private String pollFilePath;
	private Users users;
	private Polls polls;
	
	// complicated poll fetching functions ============================================
	// get particular user's polls
	public Hashtable<String, Poll> getUsersPolls(String email)
	{
		ArrayList<String> pollIDs = users.getUsersPollIDs(email);
		if (pollIDs == null)
			return new Hashtable<String, Poll>();
		else
		{
			Hashtable<String, Poll> result = polls.getUsersPolls(pollIDs);
			return result;
		}
	}
	
	// get all the open polls
	public Hashtable<String, Poll> getOpenPolls()
	{
		Hashtable<String, Poll> result = polls.getOpenPolls();
		return result;
	}
	
	// filter poll with status parameter
	public Hashtable<String, Poll> filterPollsWithStatus(Hashtable<String, Poll> list, String status) {
		Hashtable<String, Poll> result = new Hashtable<String, Poll>();
		for (Map.Entry<String, Poll> entry: list.entrySet()) {
			Poll poll = entry.getValue();
			if (poll.getStatus().equals(status))
				result.put(entry.getKey(), poll);
		}
		return result;
	}
	
	// filter poll with minimum response parameter
	public Hashtable<String, Poll> filterPollsWithMinResponse(Hashtable<String, Poll> list, int minResponse) {
		Hashtable<String, Poll> result = new Hashtable<String, Poll>();
		for (Map.Entry<String, Poll> entry: list.entrySet()) {
			Poll poll = entry.getValue();
			if (poll.getResponseCount() >= minResponse)
				result.put(entry.getKey(), poll);
		}
		return result;
	}
	
	// adding new entry/modify an entry =================================================================================
	public void addPoll(String title, String creatorEmail, String creatorName, String creationDate,
			String status, String location, String description, ArrayList<String> timeOptions) throws Exception
	{
		Poll poll = new Poll(title, creatorEmail, creatorName, creationDate, status, location, description, timeOptions);
		polls.addPoll(poll);
		users.getUser(creatorEmail).addPoll(poll.getId());
		marshallPolls();
	}
	
	public void addUser(String email, String username, String password) throws Exception
	{
		User user = new User(email, username, password);
		users.addUser(user);
		marshallUsers();
	}
	
	public void addResponse(String pollID, String voterName, String[] timeOptions) throws Exception
	{
		Poll poll = polls.getPoll(pollID);
		ArrayList<String> times = new ArrayList<String>(Arrays.asList(timeOptions));
		Response response = new Response(voterName, times);
		poll.addResponse(response);
		marshallPolls();
	}
	
	public void closePoll(String pollID) throws Exception
	{
		Poll poll = polls.getPoll(pollID);
		if (poll != null) 
			poll.setStatus("CLOSE");
		marshallPolls();
	}
	
	// output/marshal updated xml files =============================================================
	private void marshallPolls() throws Exception
	{
		JAXBContext jc = JAXBContext.newInstance(Polls.class);
		Marshaller m = jc.createMarshaller();
		
		m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		m.marshal(polls, new FileOutputStream(pollFilePath));
	}
	
	private void marshallUsers() throws Exception
	{
		JAXBContext jc = JAXBContext.newInstance(Users.class);
		Marshaller m = jc.createMarshaller();
		
		m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		m.marshal(users, new FileOutputStream(userFilePath));
	}
	
	// filepath setting and unmarshalling ===========================================================
	public String getUserFilePath() {
		return userFilePath;
	}
	public void setUserFilePath(String userFilePath) throws Exception{
		this.userFilePath = userFilePath;
		JAXBContext jc = JAXBContext.newInstance(Users.class);
		Unmarshaller u = jc.createUnmarshaller();
		
		FileInputStream fin = new FileInputStream(userFilePath);
		users = (Users)u.unmarshal(fin);
		fin.close();
	}
	public String getPollFilePath() {
		return pollFilePath;
	}
	public void setPollFilePath(String pollFilePath) throws Exception{
		this.pollFilePath = pollFilePath;
		JAXBContext jc = JAXBContext.newInstance(Polls.class);
		Unmarshaller u = jc.createUnmarshaller();
		
		FileInputStream fin = new FileInputStream(pollFilePath);
		polls = (Polls)u.unmarshal(fin);
		fin.close();
	}
	
	// general accessor and mutator ================================================
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public Polls getPolls() {
		return polls;
	}
	public void setPolls(Polls polls) {
		this.polls = polls;
	}
}
