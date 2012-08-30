package com.kaishengit.util;

import java.util.UUID;

public class PKUtil {
    public static String getPK() {
        String uuid = UUID.randomUUID().toString();
        uuid = uuid.replaceAll("-", "");
        return uuid;
    }
}
