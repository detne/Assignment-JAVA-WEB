package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Account;
import dao.ChatDAO;
import dao.OwnerDAO;
import com.google.gson.Gson;
@WebServlet("/loadMoreMSG")
/**
 * Servlet implementation class AutocompleteServlet
 */
public class LoadMoreMSGServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadMoreMSGServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String n = request.getParameter("n");
		Account account = (Account) request.getSession().getAttribute("account");
		ChatDAO chatDAO = new ChatDAO();
		PrintWriter printWriter = response.getWriter();
		OwnerDAO ownerDAO = new OwnerDAO();
		Gson gson = new Gson();
		printWriter.print(gson.toJson(chatDAO.findChatByUserID(account.getId(), Integer.parseInt(n))));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
