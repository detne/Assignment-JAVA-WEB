package models;

public class Floor {
	private int id;
	private String name;
	public Floor(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public Floor() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Floor [id=" + id + ", name=" + name + "]";
	}
	
}
