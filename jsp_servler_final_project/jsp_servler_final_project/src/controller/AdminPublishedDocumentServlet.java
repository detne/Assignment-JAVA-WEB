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

@WebServlet("/admin-published")
public class AdminPublishedDocumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminPublishedDocumentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Document> publishedDocuments = new DocumentServiceImp().getAllDocuments().stream()
																	.filter(doc -> Status.APPROVE.getStatus().equalsIgnoreCase(doc.getStatus()))
																	.collect(Collectors.toList());
		request.setAttribute("publishedDocuments", publishedDocuments);
		request.getRequestDispatcher("a-published-document.jsp").forward(request, response);
	}
}
