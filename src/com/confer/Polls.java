package com.confer;

import java.io.Serializable;
import javax.xml.bind.annotation.*;
import java.util.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "polls")
public class Polls implements Serializable {
	@XmlElement(name = "count")
	private int count;
	@XmlElementWrapper(name = "list")
	private Hashtable<String, Poll> polls;

	public Polls() {
		polls = new Hashtable<String, Poll>();
		count = 0;
	}
	
	public void addPoll(Poll poll)
	{
		polls.put(poll.getId(), poll);
	}
	
	public void removePoll(Poll poll)
	{
		polls.remove(poll.getId());
	}
	
	public Hashtable<String, Poll> getPolls()
	{
		return polls;
	}
	
	public ArrayList<Poll> getUsersPolls(ArrayList<String> pollIDs)
	{
		ArrayList<Poll> result = new ArrayList<Poll>();
		for (String id : pollIDs)
		{
			System.out.println(id);
			if (polls.containsKey(id)) 
			{
				System.out.println(id);
				result.add(polls.get(id));
			}
		}
		return result;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
