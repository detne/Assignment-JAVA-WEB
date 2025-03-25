<%@page import="java.net.http.HttpRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		HttpSession session2 = request.getSession();
		String content = (String) session2.getAttribute("content");
		String content1 = content;
		session.removeAttribute("content");
		
	%>
	<c:if test="<%= content1 == null %>">

		<h3>Chúng tôi đã gửi 1 email chứa liên kết xác thực tài khoản của
			bạn, hãy kiểm tra email và nhấp vào đường link liên kết để xác thực
			tài khoản!</h3>
		<br>
		<a href="https://mail.google.com/mail/u/1/#inbox">Đến email</a>
	</c:if>
	
	<c:if test="<%= content1 != null %>">

		<h3><%= content1 %></h3>
		<a href="${pageContext.request.contextPath }/login">Quay trở lại</a>
	</c:if>
	
	

</body>
</html>