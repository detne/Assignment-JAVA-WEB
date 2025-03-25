package servlet.user;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Contact;
import models.Log;
import utils.IPConfigUtil;
import dao.ContactDAO;
import dao.LogDAO;
import service.IPAddressUtil;

@WebServlet("/contact")
/**
 * Servlet implementation class HomeServlet
 */
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContactServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			doGet_Index(request, response);
		}
	}

	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("activeContact", "active");
		request.setAttribute("p", "../user/contact.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("contact")) {
			doPost_Contact(request, response);
		}
	}

	protected void doPost_Contact(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		LogDAO logDAO = new LogDAO();
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String description = request.getParameter("message");
		ContactDAO contactDAO = new ContactDAO();
		Contact contact = new Contact();
		contact.setSubject(new String(subject.getBytes("ISO-8859-1"), "UTF-8"));
		contact.setDescription(new String(description.getBytes("ISO-8859-1"), "UTF-8"));
		contact.setName(new String(name.getBytes("ISO-8859-1"), "UTF-8"));
		contact.setPhone(phoneNumber);
		contact.setEmail(email);
		contact.setStatus(false);
		contact.setCreated(new Date());
	
		if (contactDAO.create(contact)) {
			logDAO.create(new Log(IPAddressUtil.getPublicIPAddress(), "alert",email +  " - liên hệ", IPConfigUtil.ipconfig(request).getCountryLong(), new Timestamp(new Date().getTime()), null, null));
			request.getSession().setAttribute("success",
					"Cảm ơn đã đóng góp ý kiến cho hệ thống.Kính chúc quý khách một ngày tốt lành");
			response.sendRedirect("contact#contact-form");
		} else {
			request.getSession().setAttribute("success", "Gửi liên hệ không thành công");
			response.sendRedirect("contact#contact-form");
		}

	}

}
