package models;

import java.util.Date;

public class Transaction {
	private int id;
	private int type;
	private double price;
	private Date date;
	private int accountID;
	private String orderInfo;
	private String paymentType;
	private String transactionNo;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getAccountID() {
		return accountID;
	}
	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}
	public String getOrderInfo() {
		return orderInfo;
	}
	public void setOrderInfo(String orderInfo) {
		this.orderInfo = orderInfo;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getTransactionNo() {
		return transactionNo;
	}
	public void setTransactionNo(String transactionNo) {
		this.transactionNo = transactionNo;
	}
	public Transaction(int id, int type, double price, Date date, int accountID, String orderInfo, String paymentType,
			String transactionNo) {
		super();
		this.id = id;
		this.type = type;
		this.price = price;
		this.date = date;
		this.accountID = accountID;
		this.orderInfo = orderInfo;
		this.paymentType = paymentType;
		this.transactionNo = transactionNo;
	}
	public Transaction() {
		super();
	}
	public Transaction(int type, double price, Date date, int accountID, String orderInfo, String paymentType,
			String transactionNo) {
		super();
		this.type = type;
		this.price = price;
		this.date = date;
		this.accountID = accountID;
		this.orderInfo = orderInfo;
		this.paymentType = paymentType;
		this.transactionNo = transactionNo;
	}
	@Override
	public String toString() {
		return "Transaction [id=" + id + ", type=" + type + ", price=" + price + ", date=" + date + ", accountID="
				+ accountID + ", orderInfo=" + orderInfo + ", paymentType=" + paymentType + ", transactionNo="
				+ transactionNo + "]";
	}
	
	
}		
