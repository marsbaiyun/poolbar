package com.kaishengit.util;

import java.util.TimeZone;

import hirondelle.date4j.DateTime;

public class DateUtil {
    
    public static String getNow() {
        return DateTime.now(TimeZone.getDefault()).format("YYYY-MM-DD hh:mm:ss").toString();
    }
}
