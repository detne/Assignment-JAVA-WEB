package dao;


import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;

import models.ConnectDB;
import models.Post;

public class PostDAO {
	public List<Post> findTopSix() {
		List<Post> posts = new ArrayList<Post>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from post WHERE status = 1 order by id desc limit 6");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Post post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setAccountid(resultSet.getInt("accountid"));
				post.setSubject(resultSet.getString("subject"));
				post.setDescription(resultSet.getString("description"));
				post.setPostdate(resultSet.getDate("postdate"));
				post.setBedroom(resultSet.getInt("bedroom"));
				post.setBathroom(resultSet.getInt("bathroom"));
				post.setPrice(resultSet.getDouble("price"));
				post.setDeposit(resultSet.getDouble("deposit"));
				post.setArea(resultSet.getDouble("area"));
				post.setAddress(resultSet.getString("address"));
				post.setAvatar(resultSet.getString("avatar"));
				post.setStatus(resultSet.getBoolean("status"));
				posts.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
			posts = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return posts;
	}
	
	public int getNumberPostByAccount(int accountid) {
		int result = 0;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("SELECT COUNT(*) AS post_count FROM post where accountid = ? and status = 1 group by accountid");
			preparedStatement.setInt(1, accountid);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				result = resultSet.getInt("post_count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public List<Post> findTopSixAdmin() {
		List<Post> posts = new ArrayList<Post>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from post order by id desc limit 6");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Post post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setAccountid(resultSet.getInt("accountid"));
				post.setSubject(resultSet.getString("subject"));
				post.setDescription(resultSet.getString("description"));
				post.setPostdate(resultSet.getDate("postdate"));
				post.setBedroom(resultSet.getInt("bedroom"));
				post.setBathroom(resultSet.getInt("bathroom"));
				post.setPrice(resultSet.getDouble("price"));
				post.setDeposit(resultSet.getDouble("deposit"));
				post.setArea(resultSet.getDouble("area"));
				post.setAddress(resultSet.getString("address"));
				post.setAvatar(resultSet.getString("avatar"));
				post.setStatus(resultSet.getBoolean("status"));
				posts.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
			posts = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return posts;
	}

	public List<Post> findAll() {
		List<Post> posts = new ArrayList<Post>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from post WHERE status = 1 order by id desc");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Post post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setAccountid(resultSet.getInt("accountid"));
				post.setSubject(resultSet.getString("subject"));
				post.setDescription(resultSet.getString("description"));
				post.setPostdate(resultSet.getDate("postdate"));
				post.setBedroom(resultSet.getInt("bedroom"));
				post.setBathroom(resultSet.getInt("bathroom"));
				post.setPrice(resultSet.getDouble("price"));
				post.setDeposit(resultSet.getDouble("deposit"));
				post.setArea(resultSet.getDouble("area"));
				post.setAddress(resultSet.getString("address"));
				post.setAvatar(resultSet.getString("avatar"));
				post.setStatus(resultSet.getBoolean("status"));
				posts.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
			posts = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return posts;
	}
	
	public List<Integer> listAccountID() {
		List<Integer> listAccountID = new ArrayList<Integer>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select accountiD from post group by accountid");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				listAccountID.add(resultSet.getInt("accountid"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			listAccountID = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return listAccountID;
	}
	
	public List<Post> findAllInAdmin() {
		List<Post> posts = new ArrayList<Post>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from post order by id desc ");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Post post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setAccountid(resultSet.getInt("accountid"));
				post.setSubject(resultSet.getString("subject"));
				post.setDescription(resultSet.getString("description"));
				post.setPostdate(resultSet.getDate("postdate"));
				post.setBedroom(resultSet.getInt("bedroom"));
				post.setBathroom(resultSet.getInt("bathroom"));
				post.setPrice(resultSet.getDouble("price"));
				post.setDeposit(resultSet.getDouble("deposit"));
				post.setArea(resultSet.getDouble("area"));
				post.setAddress(resultSet.getString("address"));
				post.setAvatar(resultSet.getString("avatar"));
				post.setStatus(resultSet.getBoolean("status"));
				posts.add(post);
			}
		} catch (Exception e) {
			e.printStackTrace();
			posts = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return posts;
	}

	public Post findPostByID(int id) {
		Post post = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from post where id = ?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setAccountid(resultSet.getInt("accountid"));
				post.setSubject(resultSet.getString("subject"));
				post.setDescription(resultSet.getString("description"));
				post.setPostdate(resultSet.getDate("postdate"));
				post.setBedroom(resultSet.getInt("bedroom"));
				post.setBathroom(resultSet.getInt("bathroom"));
				post.setPrice(resultSet.getDouble("price"));
				post.setDeposit(resultSet.getDouble("deposit"));
				post.setArea(resultSet.getDouble("area"));
				post.setAddress(resultSet.getString("address"));
				post.setAvatar(resultSet.getString("avatar"));
				post.setStatus(resultSet.getBoolean("status"));

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
	
	
	
	public Post lastPost() {
		Post post = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from post order by id desc limit 1");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setAccountid(resultSet.getInt("accountid"));
				post.setSubject(resultSet.getString("subject"));
				post.setDescription(resultSet.getString("description"));
				post.setPostdate(resultSet.getDate("postdate"));
				post.setBedroom(resultSet.getInt("bedroom"));
				post.setBathroom(resultSet.getInt("bathroom"));
				post.setPrice(resultSet.getDouble("price"));
				post.setDeposit(resultSet.getDouble("deposit"));
				post.setArea(resultSet.getDouble("area"));
				post.setAddress(resultSet.getString("address"));
				post.setAvatar(resultSet.getString("avatar"));
				post.setStatus(resultSet.getBoolean("status"));

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

	public List<Post> findPostBySubject(String subject) {
		List<Post> posts = new ArrayList<Post>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from post where subject like ? AND status = 1");
			preparedStatement.setString(1, "%" + subject + "%");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Post post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setAccountid(resultSet.getInt("accountid"));
				post.setSubject(resultSet.getString("subject"));
				post.setDescription(resultSet.getString("description"));
				post.setPostdate(resultSet.getDate("postdate"));
				post.setBedroom(resultSet.getInt("bedroom"));
				post.setBathroom(resultSet.getInt("bathroom"));
				post.setPrice(resultSet.getDouble("price"));
				post.setDeposit(resultSet.getDouble("deposit"));
				post.setArea(resultSet.getDouble("area"));
				post.setAddress(resultSet.getString("address"));
				post.setAvatar(resultSet.getString("avatar"));
				post.setStatus(resultSet.getBoolean("status"));
				posts.add(post);

			}
		} catch (Exception e) {
			e.printStackTrace();
			posts = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return posts;
	}
	
	public List<Post> findPostByAccountID(int accountid) {
		List<Post> posts = new ArrayList<Post>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from post where accountid = ?  order by id DESC");
			preparedStatement.setInt(1, accountid);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Post post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setAccountid(resultSet.getInt("accountid"));
				post.setSubject(resultSet.getString("subject"));
				post.setDescription(resultSet.getString("description"));
				post.setPostdate(resultSet.getTimestamp("postdate"));
				post.setBedroom(resultSet.getInt("bedroom"));
				post.setBathroom(resultSet.getInt("bathroom"));
				post.setPrice(resultSet.getDouble("price"));
				post.setDeposit(resultSet.getDouble("deposit"));
				post.setArea(resultSet.getDouble("area"));
				post.setAddress(resultSet.getString("address"));
				post.setAvatar(resultSet.getString("avatar"));
				post.setStatus(resultSet.getBoolean("status"));
				posts.add(post);

			}
		} catch (Exception e) {
			e.printStackTrace();
			posts = null;
			// TODO: handle exception
		} finally {
			ConnectDB.disconnect();
		}

		return posts;
	}

	public List<Post> findPostByDistrict(String district) {
		List<Post> posts = new ArrayList<Post>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
				    .prepareStatement("SELECT * FROM post WHERE REPLACE(address, ',', '') LIKE ? AND status = 1");
				preparedStatement.setString(1, "%" + district + "%");
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Post post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setAccountid(resultSet.getInt("accountid"));
				post.setSubject(resultSet.getString("subject"));
				post.setPostdate(resultSet.getDate("postdate"));
				post.setBathroom(resultSet.getInt("bathroom"));
				post.setBedroom(resultSet.getInt("bedroom"));
				post.setPrice(resultSet.getDouble("price"));
				post.setDeposit(resultSet.getInt("deposit"));
				post.setArea(resultSet.getDouble("area"));
				post.setDescription(resultSet.getString("description"));
				post.setAddress(resultSet.getString("address"));
				post.setAvatar(resultSet.getString("avatar"));
				post.setStatus(resultSet.getBoolean("status"));

				posts.add(post);

			}
		} catch (Exception e) {
			// TODO: handle exception
			posts = null;
		} finally {
			ConnectDB.disconnect();
		}

		return posts;
	}

	public List<Post> findPostByPrice(double price) {
		List<Post> posts = new ArrayList<Post>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("Select * from post where price <= ? AND status = 1");
			preparedStatement.setDouble(1, price);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Post post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setAccountid(resultSet.getInt("accountid"));
				post.setSubject(resultSet.getString("subject"));
				post.setPostdate(resultSet.getDate("postdate"));
				post.setBathroom(resultSet.getInt("bathroom"));
				post.setBedroom(resultSet.getInt("bedroom"));
				post.setPrice(resultSet.getDouble("price"));
				post.setDeposit(resultSet.getInt("deposit"));
				post.setArea(resultSet.getDouble("area"));
				post.setDescription(resultSet.getString("description"));
				post.setAddress(resultSet.getString("address"));
				post.setAvatar(resultSet.getString("avatar"));
				post.setStatus(resultSet.getBoolean("status"));

				posts.add(post);

			}
		} catch (Exception e) {
			// TODO: handle exception
			posts = null;
		} finally {
			ConnectDB.disconnect();
		}
		return posts;
	}

	public List<Post> findPostByPriceOver5(double price) {
		List<Post> posts = new ArrayList<Post>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("Select * from post where price >= ? AND status = 1");
			preparedStatement.setDouble(1, price);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Post post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setAccountid(resultSet.getInt("accountid"));
				post.setSubject(resultSet.getString("subject"));
				post.setPostdate(resultSet.getDate("postdate"));
				post.setBathroom(resultSet.getInt("bathroom"));
				post.setBedroom(resultSet.getInt("bedroom"));
				post.setPrice(resultSet.getDouble("price"));
				post.setDeposit(resultSet.getInt("deposit"));
				post.setArea(resultSet.getDouble("area"));
				post.setDescription(resultSet.getString("description"));
				post.setAddress(resultSet.getString("address"));
				post.setAvatar(resultSet.getString("avatar"));
				post.setStatus(resultSet.getBoolean("status"));

				posts.add(post);

			}
		} catch (Exception e) {
			// TODO: handle exception
			posts = null;
		} finally {
			ConnectDB.disconnect();
		}

		return posts;
	}
	
	public List<Post> findPostByBedroom(int bedroom) {
		List<Post> posts = new ArrayList<Post>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("Select * from post where bedroom = ? AND status = 1");
			preparedStatement.setInt(1, bedroom);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Post post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setAccountid(resultSet.getInt("accountid"));
				post.setSubject(resultSet.getString("subject"));
				post.setPostdate(resultSet.getDate("postdate"));
				post.setBathroom(resultSet.getInt("bathroom"));
				post.setBedroom(resultSet.getInt("bedroom"));
				post.setPrice(resultSet.getDouble("price"));
				post.setDeposit(resultSet.getInt("deposit"));
				post.setArea(resultSet.getDouble("area"));
				post.setDescription(resultSet.getString("description"));
				post.setAddress(resultSet.getString("address"));
				post.setAvatar(resultSet.getString("avatar"));
				post.setStatus(resultSet.getBoolean("status"));

				posts.add(post);

			}
		} catch (Exception e) {
			// TODO: handle exception
			posts = null;
		} finally {
			ConnectDB.disconnect();
		}

		return posts;
	}
	
	public List<Post> findPostByArea(double area) {
		List<Post> posts = new ArrayList<Post>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("Select * from post where status = 1 AND area BETWEEN ? - 5 AND ? + 5");
			preparedStatement.setDouble(1, area);
			preparedStatement.setDouble(2, area);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Post post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setAccountid(resultSet.getInt("accountid"));
				post.setSubject(resultSet.getString("subject"));
				post.setPostdate(resultSet.getDate("postdate"));
				post.setBathroom(resultSet.getInt("bathroom"));
				post.setBedroom(resultSet.getInt("bedroom"));
				post.setPrice(resultSet.getDouble("price"));
				post.setDeposit(resultSet.getInt("deposit"));
				post.setArea(resultSet.getDouble("area"));
				post.setDescription(resultSet.getString("description"));
				post.setAddress(resultSet.getString("address"));
				post.setAvatar(resultSet.getString("avatar"));
				post.setStatus(resultSet.getBoolean("status"));

				posts.add(post);

			}
		} catch (Exception e) {
			// TODO: handle exception
			posts = null;
		} finally {
			ConnectDB.disconnect();
		}

		return posts;
	}

	public boolean exists(int postID, List<Post> posts) {
		boolean status = false;
		for (int i = 0; i < posts.size(); i++) {
			if (posts.get(i).getId() == postID) {
				status = true;
			}
		}
		return status;
	}
	
	public boolean create(Post post) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("insert into post(accountid,subject,postdate,bedroom,bathroom,price,deposit,area,description,address,avatar,status) values(?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?)");
			preparedStatement.setInt(1, post.getAccountid());
			preparedStatement.setString(2, post.getSubject());
			preparedStatement.setDate(3, new Date(post.getPostdate().getTime()));
			preparedStatement.setInt(4, post.getBedroom());
			preparedStatement.setInt(5, post.getBathroom());
			preparedStatement.setDouble(6, post.getPrice());
			preparedStatement.setDouble(7, post.getDeposit());
			preparedStatement.setDouble(8, post.getArea());
			preparedStatement.setString(9, post.getDescription());
			preparedStatement.setString(10, post.getAddress());
			preparedStatement.setString(11, post.getAvatar());
			preparedStatement.setBoolean(12, post.isStatus());
			
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
	
	public boolean update(Post post) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("UPDATE post set status = ? where id = ?");
			preparedStatement.setBoolean(1, post.isStatus());
			preparedStatement.setInt(2, post.getId());
			
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
	
	public boolean delete(int id) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
			.prepareStatement("DELETE FROM post where id = ?");

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
	
	// Tìm bài post mới nhất của người dùng đó 
	public Post findNewPostByID(int id) {
		Post post = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select * from post where accountid = ? ORDER BY postdate DESC LIMIT 1");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				post = new Post();
				post.setId(resultSet.getInt("id"));
				post.setAccountid(resultSet.getInt("accountid"));
				post.setSubject(resultSet.getString("subject"));
				post.setDescription(resultSet.getString("description"));
				post.setPostdate(resultSet.getTimestamp("postdate"));
				post.setBedroom(resultSet.getInt("bedroom"));
				post.setBathroom(resultSet.getInt("bathroom"));
				post.setPrice(resultSet.getDouble("price"));
				post.setDeposit(resultSet.getDouble("deposit"));
				post.setArea(resultSet.getDouble("area"));
				post.setAddress(resultSet.getString("address"));
				post.setAvatar(resultSet.getString("avatar"));
				post.setStatus(resultSet.getBoolean("status"));

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
		PostDAO postDAO = new PostDAO();
//		System.out.println(postModel.update(postModel.findPostByID(159)));
//		System.out.println(postModel.findPostByID(159));
		Post post = postDAO.findPostByID(1);
		post.setStatus(false);
		System.out.println(postDAO.update(post));
	}
}
