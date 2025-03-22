package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.AccountServiceImp;

@WebServlet("/editaccount")
public class EditAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditAccountServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("a-show-accounts.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String selectedRole = request.getParameter("selectedRole");
		System.out.println(username);
		System.out.println(selectedRole);
			new AccountServiceImp().updateRole(username, selectedRole);
		response.sendRedirect("a-show-accounts.jsp");
	}

}
