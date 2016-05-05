package com.confer;

import java.util.*;

import javax.xml.bind.*;

import java.io.*;

public class ConferApplication {
	private String userFilePath;
	private String pollFilePath;
	private Users users;
	private Polls polls;
	
	public Hashtable<String, Poll> getUsersPolls(String email)
	{
		ArrayList<String> pollIDs = users.getUsersPollIDs(email);
		if (pollIDs == null)
			return null;
		else
		{
			Hashtable<String, Poll> result = polls.getUsersPolls(pollIDs);
			return result;
		}
	}
	
	public Hashtable<String, Poll> getOpenPolls()
	{
		Hashtable<String, Poll> result = polls.getOpenPolls();
		return result;
	}
	
	public void addPoll(String title, String creatorEmail, String creationDate,
			String status, String location, String description) throws Exception
	{
		Poll poll = new Poll(Integer.toString(polls.getCount()), title, creatorEmail, creationDate, status, location, description);
		polls.addPoll(poll);
		marshallPolls();
	}
	
	public void addUser(String email, String username, String password) throws Exception
	{
		User user = new User(email, username, password);
		users.addUser(user);
		marshallUsers();
	}
	
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
