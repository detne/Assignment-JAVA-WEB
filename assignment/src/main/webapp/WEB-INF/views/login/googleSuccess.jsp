
<%@page import="models.UserGoogleDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% UserGoogleDto pojo = (UserGoogleDto) request.getAttribute("pojo") ;%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=pojo.getId() %> </h1>
	<h1> <%= pojo.getEmail() %></h1>
	<h1><%= pojo.getFamily_name() %></h1>
	<h1> <%= pojo.getName() %></h1>
	<h1> <%= pojo.isVerified_email() %></h1>
	
	
	 <h1>Index</h1>
 
</body>
</html>