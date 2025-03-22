package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.Document;
import services.DocumentServiceImp;

@WebServlet("/details")
public class DocumentDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DocumentDetailsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_document = request.getParameter("id_document");
		Document document = new DocumentServiceImp().getDocumentById(id_document).get();
		String mimeType = "application/pdf";
		String base64Data = new String(java.util.Base64.getEncoder().encode(document.getFileData()));
		String dataUrl = "data:" + mimeType + ";base64," + base64Data;
		request.setAttribute("document", document);
		request.setAttribute("dataUrl", dataUrl);
		request.setAttribute("mimeType", mimeType);
		request.getRequestDispatcher("u-document-details.jsp").forward(request, response);
	}
}
