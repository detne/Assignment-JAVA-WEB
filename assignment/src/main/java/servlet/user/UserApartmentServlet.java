package servlet.user;

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
@WebServlet("/userapartment")
/**
 * Servlet implementation class HomeServlet
 */
public class UserApartmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserApartmentServlet() {
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
		} else if(action.equalsIgnoreCase("searchByKeyword")) {
			doGet_SearchByName(request, response);
		} else if(action.equalsIgnoreCase("searchByDistrict")) {
			doGet_SearchByDistrict(request, response);
		} else if(action.equalsIgnoreCase("searchByPrice")) {
			doGet_SearchByPrice(request, response);
		} else if(action.equalsIgnoreCase("searchByPriceOver5")) {
			doGet_SearchByPriceOver5(request, response);
		} else if(action.equalsIgnoreCase("searchByBedroom")) {
			doGet_SearchByBedroom(request, response);
		} else if(action.equalsIgnoreCase("searchByArea")) {
			doGet_SearchByArea(request, response);
		} else if(action.equalsIgnoreCase("deletePost")) {
			doGet_DeletePost(request, response);
		} else if(action.equalsIgnoreCase("searchByDistrict1")) {
			doGet_SearchByDistrict1(request, response);
		}
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO postDAO = new PostDAO();
		request.setAttribute("posts", postDAO.findAll());
		request.setAttribute("activeUser", "active");
		request.setAttribute("p", "../user/userapartment.jsp");
	
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}
	protected void doGet_DeletePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO postDAO = new PostDAO();
		LogDAO logDAO = new LogDAO();
		Account account = (Account) request.getSession().getAttribute("account");
		int beforeDeletePost = postDAO.findPostByAccountID(account.getId()).size();
		PostImageDAO postImageDAO = new PostImageDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		int afterDeletePost = 0;
		if(postImageDAO.delete(id)) {
			if(postDAO.delete(id)) {
				afterDeletePost =  postDAO.findPostByAccountID(account.getId()).size();
				logDAO.create(new Log(IPConfigUtil.clientPublicIP, "warning","Người dùng có ID là: " + account.getId() + " đã xóa căn hộ có id là: " + id,new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Số căn hộ trước khi xóa: " + beforeDeletePost, "Số căn hộ sau khi xóa: " + afterDeletePost));
				request.getSession().setAttribute("msg", "Xóa bài đăng thành công");
				response.sendRedirect("mypost");
			} else {
				request.getSession().setAttribute("msg", "Xóa bài đăng không thành công");
				response.sendRedirect("mypost");
			}
		} else {
			if(postDAO.delete(id)) {
				afterDeletePost =  postDAO.findPostByAccountID(account.getId()).size();
				logDAO.create(new Log(IPConfigUtil.clientPublicIP, "warning","Người dùng có ID là: " + account.getId() + " đã xóa căn hộ có id là: " + id,new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Số căn hộ trước khi xóa: " + beforeDeletePost, "Số căn hộ sau khi xóa: " + afterDeletePost));
				request.getSession().setAttribute("msg", "Xóa bài đăng thành công");
				response.sendRedirect("mypost");
			} else {
				request.getSession().setAttribute("msg", "Xóa bài đăng không thành công");
				response.sendRedirect("mypost");
			}
		}
	}
	protected void doGet_SearchByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		String keyword = request.getParameter("keyword");
		PostDAO postDAO = new PostDAO();
		Gson gson = new Gson();
		writer.print(gson.toJson(postDAO.findPostBySubject(keyword)));
		
	}
	
	protected void doGet_SearchByDistrict(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		String district = request.getParameter("district");
		PostDAO postDAO = new PostDAO();
		Gson gson = new Gson();
		writer.print(gson.toJson(postDAO.findPostByDistrict(district)));
		

	}
	protected void doGet_SearchByDistrict1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		String district = request.getParameter("district");
		PostDAO postDAO = new PostDAO();
		Gson gson = new Gson();
		writer.print(gson.toJson(postDAO.findPostByDistrict(district)));
		

	}
	
	protected void doGet_SearchByPrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		double price = Double.parseDouble(request.getParameter("price"));
		PostDAO postDAO = new PostDAO();
		Gson gson = new Gson();
		writer.print(gson.toJson(postDAO.findPostByPrice(price)));
		

	}
	
	protected void doGet_SearchByPriceOver5(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		double price = Double.parseDouble(request.getParameter("price"));
		PostDAO postDAO = new PostDAO();
		Gson gson = new Gson();
		writer.print(gson.toJson(postDAO.findPostByPriceOver5(price)));
		

	}
	
	protected void doGet_SearchByBedroom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		int bedroom = Integer.parseInt(request.getParameter("bedroom"));
		PostDAO postDAO = new PostDAO();
		Gson gson = new Gson();
		writer.print(gson.toJson(postDAO.findPostByBedroom(bedroom)));
		

	}
	
	protected void doGet_SearchByArea(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		double area = Double.parseDouble(request.getParameter("area"));
		PostDAO postDAO = new PostDAO();
		Gson gson = new Gson();
		writer.print(gson.toJson(postDAO.findPostByArea(area)));
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
