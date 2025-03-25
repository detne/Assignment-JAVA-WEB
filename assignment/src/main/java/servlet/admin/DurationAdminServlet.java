package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Account;
import models.Duration;
import models.Log;
import utils.IPConfigUtil;
import dao.DurationDAO;
import dao.LogDAO;
import com.google.gson.Gson;
@WebServlet({"/superadmin/duration"})
/**
 * Servlet implementation class AccountAdminServlet
 */
public class DurationAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DurationAdminServlet() {
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
		}else if(action.equalsIgnoreCase("searchByStatus")) {
			doGet_SearchByStatus(request, response);
		}
			else if(action.equalsIgnoreCase("deleteDuration")) {
			doGet_DeleteDuration(request, response);
		} else if(action.equals("newDuration")){ 
			doGet_NewDuration(request, response);
		} 
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/duration.jsp");
		request.setAttribute("activeDuration", "active");
		DurationDAO durationDAO = new DurationDAO();
		request.setAttribute("duration", durationDAO.findAll());

		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	
	protected void doGet_SearchByStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		int status = Integer.parseInt(request.getParameter("value"));
		Gson gson = new Gson();
		DurationDAO durationDAO = new DurationDAO();
		if(status == 0) {
			writer.print(gson.toJson(durationDAO.findAll()));
		} else if(status == 1) {
			writer.print(gson.toJson(durationDAO.checkStatus(true)));
		} else if(status == 2) {
			writer.print(gson.toJson(durationDAO.checkStatus(false)));
		}
	}
	
	protected void doGet_UpdateDuration(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DurationDAO durationDAO = new DurationDAO();
		int beforeDeleteDuration = durationDAO.findAll().size();
		LogDAO logDAO = new LogDAO();
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin");
		int afterDeleteDuration = 0;
		int id = Integer.parseInt(request.getParameter("id"));
		Duration duration = durationDAO.findById(id);
		duration.setStatus(false);
		if(durationDAO.update(duration)) {
			afterDeleteDuration = durationDAO.findAll().size();
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "alert","AdminId: " + accountAdmin.getId() + " đã cập nhật trạng thái của gói thời hạn : " + duration.getName(),new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), null , null));
			request.getSession().setAttribute("msg", "Đã xóa thời hạn thành công");
			response.sendRedirect(request.getContextPath() + "/superadmin/duration");
			
		} else {
			System.out.println(1);
			response.sendRedirect(request.getContextPath() + "/superadmin/duration");
		}
	}
	
	protected void doGet_DeleteDuration(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DurationDAO durationDAO = new DurationDAO();
		int beforeDeleteDuration = durationDAO.findAll().size();
		LogDAO logDAO = new LogDAO();
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin");
		int afterDeleteDuration = 0;
		int id = Integer.parseInt(request.getParameter("id"));
		Duration duration = durationDAO.findById(id);
		if(durationDAO.delete(id)) {
			afterDeleteDuration = durationDAO.findAll().size();
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "warning","AdminId: " + accountAdmin.getId() + " đã xóa mốc thời gian của gói dịch vụ: " + duration.getName() + " ra khỏi hệ thống",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Số lượng mốc thời gian của gói dịch vụ trước khi xóa: " + beforeDeleteDuration, "Số lượng mốc thời gian của gói dịch vụ sau khi xóa: " + afterDeleteDuration));
			request.getSession().setAttribute("msg", "Đã xóa thời hạn thành công");
			response.sendRedirect(request.getContextPath() + "/superadmin/duration");
			
		} else {
			System.out.println(1);
			response.sendRedirect(request.getContextPath() + "/superadmin/duration");
		}
	}
	
	protected void doGet_NewDuration(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/newDuration.jsp");
		
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
		
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("newDuration")) {
			doPost_NewDuration(request, response);
		}
	}
	
	protected void doPost_NewDuration(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		
		Duration duration = new Duration();
		Calendar calendar = Calendar.getInstance();
		DurationDAO durationDAO = new DurationDAO();
		
		int beforeAddDuration = durationDAO.findAll().size();
		LogDAO logDAO = new LogDAO();
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin");
		
		duration.setName(new String(name.getBytes("ISO-8859-1"), "UTF-8"));
		duration.setStatus(true);
		int afterAddDuration = 0;
		if(durationDAO.create(duration)) {
			duration.setStatus(false);
			durationDAO.update(duration);
			afterAddDuration = durationDAO.findAll().size();
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "alert","AdminId: " + accountAdmin.getId() + " đã thêm thời hạn cho gói dịch vụ " + new String(name.getBytes("ISO-8859-1"), "UTF-8") + " vào hệ thống",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Số lượng mốc thời hạn trước khi thêm: " + beforeAddDuration, "Số lượng mốc thời hạn sau khi thêm: " + afterAddDuration));
			request.getSession().setAttribute("msg", "Đăng kí thời hạn thành công");
			response.sendRedirect(request.getContextPath() + "/superadmin/duration");
		} else {
			request.getSession().setAttribute("msg", "Đăng kí thời hạn thất bại");
			response.sendRedirect(request.getContextPath() + "/superadmin/duration");
		}
	}

}
