package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import models.Account;
import dao.AccountDAO;

/**
 * Servlet implementation class EmailServlet
 */
@WebServlet("/changepassword")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action == null) {
			doGet_Index(request, response);
		}
	}
	
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Account account = (Account) request.getSession().getAttribute("accountEmail");
		if(account != null) {
			request.getRequestDispatcher("/WEB-INF/views/login/changePassword.jsp").forward(request, response);
		} else {
			response.sendRedirect("email");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("changePass")) {
			doPost_changePass(request, response);
		}
	}
	
	protected void doPost_changePass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String newPass = request.getParameter("newPassword");
		String confirmPass = request.getParameter("confirmPassword");
		Account account = (Account) request.getSession().getAttribute("accountEmail");
		account.setPassword(BCrypt.hashpw(newPass, BCrypt.gensalt()));
		AccountDAO accountDAO = new AccountDAO();
		if(accountDAO.update(account)) {
			request.getSession().setAttribute("msg", "Đã đổi mật khẩu thành công. Xin vui lòng đăng nhập lại tài khoản");
			response.sendRedirect("login");
		} else {
			request.getSession().setAttribute("msg", "Đã đổi mật khẩu thành công. Xin vui lòng đăng nhập lại tài khoản");
			response.sendRedirect("login");
			
		}
	}

}
