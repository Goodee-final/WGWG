package com.min.edu.ctrl.notice;

import java.util.UUID;

public class NoticeUtil {
	public static String createUUID() {		
		System.out.println(UUID.randomUUID().toString());
		return UUID.randomUUID().toString().replaceAll("-", "");	
	}	
}
