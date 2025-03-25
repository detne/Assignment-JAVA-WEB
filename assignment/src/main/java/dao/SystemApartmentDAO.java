	package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.ConnectDB;
import models.Systemapartment;

public class SystemApartmentDAO {
	public List<Systemapartment> findAll(){
		List<Systemapartment> systemapartments = new ArrayList<Systemapartment>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from systemapartment where status = 1");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Systemapartment systemapartment = new Systemapartment();
				systemapartment.setId(resultSet.getInt("id"));
				systemapartment.setSubject(resultSet.getString("subject"));
				systemapartment.setBranchid(resultSet.getInt("branchid"));
				systemapartment.setFloorid(resultSet.getInt("floorid"));
				systemapartment.setRoomid(resultSet.getInt("roomid"));
				systemapartment.setBedroom(resultSet.getInt("bedroom"));
				systemapartment.setBathroom(resultSet.getInt("bathroom"));
				systemapartment.setPrice(resultSet.getDouble("price"));
				systemapartment.setDeposit(resultSet.getDouble("deposit"));
				systemapartment.setArea(resultSet.getString("area"));
				systemapartment.setAvatar(resultSet.getString("avatar"));
				systemapartment.setStatus(resultSet.getBoolean("status"));
				systemapartment.setDescription(resultSet.getString("description"));
				systemapartments.add(systemapartment);
			}
		} catch (Exception e) {
			e.printStackTrace();
			systemapartments = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return systemapartments;
	}
	
	public List<Systemapartment> findAllInAdmin(){
		List<Systemapartment> systemapartments = new ArrayList<Systemapartment>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from systemapartment");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Systemapartment systemapartment = new Systemapartment();
				systemapartment.setId(resultSet.getInt("id"));
				systemapartment.setSubject(resultSet.getString("subject"));
				systemapartment.setBranchid(resultSet.getInt("branchid"));
				systemapartment.setFloorid(resultSet.getInt("floorid"));
				systemapartment.setRoomid(resultSet.getInt("roomid"));
				systemapartment.setBedroom(resultSet.getInt("bedroom"));
				systemapartment.setBathroom(resultSet.getInt("bathroom"));
				systemapartment.setPrice(resultSet.getDouble("price"));
				systemapartment.setDeposit(resultSet.getDouble("deposit"));
				systemapartment.setArea(resultSet.getString("area"));
				systemapartment.setAvatar(resultSet.getString("avatar"));
				systemapartment.setStatus(resultSet.getBoolean("status"));
				systemapartment.setDescription(resultSet.getString("description"));
				systemapartments.add(systemapartment);
			}
		} catch (Exception e) {
			e.printStackTrace();
			systemapartments = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return systemapartments;
	}
	public Systemapartment findSystemApartmentByID(int id){
		Systemapartment systemapartment = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from systemapartment where id = ?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				systemapartment = new Systemapartment();
				systemapartment.setId(resultSet.getInt("id"));
				systemapartment.setSubject(resultSet.getString("subject"));
				systemapartment.setBranchid(resultSet.getInt("branchid"));
				systemapartment.setFloorid(resultSet.getInt("floorid"));
				systemapartment.setRoomid(resultSet.getInt("roomid"));
				systemapartment.setBedroom(resultSet.getInt("bedroom"));
				systemapartment.setBathroom(resultSet.getInt("bathroom"));
				systemapartment.setPrice(resultSet.getDouble("price"));
				systemapartment.setDeposit(resultSet.getDouble("deposit"));
				systemapartment.setArea(resultSet.getString("area"));
				systemapartment.setAvatar(resultSet.getString("avatar"));
				systemapartment.setStatus(resultSet.getBoolean("status"));
				systemapartment.setDescription(resultSet.getString("description"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			systemapartment = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return systemapartment;
	}
	
	public Systemapartment findSystemApartmentByRoomAndBranch(int branchid, int floorid, int roomid){
		Systemapartment systemapartment = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from systemapartment where branchid = ? and floorid = ? and roomid = ?");
			preparedStatement.setInt(1, branchid);
			preparedStatement.setInt(2, floorid);
			preparedStatement.setInt(3, roomid);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				systemapartment = new Systemapartment();
				systemapartment.setId(resultSet.getInt("id"));
				systemapartment.setSubject(resultSet.getString("subject"));
				systemapartment.setBranchid(resultSet.getInt("branchid"));
				systemapartment.setFloorid(resultSet.getInt("floorid"));
				systemapartment.setRoomid(resultSet.getInt("roomid"));
				systemapartment.setBedroom(resultSet.getInt("bedroom"));
				systemapartment.setBathroom(resultSet.getInt("bathroom"));
				systemapartment.setPrice(resultSet.getDouble("price"));
				systemapartment.setDeposit(resultSet.getDouble("deposit"));
				systemapartment.setArea(resultSet.getString("area"));
				systemapartment.setAvatar(resultSet.getString("avatar"));
				systemapartment.setStatus(resultSet.getBoolean("status"));
				systemapartment.setDescription(resultSet.getString("description"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			systemapartment = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return systemapartment;
	}
	
	public List<Systemapartment> findSystemApartByDistrict(String subject) {
		List<Systemapartment> result = new ArrayList<Systemapartment>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from systemapartment where subject LIKE ?");
			preparedStatement.setString(1, "%" + subject + "%");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Systemapartment systemapartment = new Systemapartment();
				systemapartment.setId(resultSet.getInt("id"));
				systemapartment.setSubject(resultSet.getString("subject"));
				systemapartment.setBranchid(resultSet.getInt("branchid"));
				systemapartment.setFloorid(resultSet.getInt("floorid"));
				systemapartment.setRoomid(resultSet.getInt("roomid"));
				systemapartment.setBedroom(resultSet.getInt("bedroom"));
				systemapartment.setBathroom(resultSet.getInt("bathroom"));
				systemapartment.setPrice(resultSet.getDouble("price"));
				systemapartment.setDeposit(resultSet.getDouble("deposit"));
				systemapartment.setArea(resultSet.getString("area"));
				systemapartment.setDescription(resultSet.getString("description"));
				systemapartment.setAvatar(resultSet.getString("avatar"));
				systemapartment.setStatus(resultSet.getBoolean("status"));
				result.add(systemapartment);

			}
		} catch (Exception e) {
			e.printStackTrace();
			result = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return result;
	}
	
	public List<Systemapartment> findSystemApartByPrice(double price) {
		List<Systemapartment> result = new ArrayList<Systemapartment>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from systemapartment where price <= ?");
			preparedStatement.setDouble(1, price);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Systemapartment systemapartment = new Systemapartment();
				systemapartment.setId(resultSet.getInt("id"));
				systemapartment.setSubject(resultSet.getString("subject"));
				systemapartment.setBranchid(resultSet.getInt("branchid"));
				systemapartment.setFloorid(resultSet.getInt("floorid"));
				systemapartment.setRoomid(resultSet.getInt("roomid"));
				systemapartment.setBedroom(resultSet.getInt("bedroom"));
				systemapartment.setBathroom(resultSet.getInt("bathroom"));
				systemapartment.setPrice(resultSet.getDouble("price"));
				systemapartment.setDeposit(resultSet.getDouble("deposit"));
				systemapartment.setArea(resultSet.getString("area"));
				systemapartment.setDescription(resultSet.getString("description"));
				systemapartment.setAvatar(resultSet.getString("avatar"));
				systemapartment.setStatus(resultSet.getBoolean("status"));
				result.add(systemapartment);

			}
		} catch (Exception e) {
			e.printStackTrace();
			result = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return result;
	}
	
	public List<Systemapartment> findSystemApartByPriceOver5(double price) {
		List<Systemapartment> result = new ArrayList<Systemapartment>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from systemapartment where price >= ?");
			preparedStatement.setDouble(1, price);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Systemapartment systemapartment = new Systemapartment();
				systemapartment.setId(resultSet.getInt("id"));
				systemapartment.setSubject(resultSet.getString("subject"));
				systemapartment.setBranchid(resultSet.getInt("branchid"));
				systemapartment.setFloorid(resultSet.getInt("floorid"));
				systemapartment.setRoomid(resultSet.getInt("roomid"));
				systemapartment.setBedroom(resultSet.getInt("bedroom"));
				systemapartment.setBathroom(resultSet.getInt("bathroom"));
				systemapartment.setPrice(resultSet.getDouble("price"));
				systemapartment.setDeposit(resultSet.getDouble("deposit"));
				systemapartment.setArea(resultSet.getString("area"));
				systemapartment.setDescription(resultSet.getString("description"));
				systemapartment.setAvatar(resultSet.getString("avatar"));
				systemapartment.setStatus(resultSet.getBoolean("status"));
				result.add(systemapartment);

			}
		} catch (Exception e) {
			e.printStackTrace();
			result = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return result;
	}
	
	public List<Systemapartment> findSystemApartByBedroom(int bedroom) {
		List<Systemapartment> result = new ArrayList<Systemapartment>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from systemapartment where bedroom = ?");
			preparedStatement.setDouble(1, bedroom);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Systemapartment systemapartment = new Systemapartment();
				systemapartment.setId(resultSet.getInt("id"));
				systemapartment.setSubject(resultSet.getString("subject"));
				systemapartment.setBranchid(resultSet.getInt("branchid"));
				systemapartment.setFloorid(resultSet.getInt("floorid"));
				systemapartment.setRoomid(resultSet.getInt("roomid"));
				systemapartment.setBedroom(resultSet.getInt("bedroom"));
				systemapartment.setBathroom(resultSet.getInt("bathroom"));
				systemapartment.setPrice(resultSet.getDouble("price"));
				systemapartment.setDeposit(resultSet.getDouble("deposit"));
				systemapartment.setArea(resultSet.getString("area"));
				systemapartment.setDescription(resultSet.getString("description"));
				systemapartment.setAvatar(resultSet.getString("avatar"));
				systemapartment.setStatus(resultSet.getBoolean("status"));
				result.add(systemapartment);

			}
		} catch (Exception e) {
			e.printStackTrace();
			result = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return result;
	}
	
	public List<Systemapartment> findSystemApartByArea(double area) {
		List<Systemapartment> result = new ArrayList<Systemapartment>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("Select * from systemapartment where area BETWEEN ? - 5 AND ? + 5 ");
			preparedStatement.setDouble(1, area);
			preparedStatement.setDouble(2, area);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Systemapartment systemapartment = new Systemapartment();
				systemapartment.setId(resultSet.getInt("id"));
				systemapartment.setSubject(resultSet.getString("subject"));
				systemapartment.setBranchid(resultSet.getInt("branchid"));
				systemapartment.setFloorid(resultSet.getInt("floorid"));
				systemapartment.setRoomid(resultSet.getInt("roomid"));
				systemapartment.setBedroom(resultSet.getInt("bedroom"));
				systemapartment.setBathroom(resultSet.getInt("bathroom"));
				systemapartment.setPrice(resultSet.getDouble("price"));
				systemapartment.setDeposit(resultSet.getDouble("deposit"));
				systemapartment.setArea(resultSet.getString("area"));
				systemapartment.setDescription(resultSet.getString("description"));
				systemapartment.setAvatar(resultSet.getString("avatar"));
				systemapartment.setStatus(resultSet.getBoolean("status"));
				result.add(systemapartment);

			}
		} catch (Exception e) {
			e.printStackTrace();
			result = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return result;
	}
	
	public boolean delete(int id) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("DELETE FROM systemapartment where id = ?");
			preparedStatement.setInt(1, id);
			status =  preparedStatement.executeUpdate() > 0;
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}
	
	
	public static void main(String[] args) {
		SystemApartmentDAO apartmentModel = new SystemApartmentDAO();
		System.out.println(apartmentModel.findSystemApartmentByRoomAndBranch(1,2,3));
	}
}
