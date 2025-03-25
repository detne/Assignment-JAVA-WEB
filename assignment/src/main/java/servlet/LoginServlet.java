package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import org.mindrot.jbcrypt.BCrypt;


import models.Account;
import models.Log;
import utils.IPConfigUtil;
import service.MailHelper;
import service.RandomStringHelper;

@WebServlet("/login")
/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			doGet_Login(request, response);
		} else {
			if(action.equalsIgnoreCase("logout")) {
				doGet_Logout(request, response);
			} else if(action.equalsIgnoreCase("verify")) {
				doGet_Verify(request, response);
			} else if(action.equalsIgnoreCase("message")) {
				doGet_Message(request, response);
			} else if(action.equalsIgnoreCase("test")) {
				doGet_LoginTest(request, response);
			}
		}
	}
	protected void doGet_Verify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String securityCode = request.getParameter("securityCode");
		AccountDAO accountDAO = new AccountDAO();
		Account account = accountDAO.findAccountByUsername(new String(username.getBytes("ISO-8859-1"), "UTF-8"));
		System.out.println(account);
		if(account.getUsername().equalsIgnoreCase(new String(username.getBytes("ISO-8859-1"), "UTF-8")) && account.getSecurityCode().equalsIgnoreCase(securityCode)) {
			account.setVerify(true);
			System.out.println("Đã cập nhật verify");
			if(accountDAO.update(account)) {
				System.out.println("đã cập nhật thành công");
				response.sendRedirect("login");
			}
			
		} else {
			System.out.println("cập nhật thất bại");
			request.getSession().setAttribute("content", "aaaaa");
			response.sendRedirect("login?action=message");
		}
	}
	protected void doGet_Login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountDAO accountDAO = new AccountDAO();
		request.setAttribute("accounts", accountDAO.findAll());
		request.getRequestDispatcher("/WEB-INF/views/login/login.jsp").forward(request, response);
	}
	// test google
	protected void doGet_LoginTest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/login/googleTest.jsp").forward(request, response);
	}
	protected void doGet_Message(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/login/test.jsp").forward(request, response);
	}
	protected void doGet_Logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().removeAttribute("accountAdmin");
		request.getSession().removeAttribute("accountdetails");
		request.getSession().removeAttribute("accounts");
		request.getSession().removeAttribute("posts");
		request.getRequestDispatcher("/WEB-INF/views/login/login.jsp").forward(request, response);
	}
	protected void doGet_Account(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/login/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("login")) {
			doPost_Login(request, response);
		} else if(action.equalsIgnoreCase("register")) {
			doPost_Register(request, response);
		}
	}
	protected void doPost_Login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		AccountDAO accountDAO = new AccountDAO();
		AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
		Account account = accountDAO.findAccountByUsername(new String(username.getBytes("ISO-8859-1"), "UTF-8"));
		FeedbackDAO feedbackDAO = new FeedbackDAO();
		ContactDAO contactDAO = new ContactDAO();
		LogDAO logDAO = new LogDAO();
		IPConfigUtil IPConfigUtil = new IPConfigUtil();
		ChatDAO chatDAO = new ChatDAO();
		
		if(accountDAO.login(new String(username.getBytes("ISO-8859-1"), "UTF-8"), password)) {
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "info","AccountID: " + account.getId() + " Đăng nhập",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), null, null));
			if(account.getRole() == 0 || account.getRole() == 2) {
				request.getSession().setAttribute("accountAdmin", account);
				request.getSession().removeAttribute("accountdetails");
				request.getSession().removeAttribute("account");
				request.getSession().setAttribute("feedbacks", feedbackDAO.findAll().size());
				request.getSession().setAttribute("contacts", contactDAO.findAll().size());
				response.sendRedirect("admin/dashboard");
			} else if(account.getRole() == 1) {
				request.getSession().setAttribute("accountdetails", 
						accountDetailsDAO.findAccountByAccountID(accountDAO.findAccountByUsername(new String(username.getBytes("ISO-8859-1"), "UTF-8")).getId()));
				request.getSession().setAttribute("account", accountDAO.findAccountByUsername(new String(username.getBytes("ISO-8859-1"), "UTF-8")));
				request.getSession().setAttribute("msgNoti", chatDAO.findChat(account.getId(), 0).size());
				request.getSession().removeAttribute("accountAdmin");
				response.sendRedirect("account");
			}
			
		
		} else {
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "info"," Đăng nhập thất bại",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), null, null));
			request.getSession().setAttribute("msg", "Tài khoản hoặc mật khẩu không đúng");
			response.sendRedirect("login");
		}
		
		
	}
	protected void doPost_Register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String regexEmail = "^(.+)@(.+)$";
		String regexPass = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,20}$";
		Pattern patternEmail = Pattern.compile(regexEmail);
		Pattern patternPassword = Pattern.compile(regexPass);
		Matcher matcherEmail = patternEmail.matcher(email);
		Matcher matcherPassword = patternPassword.matcher(password);
		String securityCode = RandomStringHelper.generateRandomString(6);
		Account account = new Account();
		account.setUsername(new String(username.getBytes("ISO-8859-1"), "UTF-8") );
		account.setEmail(email);
		account.setCreated(new Date());
		account.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
		account.setStatus(true);
		account.setVerify(false);
		account.setRole(1);
		account.setSecurityCode(securityCode);
		AccountDAO accountDAO = new AccountDAO();
		AccountGmailDAO accountGmailDAO = new AccountGmailDAO();
		if(matcherEmail.matches() && matcherPassword.matches()) {
			if(accountDAO.register(account)) {
				request.getSession().setAttribute("msg", "Đã đăng kí tài khoản thành công. Xin vui lòng đăng nhập tài khoản");
				String content = "Xin chào, đây là email từ Apartment! Vui lòng nhấp vào <a href='http://localhost:8080/projectGroup6/login?action=verify&username=" + new String(username.getBytes("ISO-8859-1"), "UTF-8") + "&email=" + email +"&securityCode=" + securityCode + "'>Liên kết</a> để xác nhận tài khoản của bạn.";
				MailHelper.MailHelper(email, "Xác nhận tài khoản - Apartment", content);
				response.sendRedirect("login?action=message");
			} else {
				request.getSession().setAttribute("msg", "Đăng kí không thành công do đã tồn tại người dùng.");
				response.sendRedirect("login");
			}
			
		}
		
	
		
	
	}

}
