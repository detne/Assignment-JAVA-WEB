package servlet.admin;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import models.Owner;
import dao.OwnerDAO;
import service.UploadFileHelper;

@WebServlet({"/admin/newcontractuser"})
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 10,
        fileSizeThreshold = 1024 * 1024 * 10
)
/**
 * Servlet implementation class AccountAdminServlet
 */
public class NewContractUserApartmentAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewContractUserApartmentAdminServlet() {
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
		} 
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("admin", "../admin/newcontractuser.jsp");
		request.setAttribute("activeContract", "active");
		request.setAttribute("activeContractOpen", "menu-open");
		request.setAttribute("activeContractUser", "active");
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equals("newOwner")) {
			doPost_NewOwner(request, response);
		}
	}
	protected void doPost_NewOwner(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part file = request.getPart("file");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		String phone = request.getParameter("phone");
		String identifyNumber = request.getParameter("identifyNumber");
		String address = request.getParameter("address");
		String avatar = UploadFileHelper.uploadFile("assets/user/images",request,file);
		OwnerDAO ownerDAO = new OwnerDAO();
		Owner owner = new Owner();
		owner.setAddress(new String(address.getBytes("ISO-8859-1"), "UTF-8"));
		owner.setAvatar(avatar);
		try {
			owner.setBirthday(dateFormat.parse(birthday));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		owner.setName(new String(name.getBytes("ISO-8859-1"), "UTF-8"));
		owner.setCreated(new Date());
		owner.setPhone(phone);
		owner.setIdentifynumber(identifyNumber);
		if(ownerDAO.newOwner(owner)) {
			request.getSession().setAttribute("msg","Đã thêm chủ sở hữu thành công");
			response.sendRedirect(request.getContextPath() + "/admin/owners");
		} else {
			request.getSession().setAttribute("msg","Đã thêm chủ sở hữu thất bại");
			response.sendRedirect(request.getContextPath() + "/admin/owners");
		}
		 
	}
}
