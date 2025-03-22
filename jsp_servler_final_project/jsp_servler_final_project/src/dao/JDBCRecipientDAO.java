package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.DbConnection;
import persistence.Recipient;
import utils.SqlUtils;

public class JDBCRecipientDAO implements RecipientDAO {

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public JDBCRecipientDAO() {
		conn = DbConnection.getConnection();
	}
	
	@Override
	public List<Recipient> getAllRecipients() {
		List<Recipient> recipients = new ArrayList<>();
		String sql = "SELECT * FROM Recipient";
		
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				Recipient recipient = new Recipient(rs.getString("id_recipient"), 
													rs.getString("id_notification"),
													rs.getString("username"),
													rs.getString("id_document"),
													rs.getBoolean("for_All_Users"));
				recipients.add(recipient);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs,pst);
		}
		return recipients;
	}

	@Override
	public void saveRecipient(Recipient recipient) {
		String sql = "INSERT INTO Recipient "
				   + "VALUES(?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, recipient.getId_notification());
			pst.setString(2, recipient.getId_document());
			pst.setBoolean(3,recipient.for_All_Users());
			pst.setString(4,recipient.getUsername());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs,pst);
		}
	}
	
	
	
}
