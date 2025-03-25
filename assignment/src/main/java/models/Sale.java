package models;

public class Sale {
	private int id;
	private String name;
	private double saleNumber;
	private boolean status;
	public Sale(int id, String name, double saleNumber, boolean status) {
		super();
		this.id = id;
		this.name = name;
		this.saleNumber = saleNumber;
		this.status = status;
	}
	public Sale() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getSaleNumber() {
		return saleNumber;
	}
	public void setSaleNumber(double saleNumber) {
		this.saleNumber = saleNumber;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Sale [id=" + id + ", name=" + name + ", saleNumber=" + saleNumber + ", status=" + status + "]";
	}
	
	

}
