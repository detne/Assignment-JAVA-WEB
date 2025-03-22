package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.Major;
import services.MajorServiceImp;

@WebServlet("/addnewmajor")
public class AdminAddMajorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminAddMajorServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Major> majors = new MajorServiceImp().getAllMajors();
		request.setAttribute("majors", majors);
		request.getRequestDispatcher("a-add-major.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
