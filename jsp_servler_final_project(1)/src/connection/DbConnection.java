package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DbConnection {
	// Thông tin kết nối MySQL
	public static String driverName = "com.mysql.cj.jdbc.Driver";
	public static String dbURL = "jdbc:mysql://localhost:3306/prj301_create_table_filling_data";
	public static String userDB = "root";
	public static String passDB = "";

	public static Connection getConnection() {
		Connection con = null;
		try {
			// Nạp driver
			Class.forName(driverName);
			// Kết nối đến MySQL
			con = DriverManager.getConnection(dbURL, userDB, passDB);
			return con;
		} catch (Exception ex) {
			// Ghi log nếu có lỗi
			Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public static void main(String[] args) {
		// Kiểm tra kết nối
		try (Connection con = getConnection()) {
			if (con != null) {
				System.out.println("Kết nối đến cơ sở dữ liệu MySQL thành công!");
			}
		} catch (SQLException ex) {
			Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
}
