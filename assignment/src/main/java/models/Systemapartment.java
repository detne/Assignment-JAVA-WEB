package models;

public class Systemapartment {
	private Integer id;
	private int branchid;
	private int floorid;
	private int roomid;
	private String subject;
	private int bedroom;
	private int bathroom;
	private double price;
	private double deposit;
	private String area;
	private String description;
	private String avatar;
	private boolean status;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getBranchid() {
		return branchid;
	}
	public void setBranchid(int branchid) {
		this.branchid = branchid;
	}
	public int getFloorid() {
		return floorid;
	}
	public void setFloorid(int floorid) {
		this.floorid = floorid;
	}
	public int getRoomid() {
		return roomid;
	}
	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
		return "Systemapartment [id=" + id + ", branchid=" + branchid + ", floorid=" + floorid + ", roomid=" + roomid
				+ ", subject=" + subject + ", bedroom=" + bedroom + ", bathroom=" + bathroom + ", price=" + price
				+ ", deposit=" + deposit + ", area=" + area + ", description=" + description + ", avatar=" + avatar
				+ ", status=" + status + "]";
	}
	public Systemapartment(Integer id, int branchid, int floorid, int roomid, String subject, int bedroom, int bathroom,
			double price, double deposit, String area, String description, String avatar, boolean status) {
		super();
		this.id = id;
		this.branchid = branchid;
		this.floorid = floorid;
		this.roomid = roomid;
		this.subject = subject;
		this.bedroom = bedroom;
		this.bathroom = bathroom;
		this.price = price;
		this.deposit = deposit;
		this.area = area;
		this.description = description;
		this.avatar = avatar;
		this.status = status;
	}
	public Systemapartment() {
		super();
	}
	
}
