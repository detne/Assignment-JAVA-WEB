package controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.poi.xwpf.usermodel.XWPFDocument;

import com.lowagie.text.DocumentException;

import constant.Status;
import fr.opensagres.poi.xwpf.converter.pdf.PdfConverter;
import fr.opensagres.poi.xwpf.converter.pdf.PdfOptions;
import persistence.Account;
import persistence.Category;
import persistence.Course;
import persistence.Document;
import persistence.Major;
import services.CategoryServiceImp;
import services.CourseServiceImp;
import services.DocumentServiceImp;
import services.MajorServiceImp;
import utils.FileUtils;

@MultipartConfig
@WebServlet("/upload")
public class UserUploadDocumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final long MAX_SIZE = 8 * 1024 * 1024;

	public UserUploadDocumentServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Major> majors = new MajorServiceImp().getAllMajors();
		request.setAttribute("majors", majors);
		List<Course> courses = new CourseServiceImp().getAllCourses();
		request.setAttribute("courses", courses);
		List<Category> categories = new CategoryServiceImp().getAllCategories();
		request.setAttribute("categories", categories);
		request.getRequestDispatcher("u-upload-document.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		    try {
		        String title = request.getParameter("title");
		        String course = request.getParameter("course");
		        String category = request.getParameter("category");
		        String description = request.getParameter("description");
		        Account account = (Account) request.getSession().getAttribute("account");
		        System.out.println("account --> " + account);
		        Part filePart = request.getPart("file");

		        if (filePart.getSize() <= MAX_SIZE) {
		            InputStream is = filePart.getInputStream();
		            String fileName = FileUtils.getSubmittedFileName(filePart);
		            String extension = fileName.substring(fileName.lastIndexOf(".")+1);
		            System.out.println( "extension --> " + extension);
		            byte[] pdfData = null;
		            
		            if("pdf".equalsIgnoreCase(extension)){
		            	pdfData = readPDFContent(is);
		            } else if("doc".equalsIgnoreCase(extension) || "docx".equalsIgnoreCase(extension))  {
		            	pdfData = convertWordToPDF(is);
		            } else {
		            	request.getSession().setAttribute("fUPLOAD", "Oops " + fileName + ": The uploaded document has no valid extension");
			            response.sendRedirect(request.getContextPath() + "/upload");
		            }

		            Document document = new Document.Builder()
		                .setDatePublished(LocalDateTime.now())
		                .setDescription(description)
		                .setFileData(pdfData)
		                .setFileName(fileName)
		                .setIdCategory(category)
		                .setIdCourse(course)
		                .setStatus(Status.PENDING.getStatus())
		                .setTitle(title)
		                .setUsername(account.getUsername())
		                .build();

		            new DocumentServiceImp().saveDocument(document);
		            request.getSession().removeAttribute("fUPLOAD");
		            request.getSession().setAttribute("sUPLOAD", "Document uploaded successfully. It is currently pending review.");
		            response.sendRedirect(request.getContextPath() + "/upload");

		            response.setContentType("application/pdf");
		            response.setHeader("Content-Disposition", "attachment; filename=" + fileName.substring(0, fileName.lastIndexOf(".")) + ".pdf");

		            try (OutputStream os = response.getOutputStream()) {
		                os.write(pdfData);
		            }
		        } else {
		            request.getSession().removeAttribute("sUPLOAD");
		            request.getSession().setAttribute("fUPLOAD", "Oops, your document must be less than " + MAX_SIZE/1024/1024 + "MB. Document upload failed.");
		            response.sendRedirect(request.getContextPath() + "/upload");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}

	
	private byte[] convertWordToPDF(InputStream docxInputStream) throws IOException, DocumentException {
	    ByteArrayOutputStream pdfOutputStream = new ByteArrayOutputStream();
	    PdfOptions options = PdfOptions.create();
	    try (XWPFDocument document = new XWPFDocument(docxInputStream)) {
	        PdfConverter.getInstance().convert(document, pdfOutputStream, options);
	    }
	    return pdfOutputStream.toByteArray();
	}
	
	public static byte[] readPDFContent(InputStream stream) throws IOException
	{
	    byte[] buffer = new byte[8192];
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();

	    int bytesRead;
	    while ((bytesRead = stream.read(buffer)) != -1)
	    {
	        baos.write(buffer, 0, bytesRead);
	    }
	    return baos.toByteArray();
	}
}