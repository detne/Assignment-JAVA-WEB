package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import models.ConnectDB;
import models.PostImage;

public class PostImageDAO {
	public List<PostImage> findPostImageByPostID(int postID){
		List<PostImage> images = new ArrayList<PostImage>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from postimage where postid = ?");
			preparedStatement.setInt(1, postID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				PostImage image = new PostImage();
				image.setId(resultSet.getInt("id"));
				image.setName(resultSet.getString("name"));
				image.setCreated(resultSet.getDate("created"));
				image.setPostid(resultSet.getInt("postid"));
				images.add(image);
			}
		} catch (Exception e) {
			e.printStackTrace();
			images = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return images;
	}
	
	public boolean create(PostImage postImage) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("insert into postImage(name,created,postid) values(?, ?, ?)");
			preparedStatement.setString(1, postImage.getName());
			preparedStatement.setDate(2, new Date(postImage.getCreated().getTime()));
			preparedStatement.setInt(3, postImage.getPostid());
		
			
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
	public boolean delete(int id) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("DELETE FROM postImage where postid = ?");

			preparedStatement.setInt(1, id);
			
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
		PostImageDAO imageModel = new PostImageDAO();
		System.out.println(imageModel.findPostImageByPostID(1));
	}
}	
