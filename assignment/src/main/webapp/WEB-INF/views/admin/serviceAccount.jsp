<%@page import="dao.AccountServiceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="models.Service"%>
<%@page import="dao.ServiceDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="dao.AccountServiceDAO" %>
<%@ page import="dao.ServiceDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    ServiceDAO serviceDAO = new ServiceDAO();
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    AccountServiceDAO accountServiceDAO = new AccountServiceDAO();
%>
<div class="content-wrapper">
    <!-- Tiêu đề nội dung -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1>Tổng quan dịch vụ và người dùng</h1>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Nội dung chính -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <!-- /.card-header -->
                        <div class="card-body">
                            <script>
                                $(document).ready(function() {
                                    $('#buttonReload').click(function() {
                                        location.reload();
                                    });
                                });
                            </script>

                      

                            <button id="buttonReload" class="btn"><i class="fa-solid fa-rotate"></i></button>
                            <a href="${pageContext.request.contextPath }/admin/serviceAccount?action=newService">Thêm người đăng ký dịch vụ</a>
                            <table style="text-align: center;" id="example2" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Tên</th>
                                        <th>Giới thiệu</th>
                                        <th>Giá</th>
                                        <th>Mô tả</th>
                                        <th>Số bài đăng</th>
                                        <th>Ngày tạo</th>
                                        <th>Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Service service : serviceDAO.findAll()) { %>
                                        <tr>
                                            <td><%= service.getId() %></td>
                                            <td><%= service.getName() %></td>
                                            <td><%= service.getIntroduction() %></td>
                                            <td><%= service.getPrice() %></td>
                                            <td><%= service.getDescription() %></td>
                                            <td><%= service.getPostNumber() > 0 ? service.getPostNumber() : "Không giới hạn" %></td>
                                            <td><%= dateFormat.format(service.getCreated()) %></td>
                                            <td><%= accountServiceDAO.findByServiceID(service.getId()).size() %> người sử dụng |
                                             <a href="${pageContext.request.contextPath }/admin/serviceAccount?action=listAccount&serviceID=<%= service.getId() %>">Xem danh sách</a></td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>
