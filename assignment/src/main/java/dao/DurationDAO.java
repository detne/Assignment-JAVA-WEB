package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import models.ConnectDB;
import models.Duration;

public class DurationDAO {
	public List<Duration> findAll(){
		List<Duration> durations = new ArrayList<Duration>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from duration");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Duration duration = new Duration();
				duration.setId(resultSet.getInt("id"));
				duration.setStatus(resultSet.getBoolean("status"));
				duration.setName(resultSet.getString("name"));
				
				durations.add(duration);
			}
		} catch (Exception e) {
			e.printStackTrace();
			durations = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return durations;
	}
	
	public Duration findById(int id){
		Duration duration = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from duration where id = ?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				duration = new Duration();
				duration.setId(resultSet.getInt("id"));
				duration.setStatus(resultSet.getBoolean("status"));
				duration.setName(resultSet.getString("name"));
				

			}
		} catch (Exception e) {
			e.printStackTrace();
			duration = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return duration;
	}
	
	public boolean create(Duration duration) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("insert into duration(status, name) values(?, ?)");
			preparedStatement.setBoolean(1, duration.isStatus());
			preparedStatement.setString(2, duration.getName());
			
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
	
	public boolean update(Duration duration) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("update duration set status = ?, name = ? where id = ?");
			preparedStatement.setBoolean(1, duration.isStatus());
			preparedStatement.setString(2, duration.getName());
			preparedStatement.setInt(3, duration.getId());
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
	
	public List<Duration> checkStatus(boolean status){
		List<Duration> durations = new ArrayList<Duration>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select id,name,status from duration where status = ?");
			preparedStatement.setBoolean(1,status);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Duration duration = new Duration();
				duration.setId(resultSet.getInt("id"));
				duration.setName(resultSet.getString("name"));
				duration.setStatus(resultSet.getBoolean("status"));
				durations.add(duration);
			}
		} catch (Exception e) {
			e.printStackTrace();
			durations = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return durations;
	}
	
	public boolean delete(int id) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("DELETE FROM duration where id = ?");
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
		System.out.println(new DurationDAO().findById(12).getName());

    }
}
