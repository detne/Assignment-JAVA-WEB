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
import persistence.Document;
import utils.SqlUtils;

public class JDBCDocumentDAO implements DocumentDAO {

	private final Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public JDBCDocumentDAO() {
		conn = DbConnection.getConnection();
	}
	
	@Override
	public List<Document> getAllDocuments() {
		List<Document> documents = new ArrayList<>();
		try {
			String sql = "SELECT * FROM Document";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()) {
				Document document = new Document.Builder().setId(rs.getString("id_document"))
														  .setTitle(rs.getString("title_document"))
														  .setFileName(rs.getString("fileName"))
														  .setIdCourse(rs.getString("id_course"))
														  .setIdCategory(rs.getString("id_category"))
														  .setStatus(rs.getString("status"))
														  .setDatePublished(rs.getTimestamp("date_published").toLocalDateTime())
														  .setUsername(rs.getString("username"))
														  .setDescription(rs.getString("description"))
														  .setFileData(rs.getBytes("fileData"))
														  .build();
				documents.add(document);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs,pst);
		}
		return documents;
	}

	@Override
	public void saveDocument(Document document) {
		try {
			String sql = "INSERT INTO "
					   + "DOCUMENT(title_document,fileName,fileData,id_course,id_category,username,status,date_published,description) "
					   + "VALUES(?,?,?,?,?,?,?,?,?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, document.getTitle());
			pst.setString(2, document.getFileName());
			pst.setBytes (3, document.getFileData());
			pst.setString(4, document.getIdCourse());
			pst.setString(5, document.getIdCategory());
			pst.setString(6, document.getUsername());
			pst.setString(7, document.getStatus());
			pst.setTimestamp(8, Timestamp.valueOf(document.getDatePublished()));
			pst.setString(9, document.getDescription());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs,pst);
		}
	}

	@Override
	public Optional<Document> getDocumentById(String id) {
		try {
			String sql = "SELECT * FROM Document "
					+"WHERE id_document = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				return Optional.ofNullable(new Document.Builder()
													   .setId(rs.getString("id_document"))
													   .setTitle(rs.getString("title_document"))
													   .setFileName(rs.getString("fileName"))
													   .setIdCourse(rs.getString("id_course"))
													   .setIdCategory(rs.getString("id_category"))
													   .setStatus(rs.getString("status"))
													   .setDatePublished(rs.getTimestamp("date_published").toLocalDateTime())
													   .setUsername(rs.getString("username"))
													   .setDescription(rs.getString("description"))
													   .setFileData(rs.getBytes("fileData"))
													   .build());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs,pst);
		}
		return Optional.empty();
	}

	@Override
	public void deleteDocumentById(String id) {
		try {
			String sql = "DELETE FROM Document "  
					   + "WHERE id_document = ? ";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs,pst);
		}
	}

	@Override
	public void updateStatus(String id, String status) {
		try {
			String sql = "UPDATE Document " + 
					"SET status = ?  " + 
					"WHERE id_document = ? ";
			pst = conn.prepareStatement(sql);
			pst.setString(1, status);
			pst.setString(2, id);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs,pst);
		}
	}

	@Override
	public List<Document> searchDocumentByTxt(String txt) {
		List<Document> documents =  new ArrayList<>();
		String sql = "SELECT * FROM Document " + 
					 "WHERE title_document LIKE ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%" + txt + "%");
			rs = pst.executeQuery();
			while(rs.next()) { 
				documents.add(new Document.Builder()
									     .setId(rs.getString("id_document"))
									     .setTitle(rs.getString("title_document"))
									     .setFileName(rs.getString("fileName"))
									     .setIdCourse(rs.getString("id_course"))
									     .setIdCategory(rs.getString("id_category"))
									     .setStatus(rs.getString("status"))
									     .setDatePublished(rs.getTimestamp("date_published").toLocalDateTime())
									     .setUsername(rs.getString("username"))
									     .setDescription(rs.getString("description"))
									     .setFileData(rs.getBytes("fileData"))
									     .build());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			SqlUtils.close(rs,pst);
		}
		return documents;
	}
}
