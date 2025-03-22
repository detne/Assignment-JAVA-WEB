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
import persistence.Account;
import persistence.Document;
import services.DocumentServiceImp;

@WebServlet("/personaldocuments")
public class UserPersonalDocumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserPersonalDocumentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("fUPLOAD");
        request.getSession().removeAttribute("sUPLOAD");
		List<Document> documents = new DocumentServiceImp().getAllDocuments();
		Account account = (Account) request.getSession().getAttribute("account");
		List<Document> personalDocuments = documents.stream()
													 .filter(doc -> Status.APPROVE.getStatus().equalsIgnoreCase(doc.getStatus()))
													 .filter(doc -> doc.getUsername().equals(account.getUsername()))
													 .collect(Collectors.toList());
		request.setAttribute("personalDocuments", personalDocuments);
		request.getRequestDispatcher("u-personal-document.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
