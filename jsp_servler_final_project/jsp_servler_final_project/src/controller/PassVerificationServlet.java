package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pass-verification")
public class PassVerificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PassVerificationServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("p-verification.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userInput = request.getParameter("otp");
		String systemCode = (String) request.getSession().getAttribute("code");
		if (userInput.equals(systemCode)) {
			request.getRequestDispatcher("newpassword.jsp").forward(request, response);
		} else {
			request.setAttribute("fPVERIFY", "Oops! The OTP code you entered is incorrect. Double-check and try again.");
			request.getRequestDispatcher("p-verification.jsp").forward(request, response);
		}
	}

}
