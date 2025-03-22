package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.Account;
import persistence.Notification;
import persistence.Recipient;
import services.AccountServiceImp;
import services.NotificationServiceImp;
import services.RecipientServiceImp;

@WebServlet("/admin-notification")
public class AdminNotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminNotificationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Account> accounts = new AccountServiceImp().getAllAccounts();
		request.setAttribute("accounts", accounts);
		request.getRequestDispatcher("a-notification.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subject = request.getParameter("subject").toLowerCase();
		String message = request.getParameter("message");
		String sendAll = request.getParameter("sendAll");
		String[] selectedUsers = request.getParameterValues("selectedUsers");
		Notification notification = new Notification(null, subject, message, LocalDateTime.now());
		new NotificationServiceImp().saveNotification(notification);
		Notification lastestNoti = new NotificationServiceImp().getLastestNotification();
		if(sendAll != null) {
			new RecipientServiceImp().saveRecipient(new Recipient(null, lastestNoti.getId_notification(), null, null, true));
			request.getSession().setAttribute("sNOTI", "Notification sent successfully.");
			request.getSession().removeAttribute("fNOTI");
		} else {
			if (selectedUsers != null) {
				for (String username : selectedUsers) {
					new RecipientServiceImp().saveRecipient(new Recipient(null, lastestNoti.getId_notification(), username, null, false));
				}
				request.getSession().setAttribute("sNOTI", "Notification sent successfully.");
				request.getSession().removeAttribute("fNOTI");
			} else {
				request.getSession().setAttribute("fNOTI", "Oops, please choose at least one recipient!");
				request.getSession().removeAttribute("sNOTI");
			}
		}
		 response.sendRedirect(request.getContextPath() + "/admin-notification");
	}

}
