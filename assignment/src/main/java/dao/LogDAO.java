package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import models.ConnectDB;
import models.Log;

public class LogDAO {
	public boolean create(Log log) {
		
		
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("insert into log(ip,level,description,national,time,beforevalue,aftervalue) values(?, ?, ?, ?, ?, ?, ?)");
			preparedStatement.setString(1, log.getIp());
			preparedStatement.setString(2, log.getLevel());
			preparedStatement.setString(3, log.getDescription());
			preparedStatement.setString(4, log.getNational());
			
			preparedStatement.setTimestamp(5, new Timestamp(log.getTime().getTime()));
			preparedStatement.setString(6, log.getBeforeValue());
			preparedStatement.setString(7, log.getAfterValue());
	
	
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
	public List<Log> findAll(){
		List<Log> logs = new ArrayList<Log>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from log");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Log log = new Log();
				log.setId(resultSet.getInt("id"));
				log.setIp(resultSet.getString("ip"));
				log.setLevel(resultSet.getString("level"));
				log.setNational(resultSet.getString("national"));
				log.setDescription(resultSet.getString("description"));
				log.setTime(resultSet.getTimestamp("time"));
				log.setBeforeValue(resultSet.getString("beforeValue"));
				log.setAfterValue(resultSet.getString("afterValue"));
				logs.add(log);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logs = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return logs;
	}
	
	public List<Log> findByLevel(String level){
		List<Log> logs = new ArrayList<Log>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from log where level = ?");
			preparedStatement.setString(1, level);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Log log = new Log();
				log.setId(resultSet.getInt("id"));
				log.setIp(resultSet.getString("ip"));
				log.setLevel(resultSet.getString("level"));
				log.setNational(resultSet.getString("national"));
				log.setDescription(resultSet.getString("description"));
				log.setTime(resultSet.getTimestamp("time"));
				log.setBeforeValue(resultSet.getString("beforeValue"));
				log.setAfterValue(resultSet.getString("afterValue"));
				logs.add(log);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logs = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return logs;
	}
	
	public List<Log> findTop20Log(){
		List<Log> logs = new ArrayList<Log>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from log order by id desc limit 20");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Log log = new Log();
				log.setId(resultSet.getInt("id"));
				log.setIp(resultSet.getString("ip"));
				log.setLevel(resultSet.getString("level"));
				log.setNational(resultSet.getString("national"));
				log.setDescription(resultSet.getString("description"));
				log.setTime(resultSet.getTimestamp("time"));
				log.setBeforeValue(resultSet.getString("beforeValue"));
				log.setAfterValue(resultSet.getString("afterValue"));
				logs.add(log);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logs = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return logs;
	}

	public boolean update(Log log) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(
					"UPDATE log set ip = ?,level = ?, description = ?, nation = ?, time = ?, beforeValue = ?, afterValue = ? where id = ?");
			preparedStatement.setString(1, log.getIp());
			preparedStatement.setString(2, log.getLevel());
			preparedStatement.setString(3, log.getNational());
			preparedStatement.setString(4, log.getDescription());
			preparedStatement.setTimestamp(4, new Timestamp(log.getTime().getTime()));
			preparedStatement.setString(5, log.getBeforeValue());
			preparedStatement.setString(6, log.getAfterValue());
			preparedStatement.setInt(7, log.getId());

			status = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return status;
	}

	public boolean updateTime(Log log) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement(
					"UPDATE log set time = ? where ip = ? AND level LIKE 'info'");

			preparedStatement.setTimestamp(1, new Timestamp(log.getTime().getTime()));
			preparedStatement.setString(2, log.getIp());


			status = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return status;
	}

	public static void main(String[] args) {
		System.out.println(new LogDAO().findAll());
	}
}	
