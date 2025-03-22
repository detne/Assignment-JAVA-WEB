package constant;

public enum Role {
	USER("user"), MODERATOR("moderator"),ADMIN("admin");

	private String role;

	Role(String role) {
		this.role = role;
	}

	public String getRole() {
		return role;
	}

	@Override
	public String toString() {
		return role;
	}
}
