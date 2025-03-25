package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.ConnectDB;
import models.Systemapartmentimage;

public class SystemApartmentImageDAO {
	public List<Systemapartmentimage> findSystemapartmentImageBySystemApartmentID(int systemapartmentid){
		List<Systemapartmentimage> images = new ArrayList<Systemapartmentimage>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from systemapartmentimage where systemapartmentid = ?");
			preparedStatement.setInt(1, systemapartmentid);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Systemapartmentimage image = new Systemapartmentimage();
				image.setId(resultSet.getInt("id"));
				image.setName(resultSet.getString("name"));
				image.setCreated(resultSet.getDate("created"));
				image.setSystemapartmentid(resultSet.getInt("systemapartmentid"));
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
	
	public boolean delete(int id) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("DELETE FROM systemapartmentimage where systemapartmentid = ?");
			preparedStatement.setInt(1, id);
			status =  preparedStatement.executeUpdate() > 0;
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}
	public static void main(String[] args) {
		SystemApartmentImageDAO imageModel = new SystemApartmentImageDAO();
		System.out.println(imageModel.findSystemapartmentImageBySystemApartmentID(177));
	}
}	
