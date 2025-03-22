package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.DocumentServiceImp;

@WebServlet("/admin-review")
public class AdminReviewDocumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminReviewDocumentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_document = request.getParameter("id_document");
		String status = request.getParameter("status");
		new DocumentServiceImp().updateStatus(id_document, status);
		response.sendRedirect("admin-pending");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
