<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Danh sách căn hộ người dùng</h1>
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
							$.ajax({
								type: 'GET',
								dataType: 'json',
								contentType: 'application/json; charset=utf-8',
								url: '${pageContext.request.contextPath}/admin/userapartment',
								data: {
									subject: subject,
									action: "searchBySubject"
								},
								success: function (userapartment) {
									var s = '';
									for(var i = 0;i < userapartment.length;i++) {
										s+='<tr>';
										s+='<td>'+ userapartment[i].id +'</td>';
										s+='<td>'+ userapartment[i].subject +'</td>';
										s+='<td>'+ userapartment[i].accountid +'</td>';
										s+='<td>'+ userapartment[i].postdate +'</td>';
										s+='<td>'+ userapartment[i].bedroom +'</td>';
										s+='<td>'+ userapartment[i].bathroom +'</td>';
										s+='<td>'+ userapartment[i].price +'</td>';
										s+='<td>'+ userapartment[i].deposit +'</td>';
										s+='<td>'+ userapartment[i].address +'</td>';
										s+='<td>'+ userapartment[i].area +'</td>';
										s+='<td>'+ userapartment[i].description +'</td>';
										s+='<td><a href="${pageContext.request.contextPath}/assets/user/images/150canho/'+ userapartment[i].avatar +'" target="_blank"><img src="${pageContext.request.contextPath}/assets/user/images/150canho/'+ userapartment[i].avatar +'" height="100" width="90" alt=""></a></td>';
										s+=' <td><a onclick="return confirm(`Bạn có chắc muốn xóa căn hộ người dùng ra khỏi hệ thống?`)" href="${pageContext.request.contextPath }/admin/userapartment?action=deleteApart&id='+ userapartment[i].id +'"><i class="fa-solid fa-trash"></i></a></td>';
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
                          Mã căn hộ
                        </th>
                        <th style="vertical-align: top;">
                          Tiêu đề
                          <br>
                          <input style="width: 140px;" type="text" name="subject" id="subject">
                        </th>
                        <th style="vertical-align: top;">Mã tài khoản</th>
                        <th style="vertical-align: top;">Ngày đăng</th>
                        <th style="vertical-align: top;">Phòng ngủ</th>
                        <th style="vertical-align: top;">Phòng tắm</th>
                        <th style="vertical-align: top;">Giá</th>
                        <th style="vertical-align: top;">Đặt cọc</th>
                        <th style="vertical-align: top;">Địa chỉ</th>
                        <th style="vertical-align: top;">Diện tích</th>
                        <th style="vertical-align: top;">Mô tả</th>
                        <th style="vertical-align: top;">Ảnh căn hộ</th>
                        <th>&nbsp;</th>
                        <th style="vertical-align: top;">Quản lý</th>
                       
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="userapart" items="${userapartment }">
                    <tr>
                        <td>${userapart.id }</td>
                        <td>${userapart.subject }</td>
                        <td>${userapart.accountid }</td>
                        <td>${userapart.postdate }</td>
                        <td>${userapart.bedroom }</td>
                        <td>${userapart.bathroom }</td>
                        <td>${userapart.price } tỷ VND</td>
                        <td>${userapart.deposit } triệu VND</td>
                        <td>${userapart.address }</td>
                        <td>${userapart.area }</td>
                        <td>${userapart.description }</td>
                        <td><a href="${pageContext.request.contextPath}/assets/user/images/150canho/${userapart.avatar }" target="_blank"><img src="${pageContext.request.contextPath}/assets/user/images/150canho/${userapart.avatar }" height="100" width="90" alt=""></a></td>
                        <td><a href="${pageContext.request.contextPath }/admin/postapartmentdetails?id=${userapart.id }">Xem chi tiết</a></td>
                        <td><a onclick="return confirm('Bạn có chắc muốn xóa căn hộ người dùng ra khỏi hệ thống?')" href="${pageContext.request.contextPath }/admin/userapartment?action=deleteApart&id=${userapart.id }"><i class="fa-solid fa-trash"></i></a></td>
                      </tr>
                    </c:forEach>
                      
                      
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