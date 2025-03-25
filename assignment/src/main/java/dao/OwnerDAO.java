package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.ConnectDB;
import models.Owner;


public class OwnerDAO {
	public List<Owner> findAll() {
		List<Owner> result = new ArrayList<Owner>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("SELECT * FROM owner order by id DESC");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Owner owner = new Owner();
				owner.setId(resultSet.getInt("id"));
				owner.setName(resultSet.getString("name"));
				owner.setBirthday(new Date(resultSet.getDate("birthday").getTime()));
				owner.setPhone(resultSet.getString("phone"));
				owner.setAddress(resultSet.getString("address"));
				owner.setIdentifynumber(resultSet.getString("identifynumber"));
				owner.setCreated(new java.util.Date());
				owner.setAvatar(resultSet.getString("avatar"));
				result.add(owner);
			}
		} catch (SQLException e) {
			result = null;
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDB.disconnect();
		}
		
		return result;
	}
	public List<Owner> findByKeyword(String keyword) {
		List<Owner> result = new ArrayList<Owner>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("SELECT * FROM owner where name like ?");
			preparedStatement.setString(1, "%" + keyword + "%");
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Owner owner = new Owner();
				owner.setId(resultSet.getInt("id"));
				owner.setName(resultSet.getString("name"));
				owner.setBirthday(new Date(resultSet.getDate("birthday").getTime()));
				owner.setPhone(resultSet.getString("phone"));
				owner.setAddress(resultSet.getString("address"));
				owner.setIdentifynumber(resultSet.getString("identifynumber"));
				owner.setCreated(new java.util.Date());
				owner.setAvatar(resultSet.getString("avatar"));
				result.add(owner);
			}
		} catch (SQLException e) {
			result = null;
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDB.disconnect();
		}
		
		return result;
	}
	
	public Owner findById(int id) {
		Owner owner = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("SELECT * FROM owner where id = ?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				owner = new Owner();
				owner.setId(resultSet.getInt("id"));
				owner.setName(resultSet.getString("name"));
				owner.setBirthday(new Date(resultSet.getDate("birthday").getTime()));
				owner.setPhone(resultSet.getString("phone"));
				owner.setAddress(resultSet.getString("address"));
				owner.setIdentifynumber(resultSet.getString("identifynumber"));
				owner.setCreated(new java.util.Date());
				owner.setAvatar(resultSet.getString("avatar"));
			}
		} catch (SQLException e) {
			owner = null;
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDB.disconnect();
		}
		
		return owner;
	}
	public boolean newOwner(Owner owner) {
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("insert into owner(name, birthday, phone, address, identifynumber, created, avatar) "
							+ "values(?, ?, ?, ?, ?, ?, ?)");
			preparedStatement.setString(1, owner.getName());
			preparedStatement.setDate(2, new Date(owner.getBirthday().getTime()));
			preparedStatement.setString(3, owner.getPhone());
			preparedStatement.setString(4, owner.getAddress());
			preparedStatement.setString(5, owner.getIdentifynumber());
			preparedStatement.setDate(6, new Date(owner.getCreated().getTime()));
			preparedStatement.setString(7, owner.getAvatar());
			return preparedStatement.executeUpdate() > 0;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			ConnectDB.disconnect();
		}
	}
	
	public boolean delete(int id) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("DELETE FROM owner where id = ?");

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
		Owner owner = new Owner();
		owner.setAddress("aaaa");
		owner.setAvatar("aaa");
		owner.setBirthday(new java.util.Date());
		owner.setCreated(new java.util.Date());
		owner.setIdentifynumber("aaaa");
		owner.setPhone("aaaa");
		owner.setName("aaa");
		System.out.println(new OwnerDAO().newOwner(owner));
	}
}
