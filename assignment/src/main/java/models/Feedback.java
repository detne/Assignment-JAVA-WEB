package models;

import java.util.Date;

public class Feedback {
	private int id;
	private int accountid;
	private String subject;
	private String description;
	private Date created;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAccountid() {
		return accountid;
	}
	public void setAccountid(int accountid) {
		this.accountid = accountid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Feedback(int id, int accountid, String subject, String description, Date created) {
		super();
		this.id = id;
		this.accountid = accountid;
		this.subject = subject;
		this.description = description;
		this.created = created;
	}
	public Feedback() {
		super();
	}
	@Override
	public String toString() {
		return "Feedback [id=" + id + ", accountid=" + accountid + ", subject=" + subject + ", description="
				+ description + ", created=" + created + "]";
	}
	
}
