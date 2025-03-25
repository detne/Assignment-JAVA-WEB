package servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Post;
import dao.AccountDAO;
import dao.AccountDetailsDAO;
import dao.PostDAO;
import dao.PostImageDAO;

@WebServlet("/userapartmentdetails")
/**
 * Servlet implementation class HomeServlet
 */
public class UserApartmentDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserApartmentDetailsServlet() {
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
		PostDAO postDAO = new PostDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		Post post = postDAO.findPostByID(id);
		AccountDAO accountDAO = new AccountDAO();
		AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
		PostImageDAO postImageDAO = new PostImageDAO();
		
		request.setAttribute("post", post);
		request.setAttribute("images", postImageDAO.findPostImageByPostID(post.getId()));
		request.setAttribute("account", accountDetailsDAO.findAccountByAccountID(post.getAccountid()));
		request.setAttribute("account1", accountDAO.findAccountByAccountID(post.getAccountid()));
		request.setAttribute("p", "../user/userapartmentdetails.jsp");
		request.getRequestDispatcher("/WEB-INF/views/layout/user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
