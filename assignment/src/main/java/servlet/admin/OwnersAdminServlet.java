package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OwnerDAO;
import com.google.gson.Gson;

@WebServlet("/admin/owners")
/**
 * Servlet implementation class OwnersAdminServlet
 */
public class OwnersAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OwnersAdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action == null) {
			doGet_Index(request, response);
		} else if (action.equalsIgnoreCase("searchByName")) {
			doGet_SearchByName(request, response);
		} else if (action.equalsIgnoreCase("deleteOwner")) {
			doGet_DeletePost(request, response);
		}
	}

	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("admin", "../admin/owners.jsp");
		request.setAttribute("activeOwners", "active");

		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}

	protected void doGet_SearchByName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		String name = request.getParameter("subject");
		System.out.println(name);
		OwnerDAO ownerDAO = new OwnerDAO();
		Gson gson = new Gson();
		writer.print(gson.toJson(ownerDAO.findByKeyword(name)));
	}

	protected void doGet_DeletePost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OwnerDAO ownerDAO = new OwnerDAO();

		int id = Integer.parseInt(request.getParameter("id"));

		if (ownerDAO.delete(id)) {
			request.getSession().setAttribute("msg", "Đã xóa chủ sở hữu thành công");
			response.sendRedirect(request.getContextPath() + "/admin/owners");
		} else {
			request.getSession().setAttribute("msg", "Xóa chủ sở hữu không thành công");
			response.sendRedirect(request.getContextPath() + "/admin/owners");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
