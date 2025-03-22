package persistence;

public class Category {
	private String id_category;
	private String title_category;

	public Category() {
	}

	public Category(String id_category, String title_category) {
		this.id_category = id_category;
		this.title_category = title_category;
	}

	public String getId_category() {
		return id_category;
	}

	public void setId_category(String id_category) {
		this.id_category = id_category;
	}

	public String getTitle_category() {
		return title_category;
	}

	public void setTitle_category(String title_category) {
		this.title_category = title_category;
	}

	@Override
	public String toString() {
		return "Category [id_category=" + id_category + ", title_category=" + title_category + "]";
	}

}
