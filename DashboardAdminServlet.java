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

import models.Post;
import dao.LogDAO;
import dao.PostDAO;
import dao.PostImageDAO;
import com.google.gson.Gson;
@WebServlet({"/admin/dashboard"})
/**
 * Servlet implementation class AccountAdminServlet
 */
public class DashboardAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardAdminServlet() {
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
		} else if(action.equalsIgnoreCase("dialogDetails")) {
			doGet_DialogDetails(request, response);
		} else if(action.equalsIgnoreCase("updatePost")) {
			doGet_UpdatePost(request, response);
		} else if(action.equalsIgnoreCase("deletePost")) {
			doGet_DeletePost(request, response);
		} else if(action.equalsIgnoreCase("searchByLevel")) {
			doGet_SearchByLevel(request, response);
		}
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/dashboard.jsp");
		
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
			request.getSession().setAttribute("msg", "Đã xác thực cho đăng bài thành công");
			response.sendRedirect(request.getContextPath() + "/admin/dashboard");
		} else {
			request.getSession().setAttribute("msg", "Đã xác thực cho đăng bài thất bại");
			response.sendRedirect(request.getContextPath() + "/admin/dashboard");
		}
	}
	
	protected void doGet_DeletePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO postDAO = new PostDAO();
		PostImageDAO postImageDAO = new PostImageDAO();
		
		int id = Integer.parseInt(request.getParameter("id"));
		if(postImageDAO.delete(id)) {
			if(postDAO.delete(id)) {
				request.getSession().setAttribute("msg", "Đã xóa bài đăng thành công");
				response.sendRedirect(request.getContextPath() + "/admin/dashboard");
			} else {
				request.getSession().setAttribute("msg", "Xóa bài đăng không thành công");
				response.sendRedirect(request.getContextPath() + "/admin/dashboard");
			}
		}
	}

	protected void doGet_SearchByLevel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		int status = Integer.parseInt(request.getParameter("value"));
		Gson gson = new Gson();
		LogDAO logDAO = new LogDAO();
		if(status == 0) {
			writer.print(gson.toJson(logDAO.findAll()));
		} else if(status == 1) {
			writer.print(gson.toJson(logDAO.findByLevel("info")));
		} else if(status == 2) {
			writer.print(gson.toJson(logDAO.findByLevel("alert")));
		} else if(status == 3) {
			writer.print(gson.toJson(logDAO.findByLevel("warning")));
		} else if(status == 4) {
			writer.print(gson.toJson(logDAO.findByLevel("danger")));
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
