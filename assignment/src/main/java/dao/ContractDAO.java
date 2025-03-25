package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;


import models.ConnectDB;
import models.Contract;

public class ContractDAO {
	public List<Contract> findAll() {
		List<Contract> result = new ArrayList<Contract>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("SELECT * FROM contract");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Contract contract = new Contract();
				contract.setId(resultSet.getInt("id"));
				contract.setOwnerid(resultSet.getInt("ownerid"));
				contract.setSystemapartmentid(resultSet.getInt("systemapartmentid"));
				contract.setStatus(resultSet.getBoolean("status"));
				contract.setCreated(new Date(resultSet.getDate("created").getTime()));
				contract.setDescription(resultSet.getString("description"));
				result.add(contract);
			}
		} catch (SQLException e) {
			result = null;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public Contract findContractByID(int id){
		Contract contract = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from contract where id = ?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				contract = new Contract();
				contract.setId(resultSet.getInt("id"));
				contract.setOwnerid(resultSet.getInt("ownerid"));
				contract.setCreated(resultSet.getDate("created"));
				contract.setStatus(resultSet.getBoolean("status"));
				contract.setSystemapartmentid(resultSet.getInt("systemapartmentid"));
				contract.setDescription(resultSet.getString("description"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			contract = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return contract;
	}
	public boolean create(Contract contract) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("insert into contract(ownerid,systemapartmentid,status,created,description) values(?, ?, ?, ?, ?)");
			preparedStatement.setInt(1, contract.getOwnerid());
			preparedStatement.setInt(2, contract.getSystemapartmentid());
			preparedStatement.setBoolean(3, contract.isStatus());
			preparedStatement.setDate(4, new Date(contract.getCreated().getTime()));
			preparedStatement.setString(5, contract.getDescription());
			
			
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
	public boolean checkExists(List<Contract> contracts, int branchID, int floorID, int roomID) {
		SystemApartmentDAO systemApartmentDAO = new SystemApartmentDAO();
		for (Contract contract : contracts) {
			if(systemApartmentDAO.findSystemApartmentByID(contract.getSystemapartmentid()).getBranchid() == branchID
					&& systemApartmentDAO.findSystemApartmentByID(contract.getSystemapartmentid()).getFloorid() == floorID
					  && systemApartmentDAO.findSystemApartmentByID(contract.getSystemapartmentid()).getRoomid() == roomID) {
				return false;
			}
		}
		return true;
	}
	
	
	public static void main(String[] args) {
		ContractDAO contractDAO = new ContractDAO();
		System.out.println(contractDAO.checkExists(contractDAO.findAll(), 4, 2, 2));
	}
}
