package models;

public class Duration {
	private int id;
	private boolean status;
	private String name;
	public Duration(int id, boolean status, String name) {
		super();
		this.id = id;
		this.status = status;
		this.name = name;
	}
	public Duration() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Duration [id=" + id + ", status=" + status + ", name=" + name + "]";
	}
	
	
}
