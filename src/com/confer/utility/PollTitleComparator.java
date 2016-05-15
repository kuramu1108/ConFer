package com.confer.utility;

import com.confer.*;
import java.util.Comparator;

public class PollTitleComparator implements Comparator<Poll> {
	@Override
	public int compare(Poll o1, Poll o2) {
		return o1.getTitle().compareTo(o2.getTitle());
	}
}
