package com.kaishengit.util;

import java.util.TimeZone;


import hirondelle.date4j.DateTime;

public class DateUtil {
    
    public static String getNow() {
        return DateTime.now(TimeZone.getDefault()).format("YYYY-MM-DD hh:mm:ss").toString();
    }
    public static String getDay() {
    	return DateTime.now(TimeZone.getDefault()).format("YYYY-MM-DD").toString();
    }
   
    
    public static float getDiff(String startTime, String endTime) {
        DateTime time1 = new DateTime(startTime);
        DateTime time2 = new DateTime(endTime);
        int diff = time2.getSecond() - time1.getSecond();
        long second = time1.numSecondsFrom(time2) - diff;
        float hour = (float) second / 60 / 60; 
        
        return hour;
    }
    
    public static String getStartMonth(){
    	DateTime time1 = new DateTime(getNow());
    	return time1.getStartOfMonth().format("YYYY-MM-DD").toString();
    } 
    
    public static void main(String[] args) {
       System.out.println(getStartMonth());
    }
}
