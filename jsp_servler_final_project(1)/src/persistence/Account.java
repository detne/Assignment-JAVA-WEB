package persistence;

import java.sql.Timestamp;

public class Account {
	private String username;
	private String password;
	private String email;
	private Timestamp date_created;
	private String role;

	public Account() {
	}

	public Account(String username, String password, String email, Timestamp date_created, String role) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.date_created = date_created;
		this.role = role;
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

	public Timestamp getDate_created() {
		return date_created;
	}

	public void setDate_created(Timestamp date_created) {
		this.date_created = date_created;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Account [username=" + username + ", password=" + password + ", email=" + email + ", date_created="
				+ date_created + ", role=" + role + "]";
	}

}
