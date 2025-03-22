package utils;

import javax.servlet.http.Part;

public class FileUtils {

	private FileUtils() {
	}

	public static String getSubmittedFileName(Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				String[] segments = content.split("=");
				return segments[1].trim().replaceAll("\"", "");
			}
		}
		return null;
	}
	
	public static void main(String[] args) {
		String s = "converted.docx";
		System.out.println(s.substring(0,s.lastIndexOf(".")));
	}
	

}
