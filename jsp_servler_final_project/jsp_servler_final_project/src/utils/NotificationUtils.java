package utils;

import java.util.Optional;

import persistence.Notification;
import services.NotificationServiceImp;

public class NotificationUtils {
	private NotificationUtils() {
	}
	
	public static Optional<Notification> getNotificationById(String id) {
		return new NotificationServiceImp().getNotificationById(id);
	}
	
}
