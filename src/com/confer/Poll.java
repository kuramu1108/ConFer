package com.confer;

import java.io.Serializable;

import javax.xml.bind.annotation.*;

import java.util.*;

@XmlAccessorType(XmlAccessType.FIELD)
public class Poll implements Serializable {
	@XmlElement(name = "id")
	private String id;
	@XmlElement(name = "title")
	private String title;
	@XmlElement(name = "creatorEmail")
	private String creatorEmail;
	@XmlElement(name = "creatorName")
	private String creatorName;
	@XmlElement(name = "creationDate")
	private String creationDate;
	@XmlElement(name = "status")
	private String status;
	@XmlElement(name = "location")
	private String location;
	@XmlElement(name = "description")
	private String description;
	@XmlElementWrapper(name = "timeOptions")
	@XmlElement(name = "timeOption")
	private ArrayList<String> timeOptions;
	@XmlElementWrapper(name = "responses")
	@XmlElement(name = "response")
	private ArrayList<Response> responses;
	
	public Poll() {
		
	}
	
	// constructor that initialize timeOptions and responses
	public Poll(String id, String title, String creatorEmail, String creatorName, String creationDate,
			String status, String location, String description) {
		super();
		this.id = id;
		this.title = title;
		this.creatorEmail = creatorEmail;
		this.creatorName = creatorName;
		this.creationDate = creationDate;
		this.status = status;
		this.location = location;
		this.description = description;
		timeOptions = new ArrayList<String>();
		responses = new ArrayList<Response>();
	}
	
	// constructor with timeOptions and responses provided
	public Poll(String id, String title, String creatorEmail,
			String creationDate, String status, String location,
			String description, ArrayList<String> timeOptions,
			ArrayList<Response> responses) {
		super();
		this.id = id;
		this.title = title;
		this.creatorEmail = creatorEmail;
		this.creationDate = creationDate;
		this.status = status;
		this.location = location;
		this.description = description;
		this.timeOptions = timeOptions;
		this.responses = responses;
	}
	
	// properties
	public Hashtable<String, Integer> getResult() {
		Hashtable<String, Integer> result = new Hashtable<String, Integer>();
		for (String timeOption: timeOptions) {
			result.put(timeOption, 0);
		}
		for (Response response: responses) {
			for (String timeSelected: response.getTimeSelected()) {
				result.replace(timeSelected, result.get(timeSelected) + 1);
			}
		}
		return result;
	}

	public int getResponseCount(){
		return responses.size();
	}

	// Accessor, mutator and list element add/remove =============================
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
	
	public String getCreatorName() {
		return creatorName;
	}
	
	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
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

	public void addTimeOption(String timeOption) {
		timeOptions.add(timeOption);
	}

	public ArrayList<Response> getResponses() {
		return responses;
	}

	public void addResponse(Response response) {
		responses.add(response);
	}
	
	public void removeResponse(Response response) {
		responses.remove(response);
	}
}
