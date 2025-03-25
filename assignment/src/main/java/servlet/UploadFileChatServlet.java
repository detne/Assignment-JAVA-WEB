package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadFileChat")
public class UploadFileChatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UploadFileChatServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        System.out.println("aaaaaazz");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý yêu cầu POST để tải file lên server
        Part filePart = request.getPart("file");
        
        // Lấy tên file
        String fileName = extractFileName(filePart);
        
        // Lưu file vào thư mục trên server
        String savePath = "C:/uploads"; // Đường dẫn thư mục lưu trữ file trên server
        filePart.write(savePath + "/" + fileName);
        
        // Phản hồi về client
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("File " + fileName + " uploaded successfully.");
    }
    
    // Phương thức hỗ trợ để lấy tên file từ Part
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length()-1);
            }
        }
        return "";
    }
}
