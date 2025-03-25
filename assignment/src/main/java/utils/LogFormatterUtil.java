package utils;

import java.util.Date;

public class LogFormatterUtil {
	public static void create(String ip, String level, String national, Date time) {
		System.out.println("ip: " + ip);
		System.out.println("level: " + level);
		System.out.println("national: " + national);
		System.out.println("time: " + time);
	}
	
}
