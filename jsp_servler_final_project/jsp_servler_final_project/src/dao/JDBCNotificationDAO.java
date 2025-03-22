package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import connection.DbConnection;
import persistence.Notification;
import utils.SqlUtils;

public class JDBCNotificationDAO implements NotificationDAO {

	private final Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	public JDBCNotificationDAO() {
		conn = DbConnection.getConnection();
	}

	@Override
	public List<Notification> getAllNotifications() {
		List<Notification> notifications = new ArrayList<>();

		String sql = "SELECT * FROM Notification";

		try {

			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				Notification notification = new Notification(rs.getString("id_notification"), 
															 rs.getString("title"),
															 rs.getString("message"),  
															 rs.getTimestamp("timestamp").toLocalDateTime());
				notifications.add(notification);
			}
		} catch (Exception e) {
		} finally {
			SqlUtils.close(rs, pst);
		}
		return notifications;
	}

	@Override
	public Optional<Notification> getNotificationById(String id) {
		
		try {
			String sql = "SELECT * FROM Notification "
					   + "WHERE id_notification = ? ";
			
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			
			rs = pst.executeQuery();
			while(rs.next()) {
				return Optional.ofNullable(new Notification(rs.getString("id_notification"),
															rs.getString("title"),
															rs.getString("message"),
															rs.getTimestamp("timestamp").toLocalDateTime()));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		
		
		return Optional.empty();
	}

	@Override
	public void saveNotification(Notification notification) {
		String sql = "INSERT INTO Notification "
				   + "VALUES(?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, notification.getTitle());
			pst.setString(2, notification.getMessage());
			pst.setTimestamp(3, Timestamp.valueOf(notification.getTimestamp()));
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs,pst);
		}
	}

	@Override
	public Notification getLastestNotification() {
		String sql = "SELECT TOP 1 * FROM Notification "
				   + "ORDER BY timestamp DESC ";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()) {
				return new Notification(rs.getString("id_notification"),
									    rs.getString("title"),
									    rs.getString("message"),
									    rs.getTimestamp("timestamp").toLocalDateTime());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}


}
