package servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import models.Account;
import dao.SystemApartmentDAO;
import service.UploadFileHelper;

@WebServlet("/chatuser")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 10,
        fileSizeThreshold = 1024 * 1024 * 10
)
/**
 * Servlet implementation class HomeServlet
 */
public class ChatUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    private Account account = null;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action == null) {
			doGet_Index(request, response);
		} 
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SystemApartmentDAO systemApartmentDAO = new SystemApartmentDAO();
	
		account = (Account) request.getSession().getAttribute("account");
		if(account == null) {
			request.getSession().setAttribute("msg", "Bạn cần phải đăng nhập tài khoản để có thể nhắn tin với hệ thống");
			response.sendRedirect("home");
		} else {
			request.getSession().setAttribute("msg", "ok");
			request.setAttribute("systemapartments", systemApartmentDAO.findAll());
			request.setAttribute("activeSystem", "active");
			request.setAttribute("p", "../user/chatuser.jsp");
			request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
		}
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("chat thuwr aaaaa");
		Part file = request.getPart("file");
		System.out.println(file);
		String chatFileUpload = UploadFileHelper.uploadFile("assets/user/images",request,file);
		System.out.println(chatFileUpload);
		response.getWriter().write(chatFileUpload);
		
	}

	
	
}
