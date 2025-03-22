package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import connection.DbConnection;
import persistence.Category;
import utils.SqlUtils;

public class JDBCCategoryDAO implements CategoryDAO {

	Connection conn;
	PreparedStatement pst;
	ResultSet rs;

	public JDBCCategoryDAO() {
		conn = DbConnection.getConnection();
	}

	@Override
	public List<Category> getAllCategories() {
		List<Category> categories = new ArrayList<>();
		String sql = "SELECT * FROM Category";

		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Category category = new Category(rs.getString("id_category"), rs.getString("title_category"));
				categories.add(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return categories;
	}

	@Override
	public Optional<Category> getCategoryById(String id) {
		String sql = "SELECT * FROM Category WHERE id_category = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				return Optional.ofNullable(new Category(rs.getString("id_category"),
														rs.getString("title_category")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs, pst);
		}
		return Optional.empty();
	}
}
