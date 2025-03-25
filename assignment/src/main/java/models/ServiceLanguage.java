package models;

public class ServiceLanguage {
	private int id;
	private int languageID;
	private int postID;
	private String name;
	private String introduction;
	private String description;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLanguageID() {
		return languageID;
	}
	public void setLanguageID(int languageID) {
		this.languageID = languageID;
	}
	public int getPostID() {
		return postID;
	}
	public void setPostID(int postID) {
		this.postID = postID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public ServiceLanguage(int id, int languageID, int postID, String name, String introduction, String description) {
		super();
		this.id = id;
		this.languageID = languageID;
		this.postID = postID;
		this.name = name;
		this.introduction = introduction;
		this.description = description;
	}
	public ServiceLanguage() {
		super();
	}
	@Override
	public String toString() {
		return "ServiceLanguage [id=" + id + ", languageID=" + languageID + ", postID=" + postID + ", name=" + name
				+ ", introduction=" + introduction + ", description=" + description + "]";
	}
	
}
