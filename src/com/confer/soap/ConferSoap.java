package com.confer.soap;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.servlet.ServletContext;
import javax.xml.ws.Endpoint;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;

import com.confer.*;

/* http://localhost:8080/{projectname}/soap/confer
 * 
 */
@WebService
public class ConferSoap {
	@Resource
	private WebServiceContext context;
	
	private ConferApplication getConferApp() throws Exception {
		
		ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		synchronized (application) {
			ConferApplication conferApp = (ConferApplication)application.getAttribute("conferApp");
			if (conferApp == null) {
				conferApp = new ConferApplication();
				conferApp.setUserFilePath(application.getRealPath("WEB-INF/users.xml"));
				conferApp.setPollFilePath(application.getRealPath("WEB-INF/polls.xml"));
				application.setAttribute("conferApp", conferApp);
			}
			return conferApp;
		}
	}
	
	
	/* create poll, return pollID if create successfully
	 * supply User email, password
	 * Poll title, location, description and timeOptions in ArrayList
	 */
	@WebMethod
	public String createPoll(
			String email, String password,
			String title, String location, String description, ArrayList<String> timeOptions) {
		try {
			ConferApplication conferApp = getConferApp();
			User user = conferApp.getUsers().login(email, password);
			if (user != null) // if login successful
			{
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				Date today = new Date();
				String creationDate = formatter.format(today);
				conferApp.addPoll(
						title, email, 
						user.getUsername(), creationDate, 
						"OPEN", location, description, timeOptions);
				ArrayList<String> pollIDs = user.getPollIDs();
				String pollID = pollIDs.get(pollIDs.size() - 1);
				return pollID;
			}
			return "Incorrect email/password"; // return error message if login failed
		} catch (Exception e) {
			e.printStackTrace();
			return "Exception occurred";
		}
	}
	
	/* view a list of poll 
	 * creatorID, status, minResponse are optional
	 * if no request contain no parameter, return all the open polls
	 */
	@WebMethod
	public Polls getPolls(RequestParam param) {
		try {
			ConferApplication conferApp = getConferApp();
			Hashtable<String, Poll> pollTable;
			if (param.containsParam()) {
				String creatorID = param.getCreatorID();
				String status = param.getStatus();
				int minResponse = param.getMinResponse();
				
				if (creatorID == null) {
					// no creatorID value provided. fetch all the polls
					pollTable = conferApp.getPolls().getList();
				} else {
					// fetch user's polls, return empty table if user not found/user has no polls
					pollTable = conferApp.getUsersPolls(creatorID);
				}
				
				if (status == null && minResponse == 0) {
					// no query parameter provided, return all users polls
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
			} else {
				return new Polls(conferApp.getOpenPolls());
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/* close a poll if correct user email and password are provided
	 * 
	 */
	@WebMethod
	public void closePoll(String email, String password, String pollID) {
		try {
			ConferApplication conferApp = getConferApp();
			User user = conferApp.getUsers().login(email, password);
			if (user != null) {
				for (String idEntry: user.getPollIDs()) {
					if (idEntry.equals(pollID))
						conferApp.closePoll(pollID); // only executed if login detail are correct
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/* password validation
	 * return true/false as validation result
	 */
	@WebMethod
	public boolean validPassword(String email, String password) {
		boolean valid = false;
		try {
			ConferApplication conferApp = getConferApp();
			User attempt = conferApp.getUsers().login(email, password);
			if (attempt != null) // login success
				valid = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return valid;
	}
}
