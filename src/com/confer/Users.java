package com.confer;

import java.io.Serializable;

import javax.xml.bind.annotation.*;

import java.util.*;

public class Users implements Serializable {
	private ArrayList<User> users;
	private int count;
	
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
}
