package services;

import java.util.List;
import java.util.Optional;

import persistence.Notification;

public interface NotificationService {

	List<Notification> getAllNotifications();
	
	Optional<Notification> getNotificationById(String id);
	
	void saveNotification(Notification notification);
	
	Notification getLastestNotification();
}
