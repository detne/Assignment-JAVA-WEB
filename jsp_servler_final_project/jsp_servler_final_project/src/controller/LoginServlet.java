package controller;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.Role;
import persistence.Account;
import utils.AccountUtils;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Optional<Account> isExist = AccountUtils.login(username, password);
		
		if(isExist.isPresent()) {
			Account account = isExist.get();
			request.getSession().setAttribute("account", account);
			if(Role.ADMIN.getRole().equals(account.getRole())) {
				response.sendRedirect(request.getContextPath() +"/admin-home");
			} else if(Role.USER.getRole().equals(account.getRole())) {
				response.sendRedirect(request.getContextPath() + "/userhome");
			} else {
				response.sendRedirect("m-index.jsp");
			}
		} else {
			request.setAttribute("fLOGIN", "Oops! Login was unsuccessful. Please check your username and password.");
			request.getRequestDispatcher("login.jsp").forward(request, response);;
		}
		
	}

}
