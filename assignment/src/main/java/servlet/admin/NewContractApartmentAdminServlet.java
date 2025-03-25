package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Contract;
import dao.ContractDAO;
import dao.SystemApartmentDAO;
import com.google.gson.Gson;
@WebServlet({"/admin/newcontract"})
/**
 * Servlet implementation class AccountAdminServlet
 */
public class NewContractApartmentAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewContractApartmentAdminServlet() {
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
		} else if(action.equalsIgnoreCase("checkExists")) {
			doGet_CheckExists(request, response);
		}
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/newcontract.jsp");
		request.setAttribute("activeContract", "active");
		request.setAttribute("activeContractOpen", "menu-open");
		request.setAttribute("activeNewContract", "active");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	protected void doGet_CheckExists(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter printWriter = response.getWriter();
		Gson gson = new Gson();
		ContractDAO contractDAO = new ContractDAO();
		
		printWriter.print(gson.toJson(contractDAO.checkExists(contractDAO.findAll(), Integer.parseInt(request.getParameter("branchID")), Integer.parseInt(request.getParameter("floorID")), Integer.parseInt(request.getParameter("roomID")))));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action == null) {
			doPost_NewContract(request, response);
		}
	}
	
	protected void doPost_NewContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SystemApartmentDAO systemApartmentDAO = new SystemApartmentDAO();
		ContractDAO contractDAO = new ContractDAO();
		String owner = request.getParameter("owner");
		int ownerId = Integer.parseInt(owner.substring(0,1));
		int branchid = Integer.parseInt(request.getParameter("branch"));
		int floorid = Integer.parseInt(request.getParameter("floor"));
		int roomid = Integer.parseInt(request.getParameter("room"));
		String description = request.getParameter("description");
		String created = request.getParameter("created");
		int systemapartmentid = systemApartmentDAO.findSystemApartmentByRoomAndBranch(branchid, floorid, roomid).getId();
		Contract contract = new Contract();
		contract.setOwnerid(ownerId);
		contract.setSystemapartmentid(systemapartmentid);
		contract.setStatus(true);
		contract.setCreated(new Date(created));
		contract.setDescription(new String(description.getBytes("ISO-8859-1"), "UTF-8")
);
		if(contractDAO.create(contract)) {
			System.out.println("Success");
			response.sendRedirect(request.getContextPath() + "/admin/newcontract");
		} else {
			System.out.println("Failed");
			response.sendRedirect(request.getContextPath() + "/admin/newcontract");
		}
	}

}
