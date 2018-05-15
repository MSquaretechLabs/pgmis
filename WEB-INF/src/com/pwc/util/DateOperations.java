package com.pwc.util;
import java.util.*;
import java.text.*;
public class DateOperations{

private String month="";
int monthVal =0;
int tomorrowsDate=0,tomorrowsYear=0,todaysDate=0,todaysYear=0,yesterdaysDate=0,yesterdaysYear=0;
String dayType = "";
String tomorrowsDateString="",yesterdaysDateString="",todaysDateString="";
public int getMonthVal(){
		if(month.equals("JAN")) monthVal = 1;
		else if (month.equals("FEB")) monthVal = 2;
		else if(month.equals("MAR")) monthVal = 3;
		else if(month.equals("APR")) monthVal = 4;
		else if(month.equals("MAY")) monthVal = 5;
		else if(month.equals("JUN")) monthVal = 6;
		else if(month.equals("JUL")) monthVal = 7;
		else if(month.equals("AUG")) monthVal = 8;
		else if(month.equals("SEP")) monthVal = 9;
		else if(month.equals("OCT")) monthVal = 10;
		else if(month.equals("NOV")) monthVal = 11;
		else if(month.equals("DEC")) monthVal = 12;

		return monthVal;

}


public String getDateString(String dayType){
		String returnString="";

		this.dayType = dayType; // "yesterday" or "tomorrow"

		SimpleDateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
        Date now=new Date();
        String sysDate=df.format(now);
	try{
        Date date1 = df.parse(sysDate);
 		long d1=date1.getTime();
			//get yesterday's date
		long days = d1-(1000 * 60 * 60 *24);
		GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(new java.util.Date(days));

		String prevDayString = df.format(cal.getTime()).toUpperCase();

		//get next day's date
		days = d1+(1000 * 60 * 60 *24);
		cal = new GregorianCalendar();
		cal.setTime(new java.util.Date(days));

		String nextDayString = df.format(cal.getTime()).toUpperCase();

		cal = new GregorianCalendar();
		cal.setTime(new java.util.Date(d1));
		String todayString = df.format(cal.getTime()).toUpperCase();

		if(dayType.equals("yesterday")) returnString = prevDayString;
		else if(dayType.equals("tomorrow")) returnString = nextDayString;
		else if(dayType.equals("today")) returnString = todayString;

	}catch(java.text.ParseException pe){}

		return returnString;
}

public void setMonth(String mon){
	month=mon;
}

/* methods to get tomorrows date parts */

public int getTomorrowsDate(){
	this.tomorrowsDateString = getDateString("tomorrow");

	return Integer.parseInt(tomorrowsDateString.substring(0,2));
}

public String getTomorrowsMonth(){
	this.tomorrowsDateString = getDateString("tomorrow");

	return tomorrowsDateString.substring(3,6);
}

public int getTomorrowsYear(){
	this.tomorrowsDateString = getDateString("tomorrow");

	return Integer.parseInt(tomorrowsDateString.substring(7,11));
}


/* methods to get yesterdays date parts */
public int getYesterdaysDate(){
	this.yesterdaysDateString = getDateString("yesterday");

	return Integer.parseInt(yesterdaysDateString.substring(0,2));
}

public String getYesterdaysMonth(){
	this.yesterdaysDateString = getDateString("yesterday");

	return yesterdaysDateString.substring(3,6);
}

public int getYesterdaysYear(){
	this.yesterdaysDateString = getDateString("yesterday");

	return Integer.parseInt(yesterdaysDateString.substring(7,11));
}

/* methods to get todays date parts */

public int getTodaysDate(){
	this.todaysDateString = getDateString("today");

	return Integer.parseInt(todaysDateString.substring(0,2));
}

public String getTodaysMonth(){
	this.todaysDateString = getDateString("today");

	return todaysDateString.substring(3,6);
}

public int getTodaysYear(){
	this.todaysDateString = getDateString("today");

	return Integer.parseInt(todaysDateString.substring(7,11));
}


  }


