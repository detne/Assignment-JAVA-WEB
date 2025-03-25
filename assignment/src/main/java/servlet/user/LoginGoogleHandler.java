package servlet.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.AccountGmail;
import models.Log;
import models.UserGoogleDto;
import utils.IPConfigUtil;
import dao.AccountDAO;
import dao.AccountDetailsDAO;
import service.GoogleUtils;
import dao.AccountGmailDAO;
import dao.LogDAO;



/**
* Servlet implementation class LoginGoogleServlet
*/
@WebServlet("/login-google")
public class LoginGoogleHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	* @see HttpServlet#HttpServlet()
	*/
	public LoginGoogleHandler() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, 
IOException {
		// TODO Auto-generated method stub
		String code = request.getParameter("code");
		
		if (code == null || code.isEmpty()) {
			RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/views/login/login.jsp");
			dis.forward(request, response);
			} else {
			String accessToken = GoogleUtils.getToken(code);
			UserGoogleDto googlePojo = GoogleUtils.getUserInfo(accessToken);
			request.setAttribute("pojo", googlePojo);
			AccountGmailDAO accountGmailDAO = new AccountGmailDAO();
			AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
			AccountDAO accountDAO = new AccountDAO();
			LogDAO logDAO = new LogDAO();
			IPConfigUtil IPConfigUtil = new IPConfigUtil();
			AccountGmail acc = accountGmailDAO.findUserByGmail(googlePojo.getEmail());
			if(accountDAO.findAccountByEmail(acc.getName()) != null) {
				logDAO.create(new Log(IPConfigUtil.clientPublicIP, "info","AccountID: " + accountDAO.findAccountByGmailID(acc.getId()).getId() + " - Đăng nhập bằng Gmail",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), null, null));
				request.getSession().setAttribute("accountdetails", 
						accountDetailsDAO.findAccountByAccountID(accountDAO.findAccountByUsername(accountDAO.findAccountByUsername(acc.getName()).getUsername()).getId()));
				System.out.println(accountDetailsDAO.findAccountByAccountID(accountDAO.findAccountByUsername(accountDAO.findAccountByUsername(acc.getName()).getUsername()).getId()));
				request.getSession().setAttribute("account", accountDAO.findAccountByUsername(accountDAO.findAccountByUsername(acc.getName()).getUsername()));
				response.sendRedirect("account");
			} else {
				logDAO.create(new Log(IPConfigUtil.clientPublicIP, "alert", accountDAO.findAccountByGmailID(acc.getId()).getId() + " Đăng nhập bằng Gmail thất bại",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), null, null));
				request.getSession().setAttribute("msg", "Đăng nhập thất bại");
				response.sendRedirect("login");
			}
//			RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/views/user/home.jsp");
//			dis.forward(request, response);
			}
	}

	/**
	* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, 
IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
