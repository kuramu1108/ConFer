package com.confer;

import java.io.Serializable;
import javax.xml.bind.annotation.*;
import java.util.*;

public class Polls implements Serializable {
	private Hashtable<String, Poll> polls;
	private int count;

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
		return result;
	}
}
