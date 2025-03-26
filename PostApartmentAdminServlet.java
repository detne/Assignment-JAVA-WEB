package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

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
import dao.PostDAO;
import dao.PostImageDAO;
import com.google.gson.Gson;
@WebServlet({"/admin/postapartment"})
/**
 * Servlet implementation class AccountAdminServlet
 */
public class PostApartmentAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostApartmentAdminServlet() {
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
		} else if(action.equalsIgnoreCase("updatePost")) {
			doGet_UpdatePost(request, response);
		} else if(action.equalsIgnoreCase("deletePost")) {
			doGet_DeletePost(request, response);
		} else if(action.equalsIgnoreCase("dialogDetails")) {
			doGet_DialogDetails(request, response);
		}
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/postapartment.jsp");
		request.setAttribute("activePost", "active");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	protected void doGet_DialogDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("postID");
		int postID = Integer.parseInt(id);
		Gson gson = new Gson();
		PostDAO postDAO = new PostDAO();
		PostImageDAO postImageDAO = new PostImageDAO();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("post", postDAO.findPostByID(postID));
		data.put("postImages", postImageDAO.findPostImageByPostID(postID));
		PrintWriter printWriter = response.getWriter();
		printWriter.print(gson.toJson(data));
	}
	
	protected void doGet_UpdatePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO postDAO = new PostDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		Post post = postDAO.findPostByID(id);
		if(postDAO.update(post)) {
			request.getSession().setAttribute("msg", "Gỡ bài đăng xuống thành công");
			response.sendRedirect(request.getContextPath() + "/admin/postapartment");
		} else {
			request.getSession().setAttribute("msg", "Gỡ bài đăng xuống thất bại");
			response.sendRedirect(request.getContextPath() + "/admin/postapartment");
		}
	}
	
	protected void doGet_DeletePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO postDAO = new PostDAO();
		PostImageDAO postImageDAO = new PostImageDAO();
		LogDAO logDAO = new LogDAO();
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin");
		int beforeDeletePost = postDAO.findAllInAdmin().size();
		int id = Integer.parseInt(request.getParameter("id"));
		int afterDeletePost = 0;
		if(postImageDAO.delete(id)) {
			if(postDAO.delete(id)) {
				afterDeletePost = postDAO.findAllInAdmin().size();
				logDAO.create(new Log(IPConfigUtil.clientPublicIP, "warning","AdminId: " + accountAdmin.getId() + " đã xóa bài đăng có id là: " + id + " ra khỏi hệ thống",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Số bài đăng trước khi xóa: " + beforeDeletePost, "Số bài đăng sau khi xóa: " + afterDeletePost));
				request.getSession().setAttribute("msg", "Đã xóa bài đăng thành công");
				response.sendRedirect(request.getContextPath() + "/admin/postapartment");
			} else {
				request.getSession().setAttribute("msg", "Xóa bài đăng không thành công");
				response.sendRedirect(request.getContextPath() + "/admin/postapartment");
			}
		} else {
			if(postDAO.delete(id)) {
				afterDeletePost = postDAO.findAllInAdmin().size();
				logDAO.create(new Log(IPConfigUtil.clientPublicIP, "warning","AdminId: " + accountAdmin.getId() + " đã xóa bài đăng có id là: " + id + " ra khỏi hệ thống",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Số bài đăng trước khi xóa: " + beforeDeletePost, "Số bài đăng sau khi xóa: " + afterDeletePost));
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
		doGet(request, response);
	}

}
