package com.confer;

import java.io.Serializable;
import java.util.*;

import javax.xml.bind.annotation.*;

public class User implements Serializable {
	private String email;
	private String username;
	private String password;
	private ArrayList<Poll> polls;
	
	public User(String email, String username, String password) {
		super();
		this.email = email;
		this.username = username;
		this.password = password;
		this.polls = new ArrayList<Poll>();
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public void addPoll(Poll poll)
	{
		polls.add(poll);
	}
	
	public void removePoll(Poll poll)
	{
		polls.remove(poll);
	}
	
	public ArrayList<Poll> getPolls()
	{
		return polls;
	}
}
