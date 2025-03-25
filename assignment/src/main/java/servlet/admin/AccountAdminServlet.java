package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Account;
import models.Log;
import utils.IPConfigUtil;
import dao.AccountDAO;
import dao.AccountPartialDAO;
import dao.FeedbackDAO;
import dao.LogDAO;
import com.google.gson.Gson;
@WebServlet({"/superadmin/account"})
/**
 * Servlet implementation class AccountAdminServlet
 */
public class AccountAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String oldFeedback = "";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action == null) {
			doGet_Index(request, response);
		} else if(action.equalsIgnoreCase("searchByName")) {
			doGet_SearchByName(request, response);
		} else if(action.equalsIgnoreCase("searchByPhone")) {
			doGet_SearchByPhone(request, response);
		} else if(action.equalsIgnoreCase("searchByVerify")) {
			doGet_SearchByVerify(request, response);
		} else if(action.equalsIgnoreCase("blockUser")) {
			doGet_BlockUser(request, response);
		} else if(action.equalsIgnoreCase("unblockUser")) {
			doGet_UnblockUser(request, response);
		} else if(action.equalsIgnoreCase("setAdmin")) {
			doGet_SetAdmin(request, response);
		} else if(action.equalsIgnoreCase("unAdmin")) {
			doGet_UnAdmin(request, response);
		}
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/accounts.jsp");
		request.setAttribute("activeAccount", "active");
		AccountPartialDAO accountPartialDAO = new AccountPartialDAO();
		request.setAttribute("accounts", accountPartialDAO.findAll());
		FeedbackDAO feedbackDAO = new FeedbackDAO();
		

		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	protected void doGet_SetAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LogDAO logDAO = new LogDAO();
		AccountDAO accountDAO = new AccountDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		Account account = accountDAO.findAccountByAccountID(id);
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin");
		account.setRole(0);
		if(accountDAO.update(account)) {
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "alert","AdminID: " + accountAdmin.getId() + " đã cấp user có ID là: " + account.getId() + " lên admin",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Vai trò: user", "Vai trò: admin"));
			request.getSession().setAttribute("msg", "Đã cấp admin thành công");
			response.sendRedirect(request.getContextPath() + "/superadmin/account");
			
		} else {
			System.out.println(1);
			response.sendRedirect(request.getContextPath() + "/superadmin/account");
		}

		
	}
protected void doGet_UnAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LogDAO logDAO = new LogDAO();
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin");
		AccountDAO accountDAO = new AccountDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		Account account = accountDAO.findAccountByAccountID(id);
		account.setRole(1);
		if(accountDAO.update(account)) {
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "alert","AdminID: " + accountAdmin.getId() + " đã gỡ quyền admin cho user có ID là: " + account.getId(),new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Vai trò: admin", "Vai trò: user"));
			request.getSession().setAttribute("msg", "Đã gỡ admin thành công");
			response.sendRedirect(request.getContextPath() + "/superadmin/account");
			
		} else {
			System.out.println(1);
			response.sendRedirect(request.getContextPath() + "/superadmin/account");
		}

		
	}
	
	protected void doGet_SearchByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		String name = request.getParameter("name");
		AccountPartialDAO accountPartialDAO = new AccountPartialDAO();
		Gson gson = new Gson();
		writer.print(gson.toJson(accountPartialDAO.searchByName(name)));
	}
	
	protected void doGet_SearchByVerify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		int status = Integer.parseInt(request.getParameter("value"));
		Gson gson = new Gson();
		AccountPartialDAO accountPartialDAO = new AccountPartialDAO();
		if(status == 0) {
			writer.print(gson.toJson(accountPartialDAO.findAll()));
		} else if(status == 1) {
			writer.print(gson.toJson(accountPartialDAO.checkVerify(true)));
		} else if(status == 2) {
			writer.print(gson.toJson(accountPartialDAO.checkVerify(false)));
		} else {
			writer.print(gson.toJson(accountPartialDAO.checkStatus(false)));
		}
	}
	
	protected void doGet_SearchByPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		String phone = request.getParameter("phone");
		AccountPartialDAO accountPartialDAO = new AccountPartialDAO();
		Gson gson = new Gson();
		writer.print(gson.toJson(accountPartialDAO.searchByPhone(phone)));
	}
	
	protected void doGet_BlockUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO accountDAO = new AccountDAO();
		LogDAO logDAO = new LogDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin"); 
		Account account = accountDAO.findAccountByAccountID(id);
		account.setStatus(false);
		if(accountDAO.update(account)) {
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "alert","AdminId: " + accountAdmin.getId() + " đã chặn user có ID là: " + account.getId(),new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Trạng thái tài khoản: không bị chặn", "Trạng thái tài khoản: đã bị chặn"));
			request.getSession().setAttribute("msg", "Đã chặn thành công");
			response.sendRedirect(request.getContextPath() + "/superadmin/account");
			
		} else {
			System.out.println(1);
			response.sendRedirect(request.getContextPath() + "/superadmin/account");
		}
	}
	
	protected void doGet_UnblockUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountDAO accountDAO = new AccountDAO();
		LogDAO logDAO = new LogDAO();
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin");
		int id = Integer.parseInt(request.getParameter("id"));
		Account account = accountDAO.findAccountByAccountID(id);
		account.setStatus(true);
		if(accountDAO.update(account)) {
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "alert","AdminId: " + accountAdmin.getId() + " đã chặn user có ID là: " + account.getId(),new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Trạng thái tài khoản: đã bị chặn", "Trạng thái tài khoản: không bị chặn"));
			request.getSession().setAttribute("msg2", "Đã gỡ chặn thành công");
			response.sendRedirect(request.getContextPath() + "/superadmin/account");
			
		} else {
			System.out.println(1);
			response.sendRedirect(request.getContextPath() + "/superadmin/account");
		}
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
