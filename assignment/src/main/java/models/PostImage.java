package models;

import java.util.Date;

public class PostImage {
	private Integer id;
	private int postid;
	private String name;
	private Date created;
	public PostImage(Integer id, int postid, String name, Date created) {
		super();
		this.id = id;
		this.postid = postid;
		this.name = name;
		this.created = created;
	}
	public PostImage() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
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
	@Override
	public String toString() {
		return "Image [id=" + id + ", postid=" + postid + ", name=" + name + ", created=" + created + "]";
	}
	
}
