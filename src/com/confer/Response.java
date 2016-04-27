package com.confer;

import java.io.Serializable;

import javax.xml.bind.annotation.*;

import java.util.*;

public class Response implements Serializable {
	private String name;
	private ArrayList<String> timeOptions;
	
	public Response(String name) {
		super();
		this.name = name;
		timeOptions = new ArrayList<String>();
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public ArrayList<String> getTimeOptions() {
		return timeOptions;
	}
	
	public void addTimeOptions(String timeOption) {
		timeOptions.add(timeOption);
	}
}
