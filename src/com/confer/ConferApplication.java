package com.confer;

import java.util.*;

public class ConferApplication {
	private String userFilePath;
	private String pollFilePath;
	private Users users;
	private Polls polls;
	
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
