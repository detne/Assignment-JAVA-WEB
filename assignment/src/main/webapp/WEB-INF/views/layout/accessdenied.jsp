<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="models.Service"%>
<%@page import="dao.ServiceDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="dao.ServiceDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    ServiceDAO serviceDAO = new ServiceDAO();
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
%>
<div class="content-wrapper">
    <!-- Tiêu đề nội dung -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1>Bạn không đủ thẩm quyền vui lòng đăng nhập lại.</h1>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

   
    <!-- /.content -->
</div>
