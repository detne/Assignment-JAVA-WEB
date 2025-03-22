package constant;

public enum Status {
	PENDING("pending"), DECLINE("decline"), APPROVE("approve");

	private String status;

	Status(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status;
	}

	@Override
	public String toString() {
		return status;
	}
}
