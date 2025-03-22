package persistence;

public class Recipient {
	private String id_recipient;
	private String id_notification;
	private String username;
	private String id_document;
	private boolean for_All_Users;

	public Recipient() {
	}

	public Recipient(String id_recipient, String id_notification, String username, String id_document,
			boolean for_All_Users) {
		this.id_recipient = id_recipient;
		this.id_notification = id_notification;
		this.username = username;
		this.id_document = id_document;
		this.for_All_Users = for_All_Users;
	}

	public String getId_recipient() {
		return id_recipient;
	}

	public void setId_recipient(String id_recipient) {
		this.id_recipient = id_recipient;
	}

	public String getId_notification() {
		return id_notification;
	}

	public void setId_notification(String id_notification) {
		this.id_notification = id_notification;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getId_document() {
		return id_document;
	}

	public void setId_document(String id_document) {
		this.id_document = id_document;
	}

	public boolean for_All_Users() {
		return for_All_Users;
	}

	public void setFor_All_Users(boolean for_All_Users) {
		this.for_All_Users = for_All_Users;
	}

	@Override
	public String toString() {
		return "Recipient [id_recipient=" + id_recipient + ", id_notification=" + id_notification + ", username="
				+ username + ", id_document=" + id_document + ", for_All_Users=" + for_All_Users + "]";
	}

}
