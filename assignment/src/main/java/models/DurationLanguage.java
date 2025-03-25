package models;

public class DurationLanguage {
	private int id;
	private int languageID;
	private int durationID;
	private String name;
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
	public int getDurationID() {
		return durationID;
	}
	public void setDurationID(int durationID) {
		this.durationID = durationID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public DurationLanguage(int id, int languageID, int durationID, String name) {
		super();
		this.id = id;
		this.languageID = languageID;
		this.durationID = durationID;
		this.name = name;
	}
	public DurationLanguage() {
		super();
	}
	@Override
	public String toString() {
		return "DurationLanguage [id=" + id + ", languageID=" + languageID + ", durationID=" + durationID + ", name="
				+ name + "]";
	}


	
}
