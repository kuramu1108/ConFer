package com.confer;

import java.io.Serializable;
import java.util.*;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "user")
public class User implements Serializable {
	@XmlElement(name = "email")
	private String email;
	@XmlElement(name = "username")
	private String username;
	@XmlElement(name = "password")
	private String password;
	@XmlElementWrapper(name = "pollIDs")
	@XmlElement(name = "pollID")
	private ArrayList<String> pollIDs;
	
	public User()
	{
		
	}
	public User(String email, String username, String password) {
		super();
		this.email = email;
		this.username = username;
		this.password = password;
		this.pollIDs = new ArrayList<String>();
	}
	
	// accessor, mutator and list add/remove functions =================
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
	
	public void addPoll(String pollID)
	{
		pollIDs.add(pollID);
	}
	
	public void removePoll(String pollID)
	{
		pollIDs.remove(pollID);
	}
	
	public ArrayList<String> getPollIDs()
	{
		return pollIDs;
	}
}
