package models;

import java.util.Date;

public class Post {
	private Integer id;
	private int accountid;
	private String subject;
	private Date postdate;
	private int bedroom;
	private int bathroom;
	private double price;
	private double deposit;
	private double area;
	private String description;
	private String address;
	private String avatar;
	private boolean status;
	public Post(Integer id, int accountid, String subject, Date postdate, int bedroom, int bathroom, double price,
			double deposit, double area, String description, String address, String avatar, boolean status) {
		super();
		this.id = id;
		this.accountid = accountid;
		this.subject = subject;
		this.postdate = postdate;
		this.bedroom = bedroom;
		this.bathroom = bathroom;
		this.price = price;
		this.deposit = deposit;
		this.area = area;
		this.description = description;
		this.address = address;
		this.avatar = avatar;
		this.status = status;
	}
	public Post() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getAccountid() {
		return accountid;
	}
	public void setAccountid(int accountid) {
		this.accountid = accountid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public int getBedroom() {
		return bedroom;
	}
	public void setBedroom(int bedroom) {
		this.bedroom = bedroom;
	}
	public int getBathroom() {
		return bathroom;
	}
	public void setBathroom(int bathroom) {
		this.bathroom = bathroom;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getDeposit() {
		return deposit;
	}
	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}
	public double getArea() {
		return area;
	}
	public void setArea(double area) {
		this.area = area;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Post [id=" + id + ", accountid=" + accountid + ", subject=" + subject + ", postdate=" + postdate
				+ ", bedroom=" + bedroom + ", bathroom=" + bathroom + ", price=" + price + ", deposit=" + deposit
				+ ", area=" + area + ", description=" + description + ", address=" + address + ", avatar=" + avatar
				+ ", status=" + status + "]";
	}
	
}	
