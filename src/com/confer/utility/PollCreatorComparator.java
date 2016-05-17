package com.confer.utility;

import com.confer.*;
import java.util.Comparator;

public class PollCreatorComparator implements Comparator<Poll> {

	@Override
	public int compare(Poll o1, Poll o2) {
		return o1.getCreatorName().compareTo(o2.getCreatorName());
	}
}
