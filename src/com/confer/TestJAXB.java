package com.confer;

import java.util.*;
import java.io.*;
import javax.xml.bind.*;

public class TestJAXB implements Serializable {
	public static void main(String[] args) throws Exception {
		boolean testUser = false;
		boolean testPoll = false;
		if (testUser) {
			Users users = new Users();
			User user = new User("colagarychen@gmail.com", "pohao", "abcd1234");
			user.addPoll("c0001");
			user.addPoll("c0002");
			users.addUser(user);
			users.addUser(new User("kuramu1108@gmail.com", "kuramu", "abccd1234"));

			// Boilerplate code to convert objects to XML...
			JAXBContext jc = JAXBContext.newInstance(Users.class);
			Marshaller m = jc.createMarshaller();
			m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			m.marshal(users, System.out);
		} else if (testPoll) {
			Polls polls = new Polls();
			int idcount = polls.getCount();
			idcount++;
			Poll poll = new Poll(Integer.toString(idcount), "First meeting",
					"colagarychen@gmail.com", "01/04/2016", "OPEN", "B11",
					"meeting for WSD");
			poll.addTimeOption("04/05/2016 6:00");
			poll.addTimeOption("04/05/2016 10:00");
			poll.addTimeOption("04/05/2016 14:00");
			Response response = new Response("Raymond");
			response.addTimeSelected("04/05/2016 6:00");
			response.addTimeSelected("04/05/2016 14:00");
			poll.addResponse(response);
			polls.addPoll(poll);
			// Boilerplate code to convert objects to XML...
			JAXBContext jc = JAXBContext.newInstance(Polls.class);
			Marshaller m = jc.createMarshaller();
			m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			m.marshal(polls, System.out);
		} else {
			ConferApplication confer = new ConferApplication();
			
			Users users = new Users();
			User user = new User("colagarychen@gmail.com", "pohao", "abcd1234");
			user.addPoll("1");
			user.addPoll("2");
			users.addUser(user);
			users.addUser(new User("kuramu1108@gmail.com", "kuramu", "abccd1234"));
			
			Polls polls = new Polls();
			int idcount = polls.getCount();
			idcount++;
			Poll poll = new Poll(Integer.toString(idcount), "First meeting",
					"colagarychen@gmail.com", "01/04/2016", "OPEN", "B11",
					"meeting for WSD");
			poll.addTimeOption("04/05/2016 6:00");
			poll.addTimeOption("04/05/2016 10:00");
			poll.addTimeOption("04/05/2016 14:00");
			Response response = new Response("Raymond");
			response.addTimeSelected("04/05/2016 6:00");
			response.addTimeSelected("04/05/2016 14:00");
			poll.addResponse(response);
			polls.addPoll(poll);
			polls.setCount(idcount);
			
			confer.setPolls(polls);
			confer.setUsers(users);
			
			ArrayList<Poll> search = confer.getUsersPolls("colagarychen@gmail.com");
			if (search != null)
			{
				for (Poll entry : search)
				{
					System.out.println(entry.getTitle());
				}
			}
			System.out.println("complete");
		}
	}
}