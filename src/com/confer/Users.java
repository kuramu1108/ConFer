package com.confer;

import java.io.Serializable;

import javax.xml.bind.annotation.*;

import java.util.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "users")
public class Users implements Serializable {
	@XmlElement(name = "count")
	private int count;
	@XmlElement(name = "user")
	private ArrayList<User> users;
	
	public Users() {
		users = new ArrayList<User>();
		count = 0;
	}

	public ArrayList<User> getUsers() {
        return users;
    }
	
    public void addUser(User user) {
        users.add(user);
    }
    
    public void removeUser(User user) {
        users.remove(user);
    }
    
    public User login(String email, String password) {
        // For each user in the list...
        for (User user : users) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password))
                return user; // Login correct. Return this user.
        }
        return null; // Login incorrect. Return null.
    }
    
    public ArrayList<String> getUsersPollIDs(String email){
    	for (User user : users){
    		if (user.getEmail().equals(email))
    			return user.getPollIDs();
    	}
    	return null;
    }
}
