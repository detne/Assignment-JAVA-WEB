package models;

import java.util.Date;

public class Invoice {
	private int id;
	private int accountId;
	private int serviceId;
	private int durationId;
	private String description;
	private Date created;
	private boolean status;
	public Invoice() {
		super();
	}
	
	public Invoice(int id, int accountId, int serviceId, int durationId, String description, Date created,
			boolean status) {
		super();
		this.id = id;
		this.accountId = accountId;
		this.serviceId = serviceId;
		this.durationId = durationId;
		this.description = description;
		this.created = created;
		this.status = status;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	public int getDurationId() {
		return durationId;
	}
	public void setDurationId(int durationId) {
		this.durationId = durationId;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Invoice [id=" + id + ", accountId=" + accountId + ", serviceId=" + serviceId + ", durationId="
				+ durationId + ", description=" + description + ", created=" + created + ", status=" + status + "]";
	}
	
}
