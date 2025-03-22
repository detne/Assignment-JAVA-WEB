package controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.Status;
import persistence.Document;
import services.DocumentServiceImp;

@WebServlet("/admin-pending")
public class AdminPendingDocumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminPendingDocumentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Document> pendingDocuments = new DocumentServiceImp().getAllDocuments().stream()
				.filter(doc -> Status.PENDING.getStatus().equalsIgnoreCase(doc.getStatus()))
				.collect(Collectors.toList());
		request.setAttribute("pendingDocuments", pendingDocuments);
		request.getRequestDispatcher("a-pending-document.jsp").forward(request, response);;
	}
}
