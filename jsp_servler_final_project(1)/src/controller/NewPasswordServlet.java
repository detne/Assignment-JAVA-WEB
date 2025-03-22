package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.AccountServiceImp;

@WebServlet("/newwpassword")
public class NewPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewPasswordServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("newpassword.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		String email = (String) request.getSession().getAttribute("email");
		if(!confirm.equals(password)) {
			request.setAttribute("fNPASS", "Oops! Passwords don't match. Double-check your entries.");
			request.getRequestDispatcher("newpassword.jsp").forward(request, response);
		} else {
			new AccountServiceImp().updatePassword(email,password);
			request.setAttribute("sNPASS", "Your password has been changed.");
			request.getRequestDispatcher("newpassword.jsp").forward(request, response);
		}
	}

}
