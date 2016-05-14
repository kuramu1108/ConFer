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
	private Hashtable<String, Poll> list;

	public Polls() {
		list = new Hashtable<String, Poll>();
		count = 0;
	}
	
	public Polls(Hashtable<String, Poll> list) {
		this.list = list;
		count = list.size();
	}
	
	public Hashtable<String, Poll> getOpenPolls()
	{
		Hashtable<String, Poll> result = new Hashtable<String, Poll>();
		for (Map.Entry<String, Poll> entry: list.entrySet())
		{
			Poll poll = entry.getValue();
			if (poll.getStatus().equals("OPEN"))
				result.put(entry.getKey(), poll);
		}
		return result;
	}
	
	// get the polls of a user  
	public Hashtable<String, Poll> getUsersPolls(ArrayList<String> pollIDs)
	{
		Hashtable<String, Poll> result = new Hashtable<String, Poll>();
		for (String id : pollIDs)
		{
			if (list.containsKey(id)) 
			{
				result.put(id, list.get(id));
			}
		}
		return result;
	}
	
	// get a poll with ID
	public Poll getPoll(String pollID)
	{
		Poll result = null;
		for (Map.Entry<String, Poll> entry: list.entrySet())
		{
			Poll poll = entry.getValue();
			if (poll.getId().equals(pollID))
				result = poll;
		}
		return result;
	}
	
	
	public void addPoll(Poll poll)
	{
		list.put(poll.getId(), poll);
		count++;
	}
	
	public void removePoll(Poll poll)
	{
		list.remove(poll.getId());
		count--;
	}
	
	public Hashtable<String, Poll> getList()
	{
		return list;
	}

	public void setList(Hashtable<String, Poll> list) {
		this.list = list;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
