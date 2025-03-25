package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import models.ConnectDB;
import models.Language;

public class LanguageDAO {
	public Language findByLanguageID(String languageID) {
		Language language = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from language where languageid = ?");
			preparedStatement.setString(1, languageID);
		
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				language = new Language();
				language.setId(resultSet.getInt("id"));
			
	
			}
		} catch (Exception e) {
			e.printStackTrace();
			language = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return language;
	}
	public static void main(String[] args) {
		System.out.println(new LanguageDAO().findByLanguageID("vi"));
	}
}
