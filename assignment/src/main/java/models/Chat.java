package models;

import java.util.Date;

public class Chat {
	private int id;
	private int userID;
	private int adminID;
	private String message;
	private int role;
	private Date time;
	public Chat(int id, int userID, int adminID, String message, int role, Date time) {
		super();
		this.id = id;
		this.userID = userID;
		this.adminID = adminID;
		this.message = message;
		this.role = role;
		this.time = time;
	}
	public Chat() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getAdminID() {
		return adminID;
	}
	public void setAdminID(int adminID) {
		this.adminID = adminID;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
	public Chat(int userID, int adminID, String message, int role, Date time) {
		super();
		this.userID = userID;
		this.adminID = adminID;
		this.message = message;
		this.role = role;
		this.time = time;
	}
	@Override
	public String toString() {
		return "Chat [id=" + id + ", userID=" + userID + ", adminID=" + adminID + ", message=" + message + ", role="
				+ role + ", time=" + time + "]";
	}
	
	
	
}
