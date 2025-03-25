<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="models.Duration"%>
<%@page import="dao.DurationDAO"%>
<%@ page import="dao.DurationDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    DurationDAO durationDAO = new DurationDAO();
%>
<div class="content-wrapper">
    <!-- Tiêu đề nội dung -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1>Danh sách thời hạn</h1>
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
                                    $('#changeStatus').change(function() {
            							var value = $(this).val();
            							$.ajax({
            								type: 'GET',
            								dataType: 'json',
            								contentType: 'application/json; charset=utf-8',
            								url: '${pageContext.request.contextPath}/superadmin/duration',
            								data: {
            									action: "searchByStatus",
            									value: value
            								},
            								success: function(durations) {
            									var s ='';						
            									for(var i = 0;i < accounts.length; i++) {
            										s+='<tr>';
            										s+='<td>' + durations[i].id + '</td>';
            										s+='<td>' + durations[i].name + '</td>';
            										s+='<td>';
            										if(durations[i].status == true) {
            											s+='1';
            										} else if(durations[i].status == false) {
            											s+='0';
            										}
            										s+='</td>';
            										s+='<td>'
            										s+= '<a onclick="return confirm('Bạn có chắc muốn xóa thời hạn này ra khỏi hệ thống?')" href="<%= request.getContextPath() %>/superadmin/duration?action=deleteDuration&id=' + durations[i].id + '"><i class="fa-solid fa-trash"></i></a>';
            										s+='</td>';
            										s+='</tr>';					
            									}
            									$('#example2 tbody').html(s);
            								}
            							});
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
                            <a href="${pageContext.request.contextPath }/superadmin/duration?action=newDuration">Tạo thời hạn mới</a>
                            <table style="text-align: center;" id="example2" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Thời hạn</th>
                                        <th>Trạng thái
                                        <!-- <br>
                                            <select style="margin-top: 10px;" id="changeStatus">
                                                <option value="0">Chọn trạng thái</option>
                                                <option value="1">1</option>
                                                <option value="2">0</option>
                                            </select> -->
                                        </th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Duration duration : durationDAO.findAll()) { %>
                                        <tr>
                                            <td><%= duration.getName() %></td>
                                            <td><%= duration.isStatus() ? "1" : "0" %></td>
                                            <td>
                                                <a onclick="return confirm('Bạn có chắc muốn xóa thời hạn này ra khỏi hệ thống?')" href="<%= request.getContextPath() %>/superadmin/duration?action=deleteDuration&id=<%= duration.getId() %>">
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
