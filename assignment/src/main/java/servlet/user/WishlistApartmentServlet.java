package servlet.user;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Account;
import models.Log;
import models.Post;
import utils.IPConfigUtil;
import dao.LogDAO;
import service.IPAddressUtil;
import dao.PostDAO;
@WebServlet("/wishlist")
/**
 * Servlet implementation class HomeServlet
 */
public class WishlistApartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishlistApartmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action == null) {
			doGet_Index(request, response);
		} else if(action.equalsIgnoreCase("wishlist")) {
			doGet_Wishlist(request, response);
		} else if(action.equalsIgnoreCase("remove")) {
			doGet_Remove(request, response);
		}
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("p", "../user/wishlist.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}
	protected void doGet_Remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		List<Post> posts = (List<Post>) request.getSession().getAttribute("posts");
		Account account = (Account) request.getSession().getAttribute("account");
		LogDAO logDAO = new LogDAO();
		posts.remove(id);
		logDAO.create(new Log(IPAddressUtil.getPublicIPAddress(),"alert","AccountID: " + account.getId() + " - đã xóa bài đăng có id là " + id + " ra khỏi whislist", IPConfigUtil.ipconfig(request).getCountryLong(), new Timestamp(new Date().getTime()),null,null));
		request.getSession().setAttribute("msg", "Đã xóa căn hộ ra khỏi danh sách yêu thích");
		request.getSession().setAttribute("posts", posts);
		response.sendRedirect("wishlist");
	}
	protected void doGet_Wishlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		PostDAO postDAO = new PostDAO();
		Post post = postDAO.findPostByID(id);
		Account account = (Account) request.getSession().getAttribute("account");
		LogDAO logDAO = new LogDAO();
		if(request.getSession().getAttribute("posts") == null) {
			List<Post> posts = new ArrayList<Post>();
			posts.add(post);
			request.getSession().setAttribute("posts", posts);
		} else {
			List<Post> posts = (List<Post>) request.getSession().getAttribute("posts");
			if(postDAO.exists(id, posts) == false) {
				posts.add(post);
				request.getSession().setAttribute("posts", posts);
			} else {
				request.getSession().setAttribute("posts", posts);
			}
		
			
		}
		logDAO.create(new Log(IPAddressUtil.getPublicIPAddress(),"alert","AccountID: " + account.getId() + " - đã thêm bài đăng có id là " + id + " vào whislist", IPConfigUtil.ipconfig(request).getCountryLong(), new Timestamp(new Date().getTime()),null,null));
		response.sendRedirect("wishlist");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
