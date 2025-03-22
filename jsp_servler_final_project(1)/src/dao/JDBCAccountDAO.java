package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import connection.DbConnection;
import persistence.Account;
import utils.SqlUtils;

public class JDBCAccountDAO implements AccountDAO {

	private final Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	
	public JDBCAccountDAO() {
		conn = DbConnection.getConnection();
	}
	
	@Override
	public List<Account> getAllAccounts() {
		List<Account> accounts = new ArrayList<>();
		String sql = "SELECT * FROM Account";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Account account = new Account(rs.getString("username"), 
											  rs.getString("password"), 
											  rs.getString("email"),
											  rs.getTimestamp("date_created"),
											  rs.getString("role"));
				accounts.add(account);
			}
		} catch (SQLException e) {
		} finally {
			SqlUtils.close(rs,pst);
		}
		return accounts;
	}

	@Override
	public void saveAccount(Account account) {
		String sql = ""
				+ "INSERT INTO Account "
				+ "VALUES (?,?,?,?,?)";
		try {
			System.out.println(account);
			pst = conn.prepareStatement(sql);
			pst.setString(1, account.getUsername());
			pst.setString(2, account.getEmail());
			pst.setString(3, account.getPassword());
			pst.setTimestamp(4, account.getDate_created());
			pst.setString(5, account.getRole());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs,pst);
		}
	}

	@Override
	public void updatePassword(String email, String newPassword) {
		String sql = ""
				+ "UPDATE Account "
				+ "SET password = ? "
				+ "WHERE email = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, newPassword);
			pst.setString(2, email);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs,pst);
		}
	}

	@Override
	public Optional<Account> getAccountByUsername(String username) {

		String sql = "SELECT * FROM Account "
				   + "WHERE username = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			while(rs.next()) {
				return Optional.ofNullable(new Account(rs.getString("username"),
													   rs.getString("password"),
													   rs.getString("email"),
													   rs.getTimestamp("date_created"),
													   rs.getString("role")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return Optional.empty();
	}

	@Override
	public void updateRole(String username, String role) {
		System.out.println("updateRole --> " + username + " " + role);
		String sql = "UPDATE Account " + 
					 "SET role = ? " + 
					 "WHERE username = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, role);
			pst.setString(2, username);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs,pst);
		}
	}

	@Override
	public void deleteAccountByUsername(String username) {
		String sql = "DELETE FROM Account "
				   + "WHERE username = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs,pst);
		}
	}
}
