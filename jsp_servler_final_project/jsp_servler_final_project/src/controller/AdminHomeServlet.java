package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constant.Role;
import constant.Status;
import persistence.Account;
import persistence.Document;
import services.AccountServiceImp;
import services.CategoryServiceImp;
import services.CourseServiceImp;
import services.DocumentServiceImp;
import services.MajorServiceImp;

@WebServlet("/admin-home")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminHomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Integer> dataIndex = new ArrayList<>(); 
		List<Document> allDocuments = new DocumentServiceImp().getAllDocuments().stream()
																				.filter(doc -> !Status.DECLINE.getStatus().equalsIgnoreCase(doc.getStatus()))
																				.collect(Collectors.toList());
		List<Account> allAccounts = new AccountServiceImp().getAllAccounts();
		List<Account> modAccounts = allAccounts.stream()
											   .filter(acc -> Role.MODERATOR.getRole().equalsIgnoreCase(acc.getRole()))
											   .collect(Collectors.toList());
		List<Document> publishedDocuments = allDocuments.stream()
														.filter(doc -> Status.APPROVE.getStatus().equalsIgnoreCase(doc.getStatus()))
														.collect(Collectors.toList());
		List<Document> pendingDocuments = allDocuments.stream()
													  .filter(doc -> Status.PENDING.getStatus().equalsIgnoreCase(doc.getStatus()))
													  .collect(Collectors.toList());
		dataIndex.add(new MajorServiceImp().getAllMajors().size());
		dataIndex.add(new CourseServiceImp().getAllCourses().size());
		dataIndex.add(new CategoryServiceImp().getAllCategories().size());
		dataIndex.add(allDocuments.size());
		dataIndex.add(allAccounts.size()-1);
		dataIndex.add(modAccounts.size());
		dataIndex.add(publishedDocuments.size());
		dataIndex.add(pendingDocuments.size());
		request.getSession().setAttribute("dataIndex", dataIndex);
		request.getRequestDispatcher("a-index.jsp").forward(request, response);
	}
}
