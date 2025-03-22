package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.Account;
import services.AccountServiceImp;

@WebServlet("/showaccounts")
public class AdminShowAccountsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminShowAccountsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Account> accounts = new AccountServiceImp().getAllAccounts();
		request.setAttribute("accounts", accounts);
		request.getRequestDispatcher("a-show-accounts.jsp").forward(request, response);
	}
}
