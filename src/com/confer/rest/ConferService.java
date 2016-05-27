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
	 * optional query parameters: status, minResponse creatorID
	 * fetch polls data in xml format
	 * 
	 */
	@Path("polls")
	@GET
	@Produces(MediaType.APPLICATION_XML)
	public Polls getPolls(@QueryParam("creatorID") String creatorID, @QueryParam("status") String status, @QueryParam("minResponse") int minResponse) throws Exception {
		ConferApplication conferApp = getConferApp();
		Hashtable<String, Poll> pollTable;

		if (status == null && minResponse == 0 && creatorID == null) { // no query parameter provided, return all the open polls
			return new Polls(conferApp.getOpenPolls());
		} else {
			if (creatorID == null)
				// no creatorID value provided. fetch all the polls
				pollTable = conferApp.getPolls().getList();
			else
				// fetch user's polls, return empty table if user not found/user has no polls
				pollTable = conferApp.getUsersPolls(creatorID);
			
			if (status != null) // provided status value
				pollTable = conferApp.filterPollsWithStatus(pollTable, status);
			if (minResponse != 0) // provided minResponse value
				pollTable = conferApp.filterPollsWithMinResponse(pollTable, minResponse);
			return new Polls(pollTable);
		}
	}
}
