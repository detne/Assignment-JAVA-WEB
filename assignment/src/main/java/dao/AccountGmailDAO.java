package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.AccountGmail;
import models.ConnectDB;

public class AccountGmailDAO {
	public List<AccountGmail> findAll() {
		List<AccountGmail> result = new ArrayList();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("SELECT * FROM accountgmail");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				AccountGmail accountGmail = new AccountGmail();
				accountGmail.setId(resultSet.getInt("id"));
				accountGmail.setName(resultSet.getString("email"));
				
				result.add(accountGmail);
			}
		} catch (SQLException e) {
			result = null;
			// TODO Auto-generated catch block
			e.printStackTrace();
			ConnectDB.disconnect();
		}
		
		return result;
	}
	
	public boolean create(AccountGmail accountGmail) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("INSERT INTO accountgmail(email) VALUES (?)");
			preparedStatement.setString(1, accountGmail.getName());
			
			status = preparedStatement.executeUpdate() > 0;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			status = false;
			e.printStackTrace();
		}
		
		return status;
	}
	
	public boolean delete(int id) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("DELETE FROM accountgmail WHERE id = ?");
			preparedStatement.setInt(1, id);
			
			status = preparedStatement.executeUpdate() > 0;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			status = false;
			e.printStackTrace();
		}
		
		return status;
	}
	
	public AccountGmail findUserByGmail(String email) {
		AccountGmail accountGmail = new AccountGmail();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("SELECT * FROM accountgmail WHERE email = ?");
			preparedStatement.setString(1, email);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				accountGmail.setId(resultSet.getInt("id"));
				accountGmail.setName(resultSet.getString("email"));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			accountGmail = null;
			e.printStackTrace();
		}
		
		return accountGmail;
	}
	
	public static void main(String[] args) {
		AccountGmailDAO accountGmailDAO = new AccountGmailDAO();
		AccountGmail accountGmail = new AccountGmail();
		accountGmail.setName("test");
		System.out.println(accountGmailDAO.findUserByGmail("thanhhuy105004@gmail.com"));
	}
}
