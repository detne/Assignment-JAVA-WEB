package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import models.Chat;
import models.ConnectDB;



public class ChatDAO {
	public List<Chat> findAll(){
		List<Chat> chats = new ArrayList<Chat>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from chat");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Chat chat = new Chat();
				chat.setId(resultSet.getInt("id"));
				chat.setUserID(resultSet.getInt("userID"));
				chat.setAdminID(resultSet.getInt("adminID"));
				chat.setMessage(resultSet.getString("message"));
				chat.setRole(resultSet.getInt("role"));
				chat.setTime(resultSet.getTimestamp("time"));
				chats.add(chat);
			}
		} catch (Exception e) {
			e.printStackTrace();
			chats = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		return chats;
	}
	public List<Chat> findChat(int userID, int role){
		List<Chat> chats = new ArrayList<Chat>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from chat where userID = ? and role = ?");
			preparedStatement.setInt(1, userID);
			preparedStatement.setInt(2, role);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Chat chat = new Chat();
				chat.setId(resultSet.getInt("id"));
				chat.setUserID(resultSet.getInt("userID"));
				chat.setAdminID(resultSet.getInt("adminID"));
				chat.setMessage(resultSet.getString("message"));
				chat.setRole(resultSet.getInt("role"));
				chat.setTime(resultSet.getTimestamp("time"));
				chats.add(chat);
			}
		} catch (Exception e) {
			e.printStackTrace();
			chats = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		
		return chats;
	}
	public List<Chat> findChatByUserID(int userID){
		List<Chat> chats = new ArrayList<Chat>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from chat where userID = ?");
			preparedStatement.setInt(1, userID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Chat chat = new Chat();
				chat.setId(resultSet.getInt("id"));
				chat.setUserID(resultSet.getInt("userID"));
				chat.setAdminID(resultSet.getInt("adminID"));
				chat.setMessage(resultSet.getString("message"));
				chat.setRole(resultSet.getInt("role"));
				chat.setTime(resultSet.getTimestamp("time"));
				chats.add(chat);
			}
		} catch (Exception e) {
			e.printStackTrace();
			chats = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		
		return chats;
	}
	public List<Chat> findChatByUserID(int userID, int n){
		List<Chat> chats = new ArrayList<Chat>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("SELECT * FROM (\n"
					+ "    SELECT * FROM chat\n"
					+ "    WHERE userID = ?\n"
					+ "    ORDER BY id DESC\n"
					+ "    LIMIT 7 OFFSET ?\n"
					+ ") AS subquery\n"
					+ "ORDER BY id ASC;");
			preparedStatement.setInt(1, userID);
			preparedStatement.setInt(2, n);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Chat chat = new Chat();
				chat.setId(resultSet.getInt("id"));
				chat.setUserID(resultSet.getInt("userID"));
				chat.setAdminID(resultSet.getInt("adminID"));
				chat.setMessage(resultSet.getString("message"));
				chat.setRole(resultSet.getInt("role"));
				chat.setTime(resultSet.getTimestamp("time"));
				chats.add(chat);
			}
		} catch (Exception e) {
			e.printStackTrace();
			chats = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		
		return chats;
	}
	public List<Chat> listUser(){
		List<Chat> chats = new ArrayList<Chat>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from chat group by userID");
		
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Chat chat = new Chat();
				chat.setId(resultSet.getInt("id"));
				chat.setUserID(resultSet.getInt("userID"));
				chat.setAdminID(resultSet.getInt("adminID"));
				chat.setMessage(resultSet.getString("message"));
				chat.setRole(resultSet.getInt("role"));
				chat.setTime(resultSet.getTimestamp("time"));
				chats.add(chat);
			}
		} catch (Exception e) {
			e.printStackTrace();
			chats = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}
		
		
		return chats;
	}
	
	public boolean newChat(Chat chat) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("insert into chat(userID,adminID,message,role,time) values(?, ?, ?, ?, ?)");
			preparedStatement.setInt(1, chat.getUserID());
			preparedStatement.setInt(2, chat.getAdminID());
			preparedStatement.setString(3, chat.getMessage());
			preparedStatement.setInt(4, chat.getRole());
			preparedStatement.setTimestamp(5, new Timestamp(chat.getTime().getTime()));;
			
			
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
		ChatDAO chatDAO = new ChatDAO();
		System.out.println(chatDAO.findChatByUserID(2, 7).size());
	}
}
