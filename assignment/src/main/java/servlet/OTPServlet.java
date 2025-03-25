package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Account;
import service.MailHelper;
import service.RandomStringHelper;

/**
 * Servlet implementation class EmailServlet
 */
@WebServlet("/otp")
public class OTPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OTPServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action == null) {
			doGet_Index(request, response);
		} else if(action.equalsIgnoreCase("resendOTP")) {
			doGet_resendOTP(request, response);
		}	
	}
	
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Account account = (Account) request.getSession().getAttribute("accountEmail");
		if(account != null) {
			request.getRequestDispatcher("/WEB-INF/views/login/otp.jsp").forward(request, response);
		} else {
			response.sendRedirect("email");
		}
		
	}
	
	protected void doGet_resendOTP(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String OTP = RandomStringHelper.generateRandomString(6);
		request.getSession().setAttribute("announceOTP", "aaaa");
		request.getSession().removeAttribute("otp");
		request.getSession().setAttribute("otp", OTP);
		String content = "Xin chào, đây là email từ $Apartment! Hệ thống xin gửi bạn 1 đoạn mã OTP mới "+ OTP + " để thay đổi mật khẩu.";
		Account account = (Account) request.getSession().getAttribute("accountEmail");
		MailHelper.MailHelper(account.getEmail(), "Xác nhận mã OTP", content);
		
		response.sendRedirect("otp");
	
}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("otp")) {
			doPost_OTP(request, response);
		}
	}
	
	protected void doPost_OTP(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		String i1 = request.getParameter("i1");
		String i2 = request.getParameter("i2");
		String i3 = request.getParameter("i3");
		String i4 = request.getParameter("i4");
		String i5 = request.getParameter("i5");
		String i6 = request.getParameter("i6");
		String userOTP = i1 + i2 + i3 + i4 + i5 + i6;
		String otp = (String) request.getSession().getAttribute("otp");
		Account account = (Account) request.getSession().getAttribute("accountEmail");
		if(account != null) {
			if(userOTP.equals(otp)) {
				response.sendRedirect("changepassword");
			} else {
				request.getSession().setAttribute("msgOTP", "Mã OTP không hợp lệ!");
				response.sendRedirect("otp");
			}
		} else {
			response.sendRedirect("email");
		}
	}


}
