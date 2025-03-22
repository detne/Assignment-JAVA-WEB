package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.Account;
import services.AccountServiceImp;

@WebServlet("/verification")
public class SignUpVerificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SignUpVerificationServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("verification.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userInput = request.getParameter("otp");
		String systemCode = (String) request.getSession().getAttribute("code");
		if (userInput.equals(systemCode)) {
			Account account = (Account) request.getSession().getAttribute("account");
			new AccountServiceImp().saveAccount(account);
			request.setAttribute("sVERIFY", "Congratulations! Your account has been created.");
			request.getRequestDispatcher("verification.jsp").forward(request, response);
		} else {
			request.setAttribute("fVERIFY", "Oops! The OTP code you entered is incorrect. Double-check and try again.");
			request.getRequestDispatcher("verification.jsp").forward(request, response);
		}
	}

}
