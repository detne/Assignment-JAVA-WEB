<%@page import="dao.AccountDAO"%>
<%@ page import="dao.AccountDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		AccountDAO accountDAO = new AccountDAO();
		
	%>
	
	<%= accountDAO.findAll() %>
</body>
</html>