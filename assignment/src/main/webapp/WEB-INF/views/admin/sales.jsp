<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="models.Sale"%>
<%@page import="dao.SaleDAO"%>
<%@ page import="dao.SaleDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    SaleDAO saleDAO = new SaleDAO();
%>
<div class="content-wrapper">
    <!-- Tiêu đề nội dung -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1>Danh sách doanh thu</h1>
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
                        <script>
                            $(document).ready(function() {
                                $('#name').keyup(function() {
                                    var name = $(this).val();
                                    console.log(name);
                                    $.ajax({
                                        type: 'GET',
                                        dataType: 'json',
                                        contentType: 'application/json; charset=utf-8',
                                        url: '<%= request.getContextPath() %>/superadmin/sale',
                                        data: {
                                            action: "searchByName",
                                            name: name
                                        },
                                        success: function(sales) {
                                            var s = '';
                                            for (var i = 0; i < sales.length; i++) {
                                                s += '<tr>';
                                                s += '<td>' + sales[i].id + '</td>';
                                                s += '<td>' + sales[i].name + '</td>';
                                                s += '<td>' + sales[i].saleNumber + '</td>';
                                                s += '<td>' + (sales[i].status ? "1" : "0") + '</td>';
                                                s += '<td><a onclick="return confirm(\'Bạn có chắc muốn xóa doanh thu này ra khỏi danh sách?\')" href="<%= request.getContextPath() %>/superadmin/sale?action=deleteSale&id=' + sales[i].id + '"><i class="fa-solid fa-trash"></i></a></td>';
                                                s += '</tr>';
                                            }
                                            $('#example2 tbody').html(s);
                                        }
                                    });
                                });
                            });
                        </script>
                
                        <!-- /.card-header -->
                        <div class="card-body">
                            <script>
                                $(document).ready(function() {
                                    $('#buttonReload').click(function() {
                                        location.reload();
                                    });
                                });
                            </script>

                            <%
                                HttpSession session2 = request.getSession();
                                String msg = (String) session.getAttribute("msg");
                                if (msg != null) {
                                    session.removeAttribute("msg");
                            %>
                                    <script>
                                        alert('<%= msg %>');
                                    </script>
                            <%
                                }
                            %>
                            
                            <button id="buttonReload" class="btn"><i class="fa-solid fa-rotate"></i></button>
                            <table style="text-align: center;" id="example2" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Tên
                                        <br>
                                        	<input type="text" name="name" id="name" placeholder="Tìm kiếm tên">
                                        </th>
                                        <th>Số doanh thu</th>
                                        <th>Trạng thái</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Sale sale : saleDAO.findAll()) { %>
                                        <tr>
                                            <td><%= sale.getId() %></td>
                                            <td><%= sale.getName() %></td>
                                            <td><%= sale.getSaleNumber() %></td>
                                            <td><%= sale.isStatus() ? "1" : "0" %></td>
                                            <td>
                                                <a onclick="return confirm('Bạn có chắc muốn xóa doanh thu này ra khỏi hệ thống?')" href="<%= request.getContextPath() %>/superadmin/sale?action=deleteSale&id=<%= sale.getId() %>">
                                                    <i class="fa-solid fa-trash"></i>
                                                </a>
                                            </td>
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
