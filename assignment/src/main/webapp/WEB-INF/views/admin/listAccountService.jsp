<%@page import="models.AccountService"%>
<%@page import="dao.AccountServiceDAO"%>
<%@ page import="dao.AccountDetailsDAO" %>
<%@ page import="dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%
 	String serviceID = request.getParameter("serviceID");
    dao.AccountServiceDAO accountServiceDAO = new AccountServiceDAO();
    AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
    AccountDAO accountDAO = new AccountDAO();
    ServiceDAO serviceDAO = new ServiceDAO();
 %>
 
 <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-12">
              <h1>Danh sách tài khoản sử dụng dịch vụ</h1>
            </div>
            
          </div>
        </div><!-- /.container-fluid -->
      </section>
			
      <!-- Main content -->
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
									 $('#editService').click(function() {
										 var row = $(this).closest('tr');
										 var name = row.find('td:eq(0)').text();
							             var age = row.find('td:eq(1)').text();
										 $("#serviceDialog").dialog();
										 $('#serviceDialog').css('display', 'block');
									});
									
								});
							
							
							</script>

						<!-- /.card-header -->
						
								<button id="buttonReload" class="btn" ><i class="fa-solid fa-rotate"></i></button>
								
								<a href="${pageContext.request.contextPath }/admin/serviceAccount?action=newService">Thêm người đăng ký dịch vụ</a>
                  <table style="text-align: center;" id="example2" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th style="width: 50px; vertical-align: top;">
                          Mã dịch vụ
                        </th>     
                        <th style="vertical-align: top;">
                          Tài khoản
                          <br>
                          <input type="text" name="phone" id="phone">
                         </th>

                        <th style="vertical-align: top;">Thư điện tử</th>
                        <th style="vertical-align: top;">Số điện thoại
                        <br>
                          <input type="text" name="phone" id="phone">
                        </th>
                        <th style="vertical-align: top;">Số dư</th>
                         <th style="vertical-align: top;">Gói cước</th>
                         <th style="vertical-align: top;">Ngày bắt đầu</th>
                         <th style="vertical-align: top;">Ngày kết thúc</th>
                        <th style="vertical-align: top;">Hành động</th>
                      </tr>
                    </thead>
                    <tbody>
                 	<% for(AccountService accountService : accountServiceDAO.findByServiceID(Integer.parseInt(serviceID))) { %>
                 		<tr>
                 			<td><%= accountService.getId() %></td>
	                 		<td><%= accountDetailsDAO.findAccountByAccountID(accountService.getAccountID()).getAccountid() %> - <%= accountDetailsDAO.findAccountByAccountID(accountService.getAccountID()).getName() %></td>
	                 		<td><%= accountDAO.findAccountByAccountID(accountService.getAccountID()).getEmail()%></td>
	                 		<td><%= accountDetailsDAO.findAccountByAccountID(accountService.getAccountID()).getPhonenumber() %></td>
	                 		<td><%= accountDetailsDAO.findAccountByAccountID(accountService.getAccountID()).getBalance() %></td>
	                 		<td><%= serviceDAO.findByID(accountService.getServiceID()).getName() %></td>
	                 		<td><%= accountService.getCreated() %></td>
	                 		<td><%= accountService.getEndService() %></td>
	                 		<td><a href="${pageContext.request.contextPath }/admin/serviceAccount?action=cancelService&accountServiceID=<%= accountService.getId() %>">Hủy dịch vụ</a></td>
                 		</tr>
                 	<% } %>
				</tbody>
                  </table>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
				 <script>
			
		
              <!-- /.card -->
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
      </section>
      <!-- /.content -->
    </div>