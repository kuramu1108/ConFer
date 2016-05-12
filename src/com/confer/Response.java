package com.confer;

import java.io.Serializable;

import javax.xml.bind.annotation.*;

import java.util.*;

@XmlAccessorType(XmlAccessType.FIELD)
public class Response implements Serializable {
	@XmlElement(name = "name")
	private String name;
	@XmlElementWrapper(name = "times")
	@XmlElement(name = "timeSelected")
	private ArrayList<String> timeSelected;
	
	public Response()
	{
		
	}
	
	public Response(String name) {
		super();
		this.name = name;
		timeSelected = new ArrayList<String>();
	}
	
	public Response(String name, ArrayList<String> timeSelected) {
		super();
		this.name = name;
		this.timeSelected = timeSelected;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public ArrayList<String> getTimeSelected() {
		return timeSelected;
	}
	
	public void setTimeSelected(ArrayList<String> timeSelected) {
		this.timeSelected = timeSelected;
	}
	
	public void addTimeSelected(String timeSelected) {
		this.timeSelected.add(timeSelected);
	}
}
