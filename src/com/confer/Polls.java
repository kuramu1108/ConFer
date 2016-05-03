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
	
	public ArrayList<Poll> getOpenPolls()
	{
		ArrayList<Poll> result = new ArrayList<Poll>();
		for (Map.Entry<String, Poll> entry: list.entrySet())
		{
			Poll poll = entry.getValue();
			if (poll.getStatus().equals("OPEN"));
				result.add(poll);
		}
		return result;
	}
	
	public ArrayList<Poll> getUsersPolls(ArrayList<String> pollIDs)
	{
		ArrayList<Poll> result = new ArrayList<Poll>();
		for (String id : pollIDs)
		{
			if (list.containsKey(id)) 
			{
				result.add(list.get(id));
			}
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
