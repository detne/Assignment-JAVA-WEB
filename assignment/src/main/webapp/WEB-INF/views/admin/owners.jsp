<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.Owner"%>
<%@page import="dao.OwnerDAO"%>
<%@page import="models.Systemapartment"%>
<%@page import="dao.BranchDAO"%>
<%@page import="dao.SystemApartmentDAO"%>
<%@ page import="dao.OwnerDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	OwnerDAO ownerDAO = new OwnerDAO();
 	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
 %>
     <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Danh sách chủ sở hữu</h1>
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
                <script>
					$(document).ready(function() {
						$('#subject').keyup(function() {
							var subject = $(this).val();
							console.log(subject);
							$.ajax({
								type: 'GET',
								dataType: 'json',
								contentType: 'application/json; charset=utf-8',
								url: '${pageContext.request.contextPath}/admin/owners',
								data: {
									subject: subject,
									action: "searchByName"
								},
								success: function (owner) {
									var s = '';
									for(var i = 0;i < owner.length;i++) {
										s+='<tr>';
										s+='<td>'+ owner[i].id +'</td>';
										s+='<td>'+ owner[i].name +'</td>';
										s+='<td>'+ owner[i].birthday +'</td>';
										s+='<td>'+ owner[i].phone + '</td>';										
										s+='<td>'+ owner[i].address +'</td>';
										s+='<td>'+ owner[i].identifynumber +'</td>';
										s+='<td>'+ owner[i].created +'</td>';
										s+='<td><a href="${pageContext.request.contextPath}/assets/user/images/'+ owner[i].avatar +'" target="_blank"><img src="${pageContext.request.contextPath}/assets/user/images/'+ owner[i].avatar +'" height="100" width="90" alt=""></a></td>';
										s+='<td><a onclick="return confirm(`Bạn có chắc muốn xóa chủ sở hữu ra khỏi danh sách?`)" href="${pageContext.request.contextPath }/admin/owners?action=deleteOwner&id='+ owner[i].id +'"><i class="fa-solid fa-trash"></i></a></td>';										
										s+='</tr>';
									}
									$('#example2 tbody').html(s);
								}								
							})
						});
					});
                </script>
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
                	String msg = (String) session2.getAttribute("msg");
                	String msg1 = msg;
                	session2.removeAttribute("msg");
                %>
                <c:if test="<%= msg1 != null %>">
                	<script>
                	alert('<%= msg1 %>');
                	</script>
                </c:if>
								<button id="buttonReload" class="btn" ><i class="fa-solid fa-rotate"></i></button>
                  <table style="text-align: center;" id="example2" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th style="vertical-align: top;">
                          Mã chủ sở hữu
                        </th>
                        <th style="vertical-align: top;">
                         	Họ và tên
                          <br>
                          <input style="width: 140px;" type="text" name="subject" id="subject">
                        </th>
                        <th style="vertical-align: top;">Ngày sinh</th>
                        <th style="vertical-align: top;">Số điện thoại</th>
                        <th style="vertical-align: top;">Địa chỉ</th>
                        <th style="vertical-align: top;">CCCD</th>
                        <th style="vertical-align: top;">Ngày tạo</th>
                        <th style="vertical-align: top;">Ảnh</th>
                        <th style="vertical-align: top;">Quản lý</th>
                       
                      </tr>
                    </thead>
                    <tbody>
                   <% for(Owner owner : ownerDAO.findAll()) {%>
                    <tr>
                        <td><%= owner.getId() %></td>
                        <td><%= owner.getName() %></td>
                        <td><%= dateFormat.format(owner.getBirthday()) %></td>
                        <td><%= owner.getPhone() %></td>
                        <td><%= owner.getAddress() %></td>
                        <td><%= owner.getIdentifynumber() %></td>
                        <td><%= dateFormat.format(owner.getCreated()) %></td>                        
                        <td><a href="${pageContext.request.contextPath}/assets/user/images/<%= owner.getAvatar() %>" target="_blank"><img src="${pageContext.request.contextPath}/assets/user/images/<%= owner.getAvatar() %>" height="100" width="90" alt=""></a></td>
                        <td><a onclick="return confirm('Bạn có chắc muốn xóa chủ sở hữu ra khỏi danh sách?')" href="${pageContext.request.contextPath }/admin/owners?action=deleteOwner&id=<%= owner.getId() %>"><i class="fa-solid fa-trash"></i></a></td>
                      </tr>
                    
                      <% } %>
                      
                     </tbody>
                      
                  </table>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->


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