package models;

import java.util.Date;

public class Account {
	private int id;
	private String username;
	private String password;
	private String email;
	private Date created;
	private boolean verify;
	private String securityCode;
	private boolean status;
	private int role;
	private Integer gmailID;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public boolean isVerify() {
		return verify;
	}
	public void setVerify(boolean verify) {
		this.verify = verify;
	}
	public String getSecurityCode() {
		return securityCode;
	}
	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public Integer  getGmailID() {
		return gmailID;
	}
	public void setGmailID(Integer  gmailID) {
		this.gmailID = gmailID;
	}
	public Account(int id, String username, String password, String email, Date created, boolean verify,
			String securityCode, boolean status, int role) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.created = created;
		this.verify = verify;
		this.securityCode = securityCode;
		this.status = status;
		this.role = role;
	}
	public Account() {
		super();
	}
	public Account(int id, String username, String password, String email, Date created, boolean verify,
			String securityCode, boolean status, int role, int gmailID) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.created = created;
		this.verify = verify;
		this.securityCode = securityCode;
		this.status = status;
		this.role = role;
		this.gmailID = gmailID;
	}
	@Override
	public String toString() {
		return "Account [id=" + id + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", created=" + created + ", verify=" + verify + ", securityCode=" + securityCode + ", status="
				+ status + ", role=" + role + ", gmailID=" + gmailID + "]";
	}

}
