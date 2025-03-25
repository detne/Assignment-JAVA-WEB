package models;

import java.util.Date;

public class Owner {
	private Integer id;
	private String name;
	private Date birthday;
	private String phone;
	private String address;
	private String identifynumber;
	private Date created;
	private String avatar;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIdentifynumber() {
		return identifynumber;
	}
	public void setIdentifynumber(String identifynumber) {
		this.identifynumber = identifynumber;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public Owner(Integer id, String name, Date birthday, String phone, String address, String identifynumber,
			Date created, String avatar) {
		super();
		this.id = id;
		this.name = name;
		this.birthday = birthday;
		this.phone = phone;
		this.address = address;
		this.identifynumber = identifynumber;
		this.created = created;
		this.avatar = avatar;
	}
	public Owner() {
		super();
	}
	@Override
	public String toString() {
		return "Owner [id=" + id + ", name=" + name + ", birthday=" + birthday + ", phone=" + phone + ", address="
				+ address + ", identifynumber=" + identifynumber + ", created=" + created + ", avatar=" + avatar + "]";
	}
	
}
