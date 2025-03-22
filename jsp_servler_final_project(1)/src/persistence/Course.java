package persistence;

public class Course {
	private String id;
	private String title;
	private String id_major;

	public Course() {
	}

	public Course(String id, String title, String id_major) {
		this.id = id;
		this.title = title;
		this.id_major = id_major;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId_major() {
		return id_major;
	}

	public void setId_major(String id_major) {
		this.id_major = id_major;
	}

	@Override
	public String toString() {
		return "Course [id=" + id + ", title=" + title + ", id_major=" + id_major + "]";
	}

}
