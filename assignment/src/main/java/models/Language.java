package models;

public class Language {
	private int id;
	private String languageID;
	private String countryID;
	private String countryName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLanguageID() {
		return languageID;
	}
	public void setLanguageID(String languageID) {
		this.languageID = languageID;
	}
	public String getCountryID() {
		return countryID;
	}
	public void setCountryID(String countryID) {
		this.countryID = countryID;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public Language(int id, String languageID, String countryID, String countryName) {
		super();
		this.id = id;
		this.languageID = languageID;
		this.countryID = countryID;
		this.countryName = countryName;
	}
	public Language() {
		super();
	}
	@Override
	public String toString() {
		return "Language [id=" + id + ", languageID=" + languageID + ", countryID=" + countryID + ", countryName="
				+ countryName + "]";
	}
	
	
}
