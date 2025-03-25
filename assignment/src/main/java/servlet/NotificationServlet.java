package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FeedbackDAO;

/**
 * Servlet implementation class NotificationSerlet
 */
@WebServlet("/notification")
public class NotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		PrintWriter writer = response.getWriter();
		String oldFeedback = request.getParameter("oldFeedback");
		int oldFeedback1 = Integer.parseInt(oldFeedback);
		FeedbackDAO feedbackDAO = new FeedbackDAO();
		int newFeedback = feedbackDAO.findAll().size();
		if(request.getParameter("test") != null) {
			request.getSession().removeAttribute("feedbacks");
			request.getSession().setAttribute("feedbacks", feedbackDAO.findAll().size());
		}
		writer.print(newFeedback);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
