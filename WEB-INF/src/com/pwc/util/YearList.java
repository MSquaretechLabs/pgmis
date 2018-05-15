package com.pwc.util;

import java.util.*;
import java.text.*;

public class YearList{
int startYear = 1980;
private int currentYear = 0, endYear = 0, arraySize = 0, newYearIndex = 0;


 public static YearList get()
 {
     if(instance == null)
       instance = new YearList();
     return instance;
 }
public int[] getYearList(){

	currentYear = getCurrentYear();
	endYear = getEndYear();
	arraySize = endYear - startYear;
	newYearIndex = currentYear - startYear +1;

	int [] years = new int[arraySize];

	years[0] = startYear;

	for(int i=1;i<=arraySize-1;i++){
		years[i] = startYear + 1;
		startYear++;
	}

	//years[newYearIndex] = ++currentYear;
	//years[newYearIndex+1] = ++currentYear;
	//years[newYearIndex+2] = ++currentYear;

	return years;
}

public int getStartYear(){
	return startYear;
}

public int getEndYear(){
	return getCurrentYear()+1;
}

public int getCurrentYear(){
	Date cDate=new Date();
	SimpleDateFormat yearf = new SimpleDateFormat("yyyy");

	return Integer.parseInt(yearf.format(cDate));
}
private static YearList instance;
  }


