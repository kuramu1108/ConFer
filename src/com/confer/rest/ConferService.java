package com.confer.rest;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;

import java.util.*;

import com.confer.*;
// localhost:8080/{projectname}/rest/confer/
@Path("/confer")
public class ConferService {
	@Context
	private ServletContext application;
	
	private ConferApplication getConferApp() throws Exception {
		synchronized(application) {
			ConferApplication conferApp = (ConferApplication) application.getAttribute("conferApp");
			if (conferApp == null) {
				conferApp = new ConferApplication();
				conferApp.setUserFilePath(application.getRealPath("WEB-INF/users.xml"));
				conferApp.setPollFilePath(application.getRealPath("WEB-INF/polls.xml"));
				application.setAttribute("conferApp", conferApp);
			}
			return conferApp;
		}
	}
	
	/* localhost:8080/{projectname}/rest/confer/polls
	 * optional query parameters: status, minResponse
	 * fetch polls data in xml format
	 * 
	 */
	@Path("polls")
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public Polls getPolls(@QueryParam("status") String status, @QueryParam("minResponse") int minResponse) throws Exception {
		ConferApplication conferApp = getConferApp();
		Hashtable<String, Poll> pollTable = conferApp.getPolls().getList();
		if (status == null && minResponse == 0) {
			// no query parameter provided, return all the open polls
			return new Polls(conferApp.getOpenPolls());
		} else if (status != null && minResponse == 0) {
			// provided status value
			return conferApp.filterPollsWithQuery(pollTable, true, false, status, 0);
		} else if (status == null && minResponse != 0) {
			// provided minResponse value
			return conferApp.filterPollsWithQuery(pollTable, false, true, "", minResponse);
		} else {
			// provided both query value
			return conferApp.filterPollsWithQuery(pollTable, true, true, status, minResponse);
		}
	}
	
	/* localhost:8080/{projectname}/rest/confer/polls/{creatorID}
	 * optional query parameters: status, minResponse
	 * fetch polls data of a specific user in xml format
	 * 
	 */
	@Path("polls/{creatorID}")
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public Polls getUsersPolls(@PathParam("creatorID") String creatorID,@QueryParam("status") String status, @QueryParam("minResponse") int minResponse) throws Exception {
		ConferApplication conferApp = getConferApp();
		Hashtable<String, Poll> pollTable = conferApp.getUsersPolls(creatorID);
		if (status == null && minResponse == 0) {
			// no query parameter provided, return all the polls
			return conferApp.filterPollsWithQuery(pollTable, false, false, "", 0);
		} else if (status != null && minResponse == 0) {
			// provided status value
			return conferApp.filterPollsWithQuery(pollTable, true, false, status, 0);
		} else if (status == null && minResponse != 0) {
			// provided minResponse value
			return conferApp.filterPollsWithQuery(pollTable, false, true, "", minResponse);
		} else {
			// provided both query value
			return conferApp.filterPollsWithQuery(pollTable, true, true, status, minResponse);
		}
	}
	
	/* Debug function
	 * test whether REST service is working
	 * 
	 */
	@Path("hello")
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String hello() {
	 return "Hello World";
	}
	
	
}
