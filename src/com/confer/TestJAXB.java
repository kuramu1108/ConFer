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
			user.addPoll("0");
			user.addPoll("2");
			users.addUser(user);
			users.addUser(new User("kuramu1108@gmail.com", "kuramu", "abccd1234"));

			// Boilerplate code to convert objects to XML...
			JAXBContext jc = JAXBContext.newInstance(Users.class);
			Marshaller m = jc.createMarshaller();
			m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			m.marshal(users, System.out);
		} else if (testPoll) {
			Polls polls = new Polls();
			Poll poll = new Poll(Integer.toString(polls.getCount()), "First meeting",
					"colagarychen@gmail.com", "01/04/2016", "OPEN", "B11",
					"meeting for WSD");
			poll.addTimeOption("04/05/2016 6:00");
			poll.addTimeOption("04/05/2016 10:00");
			poll.addTimeOption("04/05/2016 14:00");
			Response response1 = new Response("Raymond");
			response1.addTimeSelected("04/05/2016 6:00");
			response1.addTimeSelected("04/05/2016 14:00");
			poll.addResponse(response1);
			Response response2 = new Response("Darren");
			response2.addTimeSelected("04/05/2016 6:00");
			response2.addTimeSelected("04/05/2016 14:00");
			poll.addResponse(response2);
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
			user.addPoll("0");
			user.addPoll("1");
			users.addUser(user);
			users.addUser(new User("kuramu1108@gmail.com", "kuramu", "abccd1234"));
			
			Polls polls = new Polls();
			Poll poll = new Poll(Integer.toString(polls.getCount()), "First meeting",
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
			
			Poll poll2 = new Poll(Integer.toString(polls.getCount()), "Second meeting",
					"colagarychen@gmail.com", "01/04/2016", "OPEN", "B04",
					"meeting for WSD");
			poll2.addTimeOption("04/05/2016 6:00");
			poll2.addTimeOption("04/05/2016 10:00");
			poll2.addTimeOption("04/05/2016 14:00");
			Response response2 = new Response("Raymond");
			response2.addTimeSelected("04/05/2016 6:00");
			response2.addTimeSelected("04/05/2016 14:00");
			poll2.addResponse(response2);
			polls.addPoll(poll2);
			confer.setPolls(polls);
			confer.setUsers(users);
			
			Hashtable<String, Poll> search = confer.getUsersPolls("colagarychen@gmail.com");
//			if (search != null)
//			{
//				for (Map.Entry<String, Poll> entry : search.entrySet())
//				{
//					System.out.println(entry.getValue().getTitle());
//				}
//			}
			Polls result = new Polls(search);
//			System.out.println("complete");
			JAXBContext jc = JAXBContext.newInstance(Polls.class);
			StringWriter sw = new StringWriter();
			Marshaller m = jc.createMarshaller();
			m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			m.marshal(result, sw);
			//System.out.println(sw.toString());
			
			JAXBContext jc2 = JAXBContext.newInstance(Users.class);
			Marshaller m2 = jc2.createMarshaller();
			m2.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			m2.marshal(users, System.out);
			
			JAXBContext jc3 = JAXBContext.newInstance(Polls.class);
			Marshaller m3 = jc3.createMarshaller();
			m3.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			m3.marshal(polls, System.out);
			
		}
	}
}