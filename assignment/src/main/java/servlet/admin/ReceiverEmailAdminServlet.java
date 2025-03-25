package servlet.admin;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Store;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MailHelper;

@WebServlet({"/superadmin/receiverEmail"})
/**
 * Servlet implementation class AccountAdminServlet
 */
public class ReceiverEmailAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceiverEmailAdminServlet() {
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
		} else if(action.equalsIgnoreCase("emailDetails")) {
			doGet_EmailDetails(request, response);
		}
	}
	protected void doGet_Index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("admin", "../admin/receiverEmail.jsp");
		request.setAttribute("activeReceiverEmail", "active");
		 
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}
	protected void doGet_EmailDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MailHelper mailHelper = new MailHelper();
		String index = request.getParameter("emailID");
		Properties properties = new Properties();
        properties.put("mail.imap.host", "imap.gmail.com");
        properties.put("mail.imap.port", "993");
        properties.put("mail.imap.starttls.enable", "true");
        properties.put("mail.imap.ssl.enable", "true");
        properties.put("mail.imap.auth", "true");

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("atun123456789cu@gmail.com", "qnwb zznk duhr ogmw");
            }
        });

        try {
            Store store = session.getStore("imap");
            store.connect();

            Folder inbox = store.getFolder("INBOX");
            inbox.open(Folder.READ_ONLY);

            // Lấy tất cả các email
            Message[] messages = inbox.getMessages();

            // Giới hạn số lượng email hiển thị
            int numberOfEmailsToShow = 10;
            int startIndex = Math.max(messages.length - numberOfEmailsToShow, 0);
            System.out.println(mailHelper.getTextFromMessage(messages[Integer.parseInt(index)]));
            request.setAttribute("messageSubject", messages[Integer.parseInt(index)].getSubject());
            request.setAttribute("messageContent", mailHelper.getTextFromMessage(messages[Integer.parseInt(index)]));
            request.setAttribute("messageFrom",  messages[Integer.parseInt(index)].getFrom()[0]);
            request.setAttribute("messageSentDate",  messages[Integer.parseInt(index)].getSentDate());
            inbox.close(false);
            store.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("admin", "../admin/emailDetails.jsp");
		request.setAttribute("activeReceiverEmail", "active");
		
		 
		request.getRequestDispatcher("/WEB-INF/views/layout/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
