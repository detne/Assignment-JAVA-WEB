package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.DocumentServiceImp;

@WebServlet("/delete-document")
public class AdminDeleteDocumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminDeleteDocumentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_document = request.getParameter("id_document");
		new DocumentServiceImp().deleteDocumentById(id_document);
		response.sendRedirect("admin-published");
	}

}
