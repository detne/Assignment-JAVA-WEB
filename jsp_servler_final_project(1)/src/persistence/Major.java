package persistence;

public class Major {
	private String id;
	private String name;

	public Major() {
	}

	public Major(String id, String name) {
		this.id = id;
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
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
		return "Major [id=" + id + ", name=" + name + "]";
	}

}
