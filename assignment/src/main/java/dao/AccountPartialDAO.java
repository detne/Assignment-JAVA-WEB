package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import models.AccountPartial;
import models.ConnectDB;

public class AccountPartialDAO {
	public List<AccountPartial> findAll(){
		List<AccountPartial> accounts = new ArrayList<AccountPartial>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select acc.id, acc.role,acc.username,ad.name,ad.birthday,acc.email, ad.phonenumber,acc.status,"
							+ "acc.verify, ad.avatar,acc.created,ad.address"
							+ " from account acc INNER JOIN accountdetails ad ON acc.id = ad.accountid");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				AccountPartial account = new AccountPartial();
				account.setId(resultSet.getInt("acc.id"));
				account.setRole(resultSet.getInt("acc.role"));
				account.setUsername(resultSet.getString("acc.username"));
				account.setName(resultSet.getString("ad.name"));
				account.setBirthday(resultSet.getDate("ad.birthday"));
				account.setEmail(resultSet.getString("acc.email"));
				account.setPhoneNumber(resultSet.getString("ad.phonenumber"));
				account.setStatus(resultSet.getBoolean("acc.status"));
				account.setVerify(resultSet.getBoolean("acc.verify"));
				account.setAvatar(resultSet.getString("ad.avatar"));
				account.setCreated(resultSet.getDate("acc.created"));
				account.setAddress(resultSet.getString("ad.address"));
				accounts.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
			accounts = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return accounts;
	}
	
	public List<AccountPartial> searchByName(String name){
		List<AccountPartial> accounts = new ArrayList<AccountPartial>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select acc.id, acc.role,acc.username,ad.name,ad.birthday,acc.email, ad.phonenumber,acc.status,"
							+ "acc.verify, ad.avatar,acc.created,ad.address"
							+ " from account acc INNER JOIN accountdetails ad ON acc.id = ad.accountid"
							+ " where ad.name like ?");
			preparedStatement.setString(1,"%" + name + "%" );
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				AccountPartial account = new AccountPartial();
				account.setId(resultSet.getInt("acc.id"));
				account.setUsername(resultSet.getString("acc.username"));
				account.setRole(resultSet.getInt("acc.role"));
				account.setName(resultSet.getString("ad.name"));
				account.setBirthday(resultSet.getDate("ad.birthday"));
				account.setEmail(resultSet.getString("acc.email"));
				account.setPhoneNumber(resultSet.getString("ad.phonenumber"));
				account.setStatus(resultSet.getBoolean("acc.status"));
				account.setVerify(resultSet.getBoolean("acc.verify"));
				account.setAvatar(resultSet.getString("ad.avatar"));
				account.setCreated(resultSet.getDate("acc.created"));
				account.setAddress(resultSet.getString("ad.address"));
				accounts.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
			accounts = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return accounts;
	}
	
	public List<AccountPartial> searchByPhone(String phoneNumber){
		List<AccountPartial> accounts = new ArrayList<AccountPartial>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select acc.id, acc.role,acc.username,ad.name,ad.birthday,acc.email, ad.phonenumber,acc.status,"
							+ "acc.verify, ad.avatar,acc.created,ad.address"
							+ " from account acc INNER JOIN accountdetails ad ON acc.id = ad.accountid"
							+ " where ad.phonenumber like ?");
			preparedStatement.setString(1,"%" + phoneNumber + "%" );
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				AccountPartial account = new AccountPartial();
				account.setId(resultSet.getInt("acc.id"));
				account.setUsername(resultSet.getString("acc.username"));
				account.setRole(resultSet.getInt("acc.role"));
				account.setName(resultSet.getString("ad.name"));
				account.setBirthday(resultSet.getDate("ad.birthday"));
				account.setEmail(resultSet.getString("acc.email"));
				account.setPhoneNumber(resultSet.getString("ad.phonenumber"));
				account.setStatus(resultSet.getBoolean("acc.status"));
				account.setVerify(resultSet.getBoolean("acc.verify"));
				account.setAvatar(resultSet.getString("ad.avatar"));
				account.setCreated(resultSet.getDate("acc.created"));
				account.setAddress(resultSet.getString("ad.address"));
				accounts.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
			accounts = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return accounts;
	}
	// Hàm check account đã xác thực (verify true hoặc false)
	public List<AccountPartial> checkVerify(boolean verify){
		List<AccountPartial> accounts = new ArrayList<AccountPartial>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select acc.id, acc.role,acc.username,ad.name,ad.birthday,acc.email, ad.phonenumber,acc.status,"
							+ "acc.verify, ad.avatar,acc.created,ad.address"
							+ " from account acc INNER JOIN accountdetails ad ON acc.id = ad.accountid"
							+ " where acc.verify = ?");
			preparedStatement.setBoolean(1,verify);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				AccountPartial account = new AccountPartial();
				account.setId(resultSet.getInt("acc.id"));
				account.setUsername(resultSet.getString("acc.username"));
				account.setRole(resultSet.getInt("acc.role"));
				account.setName(resultSet.getString("ad.name"));
				account.setBirthday(resultSet.getDate("ad.birthday"));
				account.setEmail(resultSet.getString("acc.email"));
				account.setPhoneNumber(resultSet.getString("ad.phonenumber"));
				account.setStatus(resultSet.getBoolean("acc.status"));
				account.setVerify(resultSet.getBoolean("acc.verify"));
				account.setAvatar(resultSet.getString("ad.avatar"));
				account.setCreated(resultSet.getDate("acc.created"));
				account.setAddress(resultSet.getString("ad.address"));
				accounts.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
			accounts = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return accounts;
	}
	// Hàm check vô hiệu hóa
	public List<AccountPartial> checkStatus(boolean status){
		List<AccountPartial> accounts = new ArrayList<AccountPartial>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select acc.id,acc.role,acc.username,ad.name,ad.birthday,acc.email, ad.phonenumber,acc.status,"
							+ "acc.verify, ad.avatar,acc.created,ad.address"
							+ " from account acc INNER JOIN accountdetails ad ON acc.id = ad.accountid"
							+ " where acc.status = ?");
			preparedStatement.setBoolean(1,status);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				AccountPartial account = new AccountPartial();
				account.setId(resultSet.getInt("acc.id"));
				account.setUsername(resultSet.getString("acc.username"));
				account.setRole(resultSet.getInt("acc.role"));
				account.setName(resultSet.getString("ad.name"));
				account.setBirthday(resultSet.getDate("ad.birthday"));
				account.setEmail(resultSet.getString("acc.email"));
				account.setPhoneNumber(resultSet.getString("ad.phonenumber"));
				account.setStatus(resultSet.getBoolean("acc.status"));
				account.setVerify(resultSet.getBoolean("acc.verify"));
				account.setAvatar(resultSet.getString("ad.avatar"));
				account.setCreated(resultSet.getDate("acc.created"));
				account.setAddress(resultSet.getString("ad.address"));
				accounts.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
			accounts = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return accounts;
	}
	
	public static void main(String[] args) {
		AccountPartialDAO accountPartialDAO = new AccountPartialDAO();
		System.out.println(accountPartialDAO.checkStatus(false));
	}
}
