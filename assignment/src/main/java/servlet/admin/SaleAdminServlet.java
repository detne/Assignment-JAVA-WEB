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
import models.Sale;
import utils.IPConfigUtil;
import dao.LogDAO;
import dao.SaleDAO;
import com.google.gson.Gson;
@WebServlet({"/superadmin/sale"})
/**
 * Servlet implementation class AccountAdminServlet
 */
public class SaleAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleAdminServlet() {
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
		} else if(action.equalsIgnoreCase("deleteSale")) {
			doGet_DeleteSale(request, response);
		}
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/sales.jsp");
		request.setAttribute("activeAccount", "active");
		SaleDAO saleDAO = new SaleDAO();
		request.setAttribute("sale", saleDAO.findAll());
		
		

		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	
	protected void doGet_SearchByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		String name = request.getParameter("name");
		SaleDAO saleDAO = new SaleDAO();
		Gson gson = new Gson();
		writer.print(gson.toJson(saleDAO.findSaleByName(name)));
	}
	
	protected void doGet_DeleteSale(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SaleDAO saleDAO = new SaleDAO();
		int beforeDeleteSale = saleDAO.findAll().size();
		LogDAO logDAO = new LogDAO();
		Account accountAdmin = (Account) request.getSession().getAttribute("accountAdmin");
		int afterDeleteSale = 0;
		int id = Integer.parseInt(request.getParameter("id"));
		Sale sale = saleDAO.findSaleById(id);
		sale.setStatus(false);
		if(saleDAO.update(sale)) {
			afterDeleteSale = saleDAO.findAll().size();
			logDAO.create(new Log(IPConfigUtil.clientPublicIP, "danger","AdminId: " + accountAdmin.getId() + " đã xóa lịch sử mua gói dịch có id là: " + id + " ra khỏi hệ thống",new IPConfigUtil().ipconfig(request).getCountryLong(), new java.util.Date(), "Số lượng lịch sử mua gói dịch vụ trước khi xóa: " + beforeDeleteSale, "Số lượng lịch sử mua gói dịch vụ sau khi xóa: " + afterDeleteSale));
			request.getSession().setAttribute("msg", "Đã xóa doanh thu thành công");
			response.sendRedirect(request.getContextPath() + "/superadmin/sale");
			
		} else {
			System.out.println(1);
			response.sendRedirect(request.getContextPath() + "/superadmin/sale");
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
