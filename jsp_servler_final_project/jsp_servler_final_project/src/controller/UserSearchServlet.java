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
import persistence.Category;
import persistence.Course;
import persistence.Document;
import persistence.Major;
import services.CategoryServiceImp;
import services.CourseServiceImp;
import services.DocumentServiceImp;
import services.MajorServiceImp;

@WebServlet("/user-search")
public class UserSearchServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public UserSearchServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String txtSearch = request.getParameter("txtSearch");
		String major = request.getParameter("major");
		String course = request.getParameter("course");
		String category = request.getParameter("category");
		
		List<Document> publishedDocuments = new DocumentServiceImp().getAllDocuments()
												 .stream()
												 .filter(doc -> Status.APPROVE.getStatus().equalsIgnoreCase(doc.getStatus()))
												 .sorted(Comparator.comparing(doc -> doc.getDatePublished(), Collections.reverseOrder()))
												 .collect(Collectors.toList());
		List<Document> txtFilteredDocuments = txtSearch == null 
				? 	publishedDocuments.stream()
					  .filter(doc -> Status.APPROVE.getStatus().equalsIgnoreCase(doc.getStatus()))
					  .sorted(Comparator.comparing(doc -> doc.getDatePublished(), Collections.reverseOrder()))
					  .collect(Collectors.toList())
				:  new DocumentServiceImp().searchDocumentByTxt(txtSearch)
						   .stream()
						   .filter(doc -> Status.APPROVE.getStatus().equalsIgnoreCase(doc.getStatus()))
						   .sorted(Comparator.comparing(doc -> doc.getDatePublished(), Collections.reverseOrder()))
						   .collect(Collectors.toList());
		
		List<Document> filteredDocuments = txtFilteredDocuments
															.stream()
															.filter(doc -> doc.getIdCourse().equalsIgnoreCase(course) || course == null)
															.filter(doc -> doc.getIdCategory().equalsIgnoreCase(category) || category == null)
															.filter(doc -> new CourseServiceImp().getCourseById(doc.getIdCourse()).get()
																			.getId_major().equalsIgnoreCase(major) || major == null )
															.filter(doc -> Status.APPROVE.getStatus().equalsIgnoreCase(doc.getStatus()))
															.collect(Collectors.toList());
		List<Major> majors = new MajorServiceImp().getAllMajors();
		request.setAttribute("majors", majors);
		List<Course> courses = new CourseServiceImp().getAllCourses();
		request.setAttribute("courses", courses);
		List<Category> categories = new CategoryServiceImp().getAllCategories();
		request.setAttribute("categories", categories);
		request.setAttribute("filteredDocuments", filteredDocuments);
        request.setAttribute("txtSearch", txtSearch);
        request.setAttribute("major", major);
        request.setAttribute("category", category);
        request.setAttribute("course", course);
        request.setAttribute("filteredDocuments", filteredDocuments);
        request.getRequestDispatcher("u-search.jsp").forward(request, response);;
	}

}