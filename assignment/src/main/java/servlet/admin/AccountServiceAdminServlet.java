package servlet.admin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Account;
import models.AccountService;
import models.Chat;
import models.Log;
import utils.IPConfigUtil;
import dao.AccountServiceDAO;
import dao.ChatDAO;
import dao.LogDAO;

@WebServlet({"/admin/accountService"})
/**
 * Servlet implementation class AccountAdminServlet
 */
public class AccountServiceAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountServiceAdminServlet() {
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
		} else if(action.equals("cancelService")){ 
			doGet_CancelService(request, response);
		} 
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/accountService.jsp");
		request.setAttribute("activeAccountService", "active");
		

		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	
	protected void doGet_CancelService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/listAccountService.jsp");
		request.setAttribute("activeServiceAccount", "active");
		String accountServiceID = request.getParameter("accountServiceID");
		System.out.println(accountServiceID);
		AccountServiceDAO accountServiceDAO = new AccountServiceDAO();
		LogDAO logDAO = new LogDAO();
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin");
		
		AccountService accountService = accountServiceDAO.findById(Integer.parseInt(accountServiceID));
		accountService.setStatus(false);
		if(accountServiceDAO.update(accountService)) {
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "alert","AdminId: " + accountAdmin.getId() + " đã hủy trạng thái người đăng kí dịch vụ có ID là: " + accountService.getId() + " vào hệ thống",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Trạng thái trước khi hủy: còn hiệu lực", "Trạng thái sau khi hủy: không còn hiệu lực"));
			request.getSession().setAttribute("msg", "Hủy gói dịch vụ thành công");
			response.sendRedirect(request.getContextPath() + "/admin/accountService");
		} else {
			request.getSession().setAttribute("msg", "Hủy gói dịch vụ thất bại");
			response.sendRedirect(request.getContextPath() + "/admin/accountService");
		}
	
	}

	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("sendChat")) {
			doPost_SendChat(request, response);
		}
	}
	protected void doPost_SendChat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accountID = request.getParameter("accountID");
		String message = request.getParameter("message");
		ChatDAO chatDAO = new ChatDAO();
		Chat chat = new Chat(Integer.parseInt(accountID), 29, message, 0, new Date());
		if(chatDAO.newChat(chat)) {
			response.sendRedirect(request.getContextPath()+ "/admin/chatadmin?id="+ accountID);
		}
		
	}

}
