package com.confer;

import java.io.Serializable;

import javax.xml.bind.annotation.*;

import java.util.*;

public class Poll implements Serializable {
	private String id;
	private String title;
	private String creatorEmail;
	private String creationDate;
	private String status;
	private String location;
	private String description;
	private ArrayList<String> timeOptions;
	private ArrayList<Response> responses;
	
	public Poll(String id, String title, String creatorEmail, String creationDate,
			String status, String location, String description) {
		super();
		this.id = id;
		this.title = title;
		this.creatorEmail = creatorEmail;
		this.creationDate = creationDate;
		this.status = status;
		this.location = location;
		this.description = description;
		timeOptions = new ArrayList<String>();
		responses = new ArrayList<Response>();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCreatorEmail() {
		return creatorEmail;
	}

	public void setCreatorEmail(String creatorEmail) {
		this.creatorEmail = creatorEmail;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public ArrayList<String> getTimeOptions() {
		return timeOptions;
	}

	public void addTimeOptions(String timeOption) {
		timeOptions.add(timeOption);
	}

	public ArrayList<Response> getResponses() {
		return responses;
	}

	public void addResponses(Response response) {
		responses.add(response);
	}
}
