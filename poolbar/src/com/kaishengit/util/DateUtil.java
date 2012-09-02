package com.kaishengit.util;

import java.util.TimeZone;

import hirondelle.date4j.DateTime;

public class DateUtil {
    
    public static String getNow() {
        return DateTime.now(TimeZone.getDefault()).format("YYYY-MM-DD hh:mm:ss").toString();
    }
    
    public static float getDiff(String startTime, String endTime) {
        DateTime time1 = new DateTime(startTime);
        DateTime time2 = new DateTime(endTime);
        int diff = time2.getSecond() - time1.getSecond();
        long second = time1.numSecondsFrom(time2) - diff;
        float hour = (float) second / 60 / 60; 
        
        return hour;
    }
    
    public static void main(String[] args) {
        String str1 = "2012-09-02 02:03:56";
        String str2 = "2012-09-02 05:03:15";
        System.out.println(getDiff(str1, str2));
    }
}
