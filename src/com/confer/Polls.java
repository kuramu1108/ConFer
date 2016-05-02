package com.confer;

import java.io.Serializable;
import javax.xml.bind.annotation.*;
import java.util.*;

public class Polls implements Serializable {
	private ArrayList<Poll> polls;
	private int count;

	public Polls() {
		polls = new ArrayList<Poll>();
		count = 0;
	}
	
	public void addPoll(Poll poll)
	{
		polls.add(poll);
	}
	
	public void removePoll(Poll poll)
	{
		polls.remove(poll);
	}
	
	public ArrayList<Poll> getPolls()
	{
		return polls;
	}
}
