package models;

import java.util.Date;

public class Contact {
	private int id;
	private String subject;
	private String description;
	private String name;
	private String phone;
	private String email;
	private Date created;
	private boolean status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Contact(int id, String subject, String description, String name, String phone, String email, Date created,
			boolean status) {
		super();
		this.id = id;
		this.subject = subject;
		this.description = description;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.created = created;
		this.status = status;
	}
	public Contact() {
		super();
	}
	@Override
	public String toString() {
		return "Contact [id=" + id + ", subject=" + subject + ", description=" + description + ", name=" + name
				+ ", phone=" + phone + ", email=" + email + ", created=" + created + ", status=" + status + "]";
	}
	
}