package com.confer.soap.client;

import java.rmi.RemoteException;

import javax.xml.rpc.ServiceException;

public class ConferSoapClient {
	public static void main(String[] args) {
		ConferSoapServiceLocator locator = new ConferSoapServiceLocator();
		try {
			ConferSoap confer = locator.getConferSoapPort();
			// get open polls
			getOpenPolls(confer);
			// get close polls
			System.out.println("\nGet CLOSE polls\nID Status");
			RequestParam statusParam = new RequestParam();
			statusParam.setStatus("CLOSE");
			Polls closePolls = confer.getPolls(statusParam);
			for (PollsListEntry pollEntry: closePolls.getList()) {
				Poll poll = pollEntry.getValue();
				System.out.println(poll.getId() + " " + poll.getStatus());
			}
			// get User's polls
			System.out.println("\nGet colagarychen@gmail.com's polls\nID creator");
			RequestParam userParam = new RequestParam();
			userParam.setCreatorID("colagarychen@gmail.com");
			Polls usersPolls = confer.getPolls(userParam);
			for (PollsListEntry pollEntry: usersPolls.getList()) {
				Poll poll = pollEntry.getValue();
				System.out.println(poll.getId() + " " + poll.getCreatorEmail());
			}
			// get minResponse = 1 polls
			System.out.println("\nGet minResponse = 1 polls\nID response count");
			RequestParam minParam = new RequestParam();
			minParam.setMinResponse(1);
			Polls minPolls = confer.getPolls(minParam);
			for (PollsListEntry pollEntry: minPolls.getList()) {
				Poll poll = pollEntry.getValue();
				System.out.println(poll.getId() + " " + poll.getResponses().length);
			}
			// test multiple param
			System.out.println("\nGet colagarychen@gmail.com minResponse = 1 polls\nID responses status creator");
			RequestParam doubleParam = new RequestParam();
			doubleParam.setCreatorID("colagarychen@gmail.com");
			doubleParam.setMinResponse(1);
			Polls result = confer.getPolls(doubleParam);
			for (PollsListEntry pollEntry: result.getList()) {
				Poll poll = pollEntry.getValue();
				System.out.println(poll.getId()+"  "+poll.getResponses().length+" "+poll.getStatus()+" "+poll.getCreatorEmail());
			}
			// test createPoll
			System.out.println("\nTest creatPoll");
			String[] timeOptions = {"09/06/2016 00:50", "10/06/2016 00:50", "11/06/2016 00:50"};
			System.out.print("Poll ID: ");
			String pollID = confer.createPoll("colagarychen@gmail.com", "abcd1234", "testTitle", "loc", "des", timeOptions);
			System.out.println(pollID);
			System.out.println("Test Wrong password");
			String pollID2 = confer.createPoll("colagarychen@gmail.com", "abcd123", "testTitle", "loc", "des", timeOptions);
			System.out.println(pollID2);
			getOpenPolls(confer);
			// test closePoll
			System.out.println("\nTest closePoll ID: " + pollID);
			confer.closePoll("colagarychen@gmail.com", "abcd1234", pollID);
			confer.closePoll("colagarychen@gmail.com", "abcd1234", "5");
			getOpenPolls(confer);
			
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
	}
	
	public static void getOpenPolls(ConferSoap confer) throws RemoteException {
		// get open polls test, no parameter provided
		System.out.println("\nGet All the OPEN polls\nID Status");
		RequestParam noParam = new RequestParam();
		Polls openPolls = confer.getPolls(noParam);
		for (PollsListEntry pollEntry: openPolls.getList()) {
			Poll poll = pollEntry.getValue();
			System.out.println(poll.getId() + " " + poll.getStatus());
		}
	}
}
