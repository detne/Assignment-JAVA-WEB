package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Account;
import models.Log;
import utils.IPConfigUtil;
import dao.LogDAO;
import dao.PostDAO;
import dao.PostImageDAO;
import com.google.gson.Gson;
@WebServlet({"/admin/userapartment"})
/**
 * Servlet implementation class AccountAdminServlet
 */
public class UserApartmentAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserApartmentAdminServlet() {
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
		} else if(action.equalsIgnoreCase("searchBySubject")) {
			doGet_SearchBySubject(request, response);
		} else if(action.equalsIgnoreCase("deleteApart")) {
			doGet_DeleteApart(request, response);
		}
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/userapartment.jsp");
		request.setAttribute("activeUser", "active");
		PostDAO postDAO = new PostDAO();
		request.setAttribute("userapartment", postDAO.findAll());
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	
	protected void doGet_SearchBySubject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		String subject = request.getParameter("subject");
		PostDAO postDAO = new PostDAO();
		Gson gson = new Gson();
		writer.print(gson.toJson(postDAO.findPostBySubject(subject)));
	}
	
	protected void doGet_DeleteApart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO postDAO = new PostDAO();
		int beforeDeletePost = postDAO.findAll().size();
		PostImageDAO postImageDAO = new PostImageDAO();
		LogDAO logDAO = new LogDAO();
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin");
		int id = Integer.parseInt(request.getParameter("id"));
		int afterDeletePost = 0;
		if(postImageDAO.delete(id)) {
			if(postDAO.delete(id)) {
				afterDeletePost = postDAO.findAll().size();
				logDAO.create(new Log(IPConfigUtil.clientPublicIP, "warning","AdminId: " + accountAdmin.getId() + " đã xóa căn hộ có id là: " + id + " ra khỏi hệ thống",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Số căn hộ trước khi xóa: " + beforeDeletePost, "Số căn hộ sau khi xóa: " + afterDeletePost));
				request.getSession().setAttribute("msg", "Đã xóa căn hộ người dùng thành công");
				response.sendRedirect(request.getContextPath() + "/admin/userapartment");
			} else {
				request.getSession().setAttribute("msg", "Xóa căn hộ người dùng không thành công");
				response.sendRedirect(request.getContextPath() + "/admin/userapartment");
			}
		} else {
			if(postDAO.delete(id)) {
				afterDeletePost = postDAO.findAll().size();
				logDAO.create(new Log(IPConfigUtil.clientPublicIP, "warning","AdminId: " + accountAdmin.getId() + " đã xóa căn hộ có id là: " + id + " ra khỏi hệ thống",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Số căn hộ trước khi xóa: " + beforeDeletePost, "Số căn hộ sau khi xóa: " + afterDeletePost));
				request.getSession().setAttribute("msg", "Đã xóa căn hộ người dùng thành công");
				response.sendRedirect(request.getContextPath() + "/admin/userapartment");
			} else {
				request.getSession().setAttribute("msg", "Xóa căn hộ người dùng không thành công");
				response.sendRedirect(request.getContextPath() + "/admin/userapartment");
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
