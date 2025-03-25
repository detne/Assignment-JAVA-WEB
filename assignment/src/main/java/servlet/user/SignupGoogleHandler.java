package servlet.user;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import dao.AccountDetailsDAO;
import org.mindrot.jbcrypt.BCrypt;

import models.Account;
import models.AccountGmail;
import models.UserGoogleDto;
import service.GoogleUtils;
import service.RandomStringHelper;
import dao.AccountGmailDAO;


/**
* Servlet implementation class LoginGoogleServlet
*/
@WebServlet("/signup-google")
public class SignupGoogleHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	* @see HttpServlet#HttpServlet()
	*/
	public SignupGoogleHandler() {
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
			String accessToken = GoogleUtils.getToken2(code);
			UserGoogleDto googlePojo = GoogleUtils.getUserInfo(accessToken);
			request.setAttribute("pojo", googlePojo);
			AccountGmailDAO accountGmailDAO = new AccountGmailDAO();
			AccountGmail accountGmail = new AccountGmail();
			accountGmail.setName(googlePojo.getEmail());
			AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
			AccountDAO accountDAO = new AccountDAO();
			Account account = new Account();
			account.setUsername(googlePojo.getEmail());
			account.setPassword(BCrypt.hashpw("123", BCrypt.gensalt()));
			account.setEmail(googlePojo.getEmail());
			account.setCreated(new Date());
			account.setStatus(true);
			account.setVerify(true);
			account.setRole(1);
			account.setSecurityCode(RandomStringHelper.generateRandomString(6));
			if(accountGmailDAO.create(accountGmail)) {
				account.setGmailID(accountGmailDAO.findUserByGmail(googlePojo.getEmail()).getId());
			}
			AccountGmail acc = accountGmailDAO.findUserByGmail(googlePojo.getEmail());
			if(accountDAO.register(account)) {
				request.getSession().setAttribute("msg", "Đăng kí thành công");
				request.getSession().setAttribute("accountdetails", 
						accountDetailsDAO.findAccountByAccountID(accountDAO.findAccountByUsername(accountDAO.findAccountByUsername(acc.getName()).getUsername()).getId()));
				request.getSession().setAttribute("account", accountDAO.findAccountByUsername(accountDAO.findAccountByUsername(acc.getName()).getUsername()));
				response.sendRedirect("account");
			} else {
				accountGmailDAO.delete(accountGmailDAO.findUserByGmail(googlePojo.getEmail()).getId());
				request.getSession().setAttribute("msg", "Đăng kí thất bại");
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
