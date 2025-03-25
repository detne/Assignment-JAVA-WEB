package models;

import java.util.Date;

public class Systemapartmentimage {
	private Integer id;
	private int systemapartmentid;
	private String name;
	private Date created;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getSystemapartmentid() {
		return systemapartmentid;
	}
	public void setSystemapartmentid(int systemapartmentid) {
		this.systemapartmentid = systemapartmentid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Systemapartmentimage(Integer id, int systemapartmentid, String name, Date created) {
		super();
		this.id = id;
		this.systemapartmentid = systemapartmentid;
		this.name = name;
		this.created = created;
	}
	public Systemapartmentimage() {
		super();
	}
	@Override
	public String toString() {
		return "Systemapartmentimage [id=" + id + ", systemapartmentid=" + systemapartmentid + ", name=" + name
				+ ", created=" + created + "]";
	}
	
}
