package servlet.user;

import java.io.IOException;
import java.sql.Timestamp;
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
import dao.PostDAO;
import dao.PostImageDAO;
import service.IPAddressUtil;
import dao.LogDAO;
import com.google.gson.Gson;
@WebServlet("/mypost")
/**
 * Servlet implementation class HomeServlet
 */
public class MyPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPostServlet() {
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
		} else if(action.equalsIgnoreCase("deletePost")) {
			doGet_DeletePost(request, response);
		}
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO postDAO = new PostDAO();
		Account account = (Account) request.getSession().getAttribute("account");
		if(account != null) {
			request.setAttribute("postaccount", postDAO.findPostByAccountID(account.getId()));
		}
		request.setAttribute("p", "../user/mypost.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}
	
	protected void doGet_DeletePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO postDAO = new PostDAO();
		Account account = (Account) request.getSession().getAttribute("account");
		List<Post> listPostBeforeDelete = postDAO.findPostByAccountID(account.getId());
		Gson gson = new Gson();
		PostImageDAO postImageDAO = new PostImageDAO();
		LogDAO logDAO = new LogDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		if(postImageDAO.delete(id)) {
			if(postDAO.delete(id)) {
				List<Post> listPostAfterDelete = postDAO.findPostByAccountID(account.getId());
				logDAO.create(new Log(IPAddressUtil.getPublicIPAddress(),"alert","AccountID: " + account.getId() + " - đã xóa bài đăng căn hộ có id là: " + id, IPConfigUtil.ipconfig(request).getCountryLong(), new Timestamp(new Date().getTime()),gson.toJson(listPostBeforeDelete),gson.toJson(listPostAfterDelete)));
				request.getSession().setAttribute("msg", "Đã xóa bài đăng thành công");
				response.sendRedirect(request.getContextPath() + "/admin/postapartment");
			} else {
				request.getSession().setAttribute("msg", "Xóa bài đăng không thành công");
				response.sendRedirect(request.getContextPath() + "/admin/postapartment");
			}
		} else {
			if(postDAO.delete(id)) {
				List<Post> listPostAfterDelete = postDAO.findPostByAccountID(account.getId());
				logDAO.create(new Log(IPAddressUtil.getPublicIPAddress(),"alert","AccountID: " + account.getId() + " - đã xóa bài đăng căn hộ có id là: " + id, IPConfigUtil.ipconfig(request).getCountryLong(), new Timestamp(new Date().getTime()),gson.toJson(listPostBeforeDelete),gson.toJson(listPostAfterDelete)));
				request.getSession().setAttribute("msg", "Đã xóa bài đăng thành công");
				response.sendRedirect(request.getContextPath() + "/admin/postapartment");
			} else {
				request.getSession().setAttribute("msg", "Xóa bài đăng không thành công");
				response.sendRedirect(request.getContextPath() + "/admin/postapartment");
			}
		}
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	
	

}
