package com.spring.muknolja.hotel.model.vo;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class ReserveDate {
	
	private static DateTimeFormatter dtFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	private static SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");

	public static Date datePlus(Date date, int plus) {
		String d = date.toString();
		LocalDate localDate = LocalDate.parse(d, dtFormat);
		
		return Date.valueOf(localDate.plusDays(plus));
	}
	
	public static int dateDif(Date start, Date end) {
		try {
			int dif = (int) ((end.getTime()-start.getTime()) / (24*60*60*1000));
			return dif;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
