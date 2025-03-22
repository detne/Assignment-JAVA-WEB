package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.Role;
import persistence.Account;

import java.sql.Timestamp;

import utils.AccountUtils;
import utils.EmailUtils;
import utils.VerificationCodeUtils;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		
		boolean isExistedUser = AccountUtils.isExistedUsername(username);
		boolean isExistedEmail = AccountUtils.getAccountByEmail(email).isPresent();
		
		if(isExistedUser) {
			request.setAttribute("fSIGNUP", "Oops, this username is taken. Please choose a different one.");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		} else {
			
			if(isExistedEmail) {
				request.setAttribute("fSIGNUP", "Oops, this email address is taken. Please provide a unique email.");
				request.getRequestDispatcher("register.jsp").forward(request, response);
			} else {
				if(!confirm.equals(password)) {
					request.setAttribute("fSIGNUP", "Oops! Passwords don't match. Double-check your entries.");
					request.getRequestDispatcher("register.jsp").forward(request, response);
				} else {
					String code = VerificationCodeUtils.generateVerificationCode();
					Account account = new Account(username, password, email,new Timestamp(System.currentTimeMillis()), Role.USER.getRole());
					EmailUtils.sendVerificationCode(email, code);
					request.getSession().setAttribute("account", account);
					request.getSession().setAttribute("code", code);
					request.getRequestDispatcher("verification.jsp").forward(request, response);
				}
			}
		}
	}

}
