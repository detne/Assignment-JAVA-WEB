package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import models.ConnectDB;
import models.Transaction;

public class TransactionDAO {
	
	public boolean create(Transaction transaction) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("insert into transaction(type,price,date,accountID ,orderinfo,paymenttype,transactionno) values(?, ?, ?, ?,?, ?, ?)");
			preparedStatement.setInt(1, transaction.getType());
			preparedStatement.setDouble(2, transaction.getPrice());
			preparedStatement.setTimestamp(3, new Timestamp(transaction.getDate().getTime()));
			preparedStatement.setInt(4, transaction.getAccountID());
			preparedStatement.setString(5, transaction.getOrderInfo());
			preparedStatement.setString(6, transaction.getPaymentType());
			preparedStatement.setString(7, transaction.getTransactionNo());
			status = preparedStatement.executeUpdate() > 0;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			status = false;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		return status;
	}
	public List<Transaction> findAll() {
		List<Transaction> transactions = new ArrayList<Transaction>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from transaction");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Transaction transaction = new Transaction();
				transaction.setId(resultSet.getInt("id"));
				transaction.setType(resultSet.getInt("type"));
				transaction.setPrice(resultSet.getDouble("price"));
				transaction.setDate(resultSet.getTimestamp("date"));
				transaction.setAccountID(resultSet.getInt("accountID"));
				transaction.setOrderInfo(resultSet.getString("orderinfo"));
				transaction.setPaymentType(resultSet.getString("paymenttype"));
				transaction.setTransactionNo(resultSet.getString("transactionno"));
				
				
				transactions.add(transaction);
			}
		} catch (Exception e) {
			e.printStackTrace();
			transactions = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return transactions;
	}
	public static void main(String[] args) {
		
		System.out.println(new TransactionDAO().findAll());
	}
}
