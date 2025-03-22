package controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.Account;
import persistence.Notification;
import persistence.Recipient;
import services.NotificationServiceImp;
import services.RecipientServiceImp;

@WebServlet("/user-notification")
public class UserNotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserNotificationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Account account = (Account) request.getSession().getAttribute("account");
		List<Recipient> allRecipients = new RecipientServiceImp().getAllRecipients();
		
		List<Notification> yourNotis = allRecipients.stream()
										            .filter(rec -> rec.for_All_Users() || account.getUsername().equals(rec.getUsername()))
										            .map(rec -> new NotificationServiceImp().getNotificationById(rec.getId_notification()).get())
										            .collect(Collectors.toList());
		
		request.setAttribute("yourNotis", yourNotis);
		request.getRequestDispatcher("u-notification.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
