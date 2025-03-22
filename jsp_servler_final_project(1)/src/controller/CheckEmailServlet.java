package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.AccountUtils;
import utils.EmailUtils;
import utils.VerificationCodeUtils;

@WebServlet("/checkemail")
public class CheckEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckEmailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("emailconfirm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		if (AccountUtils.getAccountByEmail(email).isPresent()) {
			String code = VerificationCodeUtils.generateVerificationCode();
			EmailUtils.sendVerificationCode(email, code);
			request.getSession().setAttribute("code", code);
			request.getSession().setAttribute("email", email);
			request.getRequestDispatcher("p-verification.jsp").forward(request, response);
		} else {
			request.setAttribute("fEMAIL", "Oops! Email not recognized. Please ensure you enter the correct email address.");
			request.getRequestDispatcher("emailconfirm.jsp").forward(request, response);
		}
	}

}
