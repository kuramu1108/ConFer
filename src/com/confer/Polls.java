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
	
//	public Hashtable<String, Poll> getPollsWithQuery(boolean statusFlag, boolean minResponseFlag, String status, int minResponse)
//	{
//		Hashtable<String, Poll> result = new Hashtable<String, Poll>();
//		for (Map.Entry<String, Poll> entry: list.entrySet())
//		{
//			Poll poll = entry.getValue();
//			if (statusFlag && minResponseFlag) {
//				if (poll.getStatus().equals(status) && poll.getResponses().size() >= minResponse)
//					result.put(entry.getKey(), poll);
//			} else if (!statusFlag && minResponseFlag) {
//				if (poll.getResponses().size() >= minResponse)
//					result.put(entry.getKey(), poll);
//			} else if (statusFlag && !minResponseFlag) {
//				if (poll.getStatus().equals(status))
//					result.put(entry.getKey(), poll);
//			}
//		}
//		return result;
//	}
	
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
