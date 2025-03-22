package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/delete-account")
public class AdminDeleteAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminDeleteAccountServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		System.out.println(username + " --> from delete account");
		response.sendRedirect("showaccounts");
	}
}
