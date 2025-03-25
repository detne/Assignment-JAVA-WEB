package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Account;
import models.Contact;
import models.Log;
import utils.IPConfigUtil;
import dao.ContactDAO;
import dao.LogDAO;
import com.google.gson.Gson;
@WebServlet({"/superadmin/contact"})
/**
 * Servlet implementation class AccountAdminServlet
 */
public class ContactAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactAdminServlet() {
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
		} else if(action.equalsIgnoreCase("deleteContact")) {
			doGet_DeleteContact(request, response);
		} else if(action.equalsIgnoreCase("updateContact")) {
			doGet_UpdateContact(request, response);
		} else if(action.equalsIgnoreCase("getContact")) {
			doGet_GetContact(request, response);
		}  else if(action.equalsIgnoreCase("checkContact")) {
			doGet_CheckContact(request, response);
		}
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/contact.jsp");
		request.setAttribute("activeContact", "active");
		ContactDAO contactDAO = new ContactDAO();
		request.setAttribute("contacts", contactDAO.findAll());
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	
	protected void doGet_DeleteContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ContactDAO contactDAO = new ContactDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		int beforeDeleteContact = contactDAO.findAll().size();
		LogDAO logDAO = new LogDAO();
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin");
		int afterDeleteContact = 0;
		if(contactDAO.delete(id)) {
			afterDeleteContact = contactDAO.findAll().size();
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "warning","AdminId: " + accountAdmin.getId() + " đã xóa liên hệ có id là: " + id + " ra khỏi hệ thống",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Số liên hệ trước khi xóa: " + beforeDeleteContact, "Số liên hệ sau khi xóa: " + afterDeleteContact));
			request.getSession().setAttribute("msg", "Đã xóa thành công");
			response.sendRedirect(request.getContextPath() + "/superadmin/contact");
		} else {
			request.getSession().setAttribute("msg", "Thất bại");
			response.sendRedirect(request.getContextPath() + "/superadmin/contact");
		}
	}
	
	protected void doGet_UpdateContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ContactDAO contactDAO = new ContactDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		LogDAO logDAO = new LogDAO();
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin");
		Contact contact = contactDAO.findById(id);
		contact.setStatus(true);
		if(contactDAO.update(contact)) {
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "alert","AdminId: " + accountAdmin.getId() + " đã giải quyết vấn đề " + contact.getDescription(),new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), null, null));
			request.getSession().setAttribute("msg", "Đã giải quyết!");
			response.sendRedirect(request.getContextPath() + "/superadmin/contact");
		} else {
			request.getSession().setAttribute("msg", "Thất bại");
			response.sendRedirect(request.getContextPath() + "/superadmin/contact");
		}
	}
	protected void doGet_GetContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter printWriter = response.getWriter();
		Gson gson = new Gson();
		ContactDAO contactDAO = new ContactDAO();
		printWriter.print(gson.toJson(contactDAO.findTop3()));
	}
	protected void doGet_CheckContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		String number = request.getParameter("oldContact");
		int oldContact = Integer.parseInt(number);
		PrintWriter printWriter = response.getWriter();
		ContactDAO contactDAO = new ContactDAO();
		int newContact = contactDAO.findAll().size();
		if(request.getParameter("test") != null) {
			request.getSession().removeAttribute("contacts");
			request.getSession().setAttribute("contacts", contactDAO.findAll().size());
		}
		printWriter.print(newContact);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
