package persistence;

import java.time.LocalDateTime;

public class Notification {
	private String id_notification;
	private String title;
	private String message;
	private LocalDateTime timestamp;

	public Notification(String id_notification, String title, String message, LocalDateTime timestamp) {
		this.id_notification = id_notification;
		this.title = title;
		this.message = message;
		this.timestamp = timestamp;
	}

	public String getId_notification() {
		return id_notification;
	}

	public void setId_notification(String id_notification) {
		this.id_notification = id_notification;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public LocalDateTime getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(LocalDateTime timestamp) {
		this.timestamp = timestamp;
	}

	@Override
	public String toString() {
		return "Notification [id_notification=" + id_notification + ", title=" + title + ", message=" + message
				+ ", timestamp=" + timestamp + "]";
	}

}
