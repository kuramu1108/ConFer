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
	private ArrayList<User> list;
	
	public Users() {
		list = new ArrayList<User>();
		count = 0;
	}
	
	// return an user object if email and password provided match the data
	public User login(String email, String password) {
        for (User user : list) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password))
                return user; // Login correct. Return this user.
        }
        return null; // Login incorrect. Return null.
    }
    
	// return an ArrayList of String of user's poll IDs
    public ArrayList<String> getUsersPollIDs(String email){
    	for (User user : list){
    		if (user.getEmail().equals(email))
    			return user.getPollIDs();
    	}
    	return null;
    }
    
    // get user by email
    public User getUser(String email) {
        for (User user : list) {
            if (user.getEmail().equals(email))
                return user; // user found. Return this user.
        }
        return null; // user not found. Return null.
    }
    
    // check whether an email is already used (user already registered)
    public boolean alreadyRegister(String email) {
    	for (User user : list) {
    		if (user.getEmail().equals(email))
    			return true;
    	}
    	return false;
    }
    
    // accessor, mutator and list add/remover functinos ====================
	public ArrayList<User> getList() {
        return list;
    }
	
	public void setList(ArrayList<User> list) {
		this.list = list;
	}
    
    public void addUser(User user) {
        list.add(user);
        count++;
    }
    
    public void removeUser(User user) {
        list.remove(user);
        count--;
    }

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}    
}
