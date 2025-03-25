package models;

import java.util.Date;

public class Contract {

	private int id;
	private int ownerid;
	private int systemapartmentid;
	private boolean status;
	private Date created;
	private String description;
	public Contract(int id, int ownerid, int systemapartmentid, boolean status, Date created, String description) {
		super();
		this.id = id;
		this.ownerid = ownerid;
		this.systemapartmentid = systemapartmentid;
		this.status = status;
		this.created = created;
		this.description = description;
	}
	public Contract() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOwnerid() {
		return ownerid;
	}
	public void setOwnerid(int ownerid) {
		this.ownerid = ownerid;
	}
	public int getSystemapartmentid() {
		return systemapartmentid;
	}
	public void setSystemapartmentid(int systemapartmentid) {
		this.systemapartmentid = systemapartmentid;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Contract [id=" + id + ", ownerid=" + ownerid + ", systemapartmentid=" + systemapartmentid + ", status="
				+ status + ", created=" + created + ", description=" + description + "]";
	}
	
}
