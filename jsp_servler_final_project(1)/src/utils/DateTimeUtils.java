package utils;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateTimeUtils {
	
	private DateTimeUtils() {
	}
	
	public static String format(LocalDateTime datetime) {
		return DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss").format(datetime);
	}
	
	public static Duration duration(LocalDateTime from) {
		return Duration.between(from, LocalDateTime.now());
	}
	
	public static void main(String[] args) {
		System.out.println(duration(LocalDateTime.of(2023, 11, 5, 8, 0, 0)));
	}
	
}
