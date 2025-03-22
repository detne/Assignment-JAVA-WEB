package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DbConnection {
	// ThÃ´ng tin káº¿t ná»‘i MySQL
	public static String driverName = "com.mysql.cj.jdbc.Driver";
	public static String dbURL = "jdbc:mysql://localhost:3306/prj301_create_table_filling_data";
	public static String userDB = "root";
	public static String passDB = "";

	public static Connection getConnection() {
		Connection con = null;
		try {
			// Náº¡p driver
			Class.forName(driverName);
			// Káº¿t ná»‘i Ä‘áº¿n MySQL
			con = DriverManager.getConnection(dbURL, userDB, passDB);
			return con;
		} catch (Exception ex) {
			// Ghi log náº¿u cÃ³ lá»—i
			Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public static void main(String[] args) {
		// Kiá»ƒm tra káº¿t ná»‘i
		try (Connection con = getConnection()) {
			if (con != null) {
				System.out.println("Kết nối dữ liệu thành công");
			}
		} catch (SQLException ex) {
			Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
		}
	}
}
