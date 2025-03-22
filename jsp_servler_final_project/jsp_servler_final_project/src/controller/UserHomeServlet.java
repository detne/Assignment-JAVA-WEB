package controller;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
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
import persistence.Recipient;
import services.DocumentServiceImp;
import services.RecipientServiceImp;

@WebServlet("/userhome")
public class UserHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserHomeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.getSession().removeAttribute("fUPLOAD");
        request.getSession().removeAttribute("sUPLOAD");
        Account account = (Account) request.getSession().getAttribute("account");
		List<Document> documents = new DocumentServiceImp().getAllDocuments();
		List<Document> publishedDocuments = documents.stream()
													 .filter(doc -> Status.APPROVE.getStatus().equalsIgnoreCase(doc.getStatus()))
													 .sorted(Comparator.comparing(doc -> doc.getDatePublished(), Collections.reverseOrder()))
													 .collect(Collectors.toList());
		List<Recipient> recipients = new RecipientServiceImp().getAllRecipients();
		List<Recipient> personalRecipients = recipients.stream()
													   .filter(rec -> account.getUsername().equals(rec.getUsername()))
													   .filter(rec -> !rec.for_All_Users()==true)
													   .collect(Collectors.toList());
		request.setAttribute("publishedDocuments", publishedDocuments); 
		request.setAttribute("personalRecipients", personalRecipients); 
		request.getRequestDispatcher("u-index.jsp").forward(request, response);
	}
}
