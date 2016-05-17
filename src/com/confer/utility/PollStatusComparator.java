package com.confer.utility;

import java.util.Comparator;
import com.confer.*;

public class PollStatusComparator implements Comparator<Poll> {

	@Override
	public int compare(Poll o1, Poll o2) {
		// TODO Auto-generated method stub
		return -1 * o1.getStatus().compareTo(o2.getStatus());
	}

}
