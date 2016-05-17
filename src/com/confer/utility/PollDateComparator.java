package com.confer.utility;

import com.confer.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;

public class PollDateComparator implements Comparator<Poll> {

	@Override
	public int compare(Poll o1, Poll o2){
		String date1 = o1.getCreationDate();
		String date2 = o2.getCreationDate();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		try {
			Date _date1 = formatter.parse(date1);
			Date _date2 = formatter.parse(date2);
			return _date2.compareTo(_date1);
//			if (_date1.after(_date2))
//				return 1;
//			else if (_date1.before(_date2))
//				return -1;
//			else
//				return 0;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}

}
