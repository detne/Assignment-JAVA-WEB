package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PostDAO;

@WebServlet("/language")
/**
 * Servlet implementation class LanguageServlet
 */
public class LanguageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LanguageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String referer = request.getHeader("referer");
		if(action == null) {
			PostDAO postDAO = new PostDAO();
			request.setAttribute("posts", postDAO.findTopSix());
			request.setAttribute("p", "../user/home.jsp");
			request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
		} else {
			if(action.equals("vi")) {
				PostDAO postDAO = new PostDAO();
				request.setAttribute("posts", postDAO.findTopSix());
				request.getSession().setAttribute("language", "vi");
				/*
				 * request.setAttribute("p", "../user/home.jsp");
				 * request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(
				 * request, response);
				 */
				response.sendRedirect(referer);
			} else if(action.equals("en")){
				PostDAO postDAO = new PostDAO();
				request.setAttribute("posts", postDAO.findTopSix());
				request.getSession().setAttribute("language", "en");
				response.sendRedirect(referer);
				/*
				 * request.setAttribute("p", "../user/home.jsp");
				 * request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(
				 * request, response);
				 */
				
			}
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
