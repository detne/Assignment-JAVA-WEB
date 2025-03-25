package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import models.ConnectDB;
import models.Service;

public class ServiceDAO {
	public List<Service> findAll() {
		List<Service> services = new ArrayList<Service>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from service where status = true");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Service service = new Service();
				service.setId(resultSet.getInt("id"));
				service.setName(resultSet.getString("name"));
				service.setIntroduction(resultSet.getString("introduction"));
				service.setPrice(resultSet.getInt("price"));
				service.setDescription(resultSet.getString("description"));
				service.setPostNumber(resultSet.getInt("postNumber"));
				service.setStatus(resultSet.getBoolean("status"));
				service.setCreated(resultSet.getDate("created"));
				
				services.add(service);
			}
		} catch (Exception e) {
			e.printStackTrace();
			services = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return services;
	}
	
	public Service findByID(int id) {
		Service service = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from service where id = ?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				service = new Service();
				service.setId(resultSet.getInt("id"));
				service.setName(resultSet.getString("name"));
				service.setIntroduction(resultSet.getString("introduction"));
				service.setPrice(resultSet.getInt("price"));
				service.setDescription(resultSet.getString("description"));
				service.setPostNumber(resultSet.getInt("postNumber"));
				service.setStatus(resultSet.getBoolean("status"));
				service.setCreated(resultSet.getDate("created"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			service = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return service;
	}
	
	public boolean create(Service service) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("insert into service(name, introduction, price, description, postNumber, status, created) values(?, ?, ?, ?, ?, ?, ?)");
			preparedStatement.setString(1, service.getName());
			preparedStatement.setString(2, service.getIntroduction());
			preparedStatement.setInt(3, service.getPrice());
			preparedStatement.setString(4, service.getDescription());
			preparedStatement.setInt(5, service.getPostNumber());
			preparedStatement.setBoolean(6, service.isStatus());
			preparedStatement.setTimestamp(7, new Timestamp(service.getCreated().getTime()));
			
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
	
	public boolean update(Service service) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("update service set name = ?, introduction = ?, price = ?, description = ?, postNumber = ?, status = ?, created = ? where id = ?");
			preparedStatement.setString(1, service.getName());
			preparedStatement.setString(2, service.getIntroduction());
			preparedStatement.setInt(3, service.getPrice());
			preparedStatement.setString(4, service.getDescription());
			preparedStatement.setInt(5, service.getPostNumber());
			preparedStatement.setBoolean(6, service.isStatus());
			preparedStatement.setDate(7, new Date(service.getCreated().getTime()));
			preparedStatement.setInt(8, service.getId());
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
		ServiceDAO serivceModel = new ServiceDAO();
		System.out.println(serivceModel.findByID(1).getPostNumber());
	}
}
