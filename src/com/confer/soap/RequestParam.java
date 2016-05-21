package com.confer.soap;

import java.io.Serializable;

import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "requestParam")
public class RequestParam implements Serializable {
	@XmlElement(name="creatorID")
	protected String creatorID = null;
	@XmlElement(name="status")
	protected String status = null;
	@XmlElement(name="minResponse")
	protected int minResponse = 0;
	
	public RequestParam(String creatorID, String status, int minResponse) {
		super();
		this.creatorID = creatorID;
		this.status = status;
		this.minResponse = minResponse;
	}
	
	public RequestParam() {
		
	}
	
	public boolean containsParam() {
		return creatorID != null || status != null || minResponse != 0; 
	}

	public String getCreatorID() {
		return creatorID;
	}

	public void setCreatorID(String creatorID) {
		this.creatorID = creatorID;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getMinResponse() {
		return minResponse;
	}

	public void setMinResponse(int minResponse) {
		this.minResponse = minResponse;
	}

}
