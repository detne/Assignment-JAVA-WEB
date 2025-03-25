package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import models.Accountdetails;
import models.ConnectDB;

public class AccountDetailsDAO {
	public Accountdetails findAccountByAccountID(int accID) {
		Accountdetails account = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from accountdetails where accountid = ?");
			preparedStatement.setInt(1, accID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				account = new Accountdetails();
				account.setId(resultSet.getInt("id"));
				account.setAddress(resultSet.getString("address"));
				account.setAvatar(resultSet.getString("avatar"));
				account.setBirthday(resultSet.getDate("birthday"));
				account.setAccountid(resultSet.getInt("accountid"));
				account.setPhonenumber(resultSet.getString("phonenumber"));
				account.setUpdatedate(resultSet.getDate("updatedate"));
				account.setName(resultSet.getString("name"));
				account.setBalance(resultSet.getDouble("balance"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			account = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		return account;
	}
	
	
	public boolean create(Accountdetails accountdetails) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("insert into accountdetails(accountid,name,birthday,address,phonenumber,avatar,updatedate, balance) values(?, ?, ?, ?, ?, ?, ?, ?)");
			preparedStatement.setInt(1, accountdetails.getAccountid());
			preparedStatement.setString(2, accountdetails.getName());
			preparedStatement.setDate(3, new Date(accountdetails.getBirthday().getTime()));
			preparedStatement.setString(4, accountdetails.getAddress());
			preparedStatement.setString(5, accountdetails.getPhonenumber());
			preparedStatement.setString(6, accountdetails.getAvatar());
			preparedStatement.setDate(7, new Date(accountdetails.getUpdatedate().getTime()));
			preparedStatement.setDouble(8, accountdetails.getBalance());
			
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
	
	public boolean update(Accountdetails accountdetails) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("update accountdetails set name = ?, birthday = ?, address = ?, phonenumber = ?, avatar = ?, updatedate = ?, balance = ? where accountid = ?");
			preparedStatement.setString(1, accountdetails.getName());
			preparedStatement.setDate(2, new Date(accountdetails.getBirthday().getTime()));
			preparedStatement.setString(3, accountdetails.getAddress());
			preparedStatement.setString(4, accountdetails.getPhonenumber());
			preparedStatement.setString(5, accountdetails.getAvatar());
			preparedStatement.setDate(6, new Date(accountdetails.getUpdatedate().getTime()));
			preparedStatement.setDouble(7, accountdetails.getBalance());
			preparedStatement.setInt(8, accountdetails.getAccountid());
			
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
	public boolean updateBalance(Accountdetails accountdetails) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("update accountdetails set balance = ? where accountid = ?");
			preparedStatement.setDouble(1, accountdetails.getBalance());
			preparedStatement.setInt(2, accountdetails.getAccountid());
			
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
	
	public static void main(String[] args) {
		AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
		Accountdetails accountdetails = accountDetailsDAO.findAccountByAccountID(43);
		accountdetails.setBalance(10000);
		System.out.println(accountDetailsDAO.updateBalance(accountdetails));
		
	}
}
