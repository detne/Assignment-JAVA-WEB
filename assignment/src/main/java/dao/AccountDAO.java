package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import models.Account;
import models.ConnectDB;

public class AccountDAO {
	public List<Account> findAll(){
		List<Account> accounts = new ArrayList<Account>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from account");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Account account = new Account();
				account.setId(resultSet.getInt("id"));
				account.setUsername(resultSet.getString("username"));
				account.setPassword(resultSet.getString("password"));
				account.setEmail(resultSet.getString("email"));
				account.setCreated(resultSet.getDate("created"));
				account.setVerify(resultSet.getBoolean("verify"));
				account.setSecurityCode(resultSet.getString("securitycode"));
				account.setStatus(resultSet.getBoolean("status"));
				account.setRole(resultSet.getInt("role"));
				account.setGmailID(resultSet.getInt("gmailid"));
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
	public Account findAccountByUsername(String username) {
		Account account = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from account where username = ?");
			preparedStatement.setString(1, username);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				account = new Account();
				account.setId(resultSet.getInt("id"));
				account.setUsername(resultSet.getString("username"));
				account.setPassword(resultSet.getString("password"));
				account.setEmail(resultSet.getString("email"));
				account.setCreated(resultSet.getDate("created"));
				account.setVerify(resultSet.getBoolean("verify"));
				account.setSecurityCode(resultSet.getString("securitycode"));
				account.setStatus(resultSet.getBoolean("status"));
				account.setRole(resultSet.getInt("role"));
				account.setGmailID(resultSet.getInt("gmailid"));

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


	public Account findAccountByGmailID(Integer gmailId) {
		Account account = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from account where gmailid = ?");
			preparedStatement.setInt(1, gmailId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				account = new Account();
				account.setId(resultSet.getInt("id"));
				account.setUsername(resultSet.getString("username"));
				account.setPassword(resultSet.getString("password"));
				account.setEmail(resultSet.getString("email"));
				account.setCreated(resultSet.getDate("created"));
				account.setVerify(resultSet.getBoolean("verify"));
				account.setSecurityCode(resultSet.getString("securitycode"));
				account.setStatus(resultSet.getBoolean("status"));
				account.setRole(resultSet.getInt("role"));
				account.setGmailID(resultSet.getInt("gmailid"));

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

	public Account findAccountByEmail(String email) {
		Account account = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from account where email = ?");
			preparedStatement.setString(1, email);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				account = new Account();
				account.setId(resultSet.getInt("id"));
				account.setUsername(resultSet.getString("username"));
				account.setPassword(resultSet.getString("password"));
				account.setEmail(resultSet.getString("email"));
				account.setCreated(resultSet.getDate("created"));
				account.setVerify(resultSet.getBoolean("verify"));
				account.setSecurityCode(resultSet.getString("securitycode"));
				account.setStatus(resultSet.getBoolean("status"));
				account.setRole(resultSet.getInt("role"));
				account.setGmailID(resultSet.getInt("gmailid"));

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
	public Account findAccountByAccountID(int accID) {
		Account account = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from account where id = ?");
			preparedStatement.setInt(1, accID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				account = new Account();
				account.setId(resultSet.getInt("id"));
				account.setUsername(resultSet.getString("username"));
				account.setPassword(resultSet.getString("password"));
				account.setEmail(resultSet.getString("email"));
				account.setCreated(resultSet.getDate("created"));
				account.setVerify(resultSet.getBoolean("verify"));
				account.setSecurityCode(resultSet.getString("securitycode"));
				account.setStatus(resultSet.getBoolean("status"));
				account.setRole(resultSet.getInt("role"));
				account.setGmailID(resultSet.getInt("gmailid"));
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

	public boolean login(String username, String password) {
		Account account = findAccountByUsername(username);
		if(account != null) {
			if(account.isStatus() && account.isVerify()) {
				return BCrypt.checkpw(password, account.getPassword());
			}

		}
		return false;
	}
	public boolean register(Account account) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("insert into account(username,password,email,created,verify,securitycode,status,role,gmailid) values(?, ?, ?, ?, ?, ?, ?, ?, ?)");
			preparedStatement.setString(1, account.getUsername());
			preparedStatement.setString(2, account.getPassword());
			preparedStatement.setString(3, account.getEmail());
			preparedStatement.setDate(4, new Date(account.getCreated().getTime()));
			preparedStatement.setBoolean(5, account.isVerify());
			preparedStatement.setString(6, account.getSecurityCode());
			preparedStatement.setBoolean(7, account.isStatus());
			preparedStatement.setInt(8, account.getRole());
			if (account.getGmailID() == null) {
		            preparedStatement.setNull(9, java.sql.Types.INTEGER);
		        } else {
		            preparedStatement.setInt(9, account.getGmailID());
		        }

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
	public boolean update(Account account) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("update account set username = ?, password = ?, email = ?, created = ?, verify = ?, securitycode = ?, status = ?, role = ?  where id = ?");
			preparedStatement.setString(1, account.getUsername());
			preparedStatement.setString(2, account.getPassword());
			preparedStatement.setString(3, account.getEmail());
			preparedStatement.setDate(4, new Date(account.getCreated().getTime()));
			preparedStatement.setBoolean(5, account.isVerify());
			preparedStatement.setString(6, account.getSecurityCode());
			preparedStatement.setBoolean(7, account.isStatus());
			preparedStatement.setInt(8, account.getRole());
			preparedStatement.setInt(9, account.getId());
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
		AccountDAO accountDAO = new AccountDAO();
		Account account = new Account();
		account.setUsername("acc4");
		account.setPassword("Thanhhuy11@");
		account.setEmail("thanhhuy1233@gmail.com");
		account.setCreated(new java.util.Date());
		account.setRole(1);
		account.setSecurityCode("123455");
		account.setStatus(false);
		account.setVerify(true);
//		System.out.println(accountModel.register(account));
		System.out.println(accountDAO.findAccountByGmailID(1));
	}
}
