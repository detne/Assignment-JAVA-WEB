package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import connection.DbConnection;
import persistence.Course;
import utils.SqlUtils;

public class JDBCCourseDAO implements CourseDAO {

	private final Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	public JDBCCourseDAO() {
		conn = DbConnection.getConnection();
	}

	@Override
	public List<Course> getAllCourses() {
		List<Course> courses = new ArrayList<>();
		String sql = "SELECT * FROM Course";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Course course = new Course(rs.getString("id_course"), 
										   rs.getString("title_course"),
										   rs.getString("id_major"));
				courses.add(course);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return courses;
	}

	@Override
	public Optional<Course> getCourseById(String id) {
		String sql = "SELECT * FROM Course " + 
					 "WHERE id_course = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				return Optional.ofNullable(new Course(rs.getString("id_course"), 
													  rs.getString("title_course"),
													  rs.getString("id_major")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs,pst);
		}
		return Optional.empty();
	}

}
