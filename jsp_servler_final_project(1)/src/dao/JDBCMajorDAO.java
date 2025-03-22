package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import connection.DbConnection;
import persistence.Major;
import utils.SqlUtils;

public class JDBCMajorDAO implements MajorDAO {

	private final Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	public JDBCMajorDAO() {
		conn = DbConnection.getConnection();
	}

	@Override
	public List<Major> getAllMajors() {
		List<Major> majors = new ArrayList<>();
		String sql = "SELECT * FROM Major";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Major major = new Major(rs.getString("id_major"), rs.getString("title_major"));
				majors.add(major);
			}
		} catch (SQLException e) {
		} finally {
			SqlUtils.close(rs, pst);
		}
		return majors;
	}

	@Override
	public Optional<Major> getMajorById(String id) {
		try {
			String sql = "SELECT * FROM Major "
					   + "WHERE id_major = ? ";
			
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				return Optional.ofNullable(new Major(rs.getString("id_major"),
													 rs.getString("title_major")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return Optional.empty();
	}
}
