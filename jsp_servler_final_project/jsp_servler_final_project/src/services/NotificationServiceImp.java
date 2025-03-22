package services;

import java.util.List;
import java.util.Optional;

import dao.JDBCNotificationDAO;
import dao.NotificationDAO;
import persistence.Notification;

public class NotificationServiceImp implements NotificationService{

	private NotificationDAO notificationDao;
	
	public NotificationServiceImp() {
		notificationDao = new JDBCNotificationDAO();
	}
	
	@Override
	public List<Notification> getAllNotifications() {
		return notificationDao.getAllNotifications();
	}

	@Override
	public void saveNotification(Notification notification) {
		notificationDao.saveNotification(notification);
	}

	@Override
	public Notification getLastestNotification() {
		return notificationDao.getLastestNotification();
	}

	@Override
	public Optional<Notification> getNotificationById(String id) {
		return notificationDao.getNotificationById(id);
	}

}
