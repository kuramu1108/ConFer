package com.confer;

import java.util.*;

public class ConferApplication {
	private String userFilePath;
	private String pollFilePath;
	private Users users;
	private Polls polls;
	
	public ArrayList<Poll> getUsersPolls(String email)
	{
		ArrayList<String> pollIDs = users.getUsersPollIDs(email);
		if (pollIDs == null)
			return null;
		else
		{
			ArrayList<Poll> result = polls.getUsersPolls(pollIDs);
			return result;
		}
	}
	
	public ArrayList<Poll> getOpenPolls()
	{
		ArrayList<Poll> result = polls.getOpenPolls();
		return result;
	}
	
	public String getUserFilePath() {
		return userFilePath;
	}
	public void setUserFilePath(String userFilePath) {
		this.userFilePath = userFilePath;
	}
	public String getPollFilePath() {
		return pollFilePath;
	}
	public void setPollFilePath(String pollFilePath) {
		this.pollFilePath = pollFilePath;
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
