package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import models.ConnectDB;
import models.ServiceLanguage;

public class ServiceLanguageDAO {

	public ServiceLanguage find(int serviceID, int languageID) {
		ServiceLanguage post = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from service_language where serviceID = ? and languageID = ?");
			preparedStatement.setInt(1, serviceID);
			preparedStatement.setInt(2, languageID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				post = new ServiceLanguage();
				post.setId(resultSet.getInt("id"));
				post.setLanguageID(resultSet.getInt("languageID"));
				post.setPostID(resultSet.getInt("serviceID"));
				post.setIntroduction(resultSet.getString("introduction"));
				post.setDescription(resultSet.getString("description"));
			
				post.setName(resultSet.getString("name"));
	
			}
		} catch (Exception e) {
			e.printStackTrace();
			post = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return post;
	}
	
	public static void main(String[] args) {
		System.out.println(new ServiceLanguageDAO().find(1, 2));
	}
	
	
}
