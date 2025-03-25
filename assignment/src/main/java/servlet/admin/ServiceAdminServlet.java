package servlet.admin;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Account;
import models.Log;
import models.Service;
import utils.IPConfigUtil;
import dao.LogDAO;
import dao.ServiceDAO;

@WebServlet({"/superadmin/service"})
/**
 * Servlet implementation class AccountAdminServlet
 */
public class ServiceAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceAdminServlet() {
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
		} else if(action.equalsIgnoreCase("deleteService")) {
			doGet_DeleteService(request, response);
		} else if(action.equals("addService")){ 
			doGet_AddService(request, response);
		} 
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/service.jsp");
		request.setAttribute("activeAccount", "active");
		ServiceDAO serviceDAO = new ServiceDAO();
		request.setAttribute("service", serviceDAO.findAll());
		

		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	
	protected void doGet_DeleteService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServiceDAO serviceDAO = new ServiceDAO();
		int beforeDeleteService = serviceDAO.findAll().size();
		LogDAO logDAO = new LogDAO();
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin");
		int afterDeleteService = 0;
		int id = Integer.parseInt(request.getParameter("id"));
		Service service = serviceDAO.findByID(id);
		service.setStatus(false);
		if(serviceDAO.update(service)) {
			afterDeleteService = serviceDAO.findAll().size();
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "warning","AdminId: " + accountAdmin.getId() + " đã xóa gói dịch vụ có id là: " + id + " ra khỏi hệ thống",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Số gói dịch vụ trước khi xóa: " + beforeDeleteService, "Số gói dịch vụ sau khi xóa: " + afterDeleteService));
			request.getSession().setAttribute("msg", "Đã xóa dịch vụ thành công");
			response.sendRedirect(request.getContextPath() + "/superadmin/service");
			
		} else {
			System.out.println(1);
			response.sendRedirect(request.getContextPath() + "/superadmin/service");
		}
	}
	
	protected void doGet_AddService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/addService.jsp");
		
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
		
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("addService")) {
			doPost_AddService(request, response);
		}
	}
	
	protected void doPost_AddService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String introduction = request.getParameter("introduction");
		int price = Integer.parseInt(request.getParameter("price"));
		String description = request.getParameter("description");
		int postNumber = Integer.parseInt(request.getParameter("postNumber"));
		
		Service service = new Service();
		Calendar calendar = Calendar.getInstance();
		ServiceDAO serviceDAO = new ServiceDAO();
		int beforeAddService = serviceDAO.findAll().size();
		LogDAO logDAO = new LogDAO();
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin");
		
		service.setName(new String(name.getBytes("ISO-8859-1"), "UTF-8"));
		service.setIntroduction(new String(introduction.getBytes("ISO-8859-1"), "UTF-8"));
		service.setPrice(price);
		service.setDescription(new String(description.getBytes("ISO-8859-1"), "UTF-8"));
		service.setPostNumber(postNumber);
		service.setStatus(true);
		service.setCreated(new Date());
		int afterAddService = 0;
		if(serviceDAO.create(service)) {
			afterAddService = serviceDAO.findAll().size();
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "alert","AdminId: " + accountAdmin.getId() + " đã thêm gói dịch vụ " + new String(name.getBytes("ISO-8859-1"), "UTF-8") + " vào hệ thống",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Số gói dịch vụ trước khi thêm: " + beforeAddService, "Số gói dịch vụ sau khi xóa: " + afterAddService));
			service.setStatus(false);
			serviceDAO.update(service);
			request.getSession().setAttribute("msg", "Đăng kí gói dịch vụ thành công");
			response.sendRedirect(request.getContextPath() + "/superadmin/service");
		} else {
			request.getSession().setAttribute("msg", "Đăng kí gói dịch vụ thất bại");
			response.sendRedirect(request.getContextPath() + "/superadmin/service");
		}
	}

}
