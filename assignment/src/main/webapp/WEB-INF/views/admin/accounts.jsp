<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-12">
              <h1>Danh sách tài khoản</h1>
             
 

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
                <script>
					$(document).ready(function() {
						$('#name').keyup(function() {
							var name = $(this).val();
							console.log(name);
							$.ajax({
								type: 'GET',
								dataType: 'json',
								contentType: 'application/json; charset=utf-8',
								url: '${pageContext.request.contextPath}/superadmin/account',
								data: {
									action: "searchByName",
									name: name
								},
								success: function(accounts) {
									var s ='';
									for(var i = 0;i < accounts.length; i++) {
										var ngaysinhDate = new Date(accounts[i].birthday);
										var ngaysinhFormatted = new Intl.DateTimeFormat('vi-VN', {day: '2-digit', month: '2-digit', year: 'numeric'}).format(ngaysinhDate);
										var ngaytaoDate = new Date(accounts[i].created);
										var ngaytaoFormatted = new Intl.DateTimeFormat('vi-VN', {day: '2-digit', month: '2-digit', year: 'numeric'}).format(ngaytaoDate);
										s+='<tr>';
										s+='<td>' + accounts[i].id + '</td>';
										s+='<td>' + accounts[i].username + '</td>';
										s+='<td>' + accounts[i].name + '</td>';
										s+='<td>' + ngaysinhFormatted + '</td>';
										s+='<td>' + accounts[i].email + '</td>';
										s+='<td>' + accounts[i].phoneNumber + '</td>';
										s+='<td>' + accounts[i].address + '</td>';
										s+='<td>' + ngaytaoFormatted + '</td>';
										s+='<td><img src="${pageContext.request.contextPath}/assets/user/images/'+ accounts[i].avatar +'" height="100" width="90" alt=""></td>';
										s+='<td>';
										if(accounts[i].verify == true && accounts[i].status == true) {
											s+='Đã xác thực';
										} else if(accounts[i].verify == false && accounts[i].status == true) {
											s+='Chưa xác thực';
										} else if(accounts[i].status == false) {
											s+='Vô hiệu hóa';
										}
										s+='</td>';
										s+='<td>'
										if(accounts[i].status == true) {
											s+= '<a href="${pageContext.request.contextPath }/superadmin/account?action=blockUser&id='+ accounts[i].id +'" onclick="return confirm(`Bạn có chắc chắn muốn chặn`)">Chặn</a> |';
										} else if(accounts[i].status == false) {
											s+= '<a href="${pageContext.request.contextPath }/superadmin/account?action=unblockUser&id='+ accounts[i].id +'" onclick="return confirm(`bạn có chắc chắn muốn bỏ chặn`)">Bỏ chặn</a> |';
										}
										s+= '<a  href="#" onclick="return confirm(`bạn có chắc chắn muốn xóa`)">Xóa</a>';
										s+='</td>';
										s+='</tr>';					
									}
									$('#example2 tbody').html(s);
								}							
							});
						});

						$('#phone').keyup(function() {
							var phone = $(this).val();
							console.log(name);
							$.ajax({
								type: 'GET',
								dataType: 'json',
								contentType: 'application/json; charset=utf-8',
								url: '${pageContext.request.contextPath}/superadmin/account',
								data: {
									action: "searchByPhone",
									phone: phone
								},
								success: function(accounts) {
									var s ='';						
									for(var i = 0;i < accounts.length; i++) {
										var ngaysinhDate = new Date(accounts[i].birthday);
										var ngaysinhFormatted = new Intl.DateTimeFormat('vi-VN', {day: '2-digit', month: '2-digit', year: 'numeric'}).format(ngaysinhDate);
										var ngaytaoDate = new Date(accounts[i].created);
										var ngaytaoFormatted = new Intl.DateTimeFormat('vi-VN', {day: '2-digit', month: '2-digit', year: 'numeric'}).format(ngaytaoDate);
										s+='<tr>';
										s+='<td>' + accounts[i].id + '</td>';
										s+='<td>' + accounts[i].username + '</td>';
										s+='<td>' + accounts[i].name + '</td>';
										s+='<td>' + ngaysinhFormatted + '</td>';
										s+='<td>' + accounts[i].email + '</td>';
										s+='<td>' + accounts[i].phoneNumber + '</td>';
										s+='<td>' + accounts[i].address + '</td>';
										s+='<td>' + ngaytaoFormatted + '</td>';
										s+='<td><img src="${pageContext.request.contextPath}/assets/user/images/'+ accounts[i].avatar +'" height="100" width="90" alt=""></td>';
										s+='<td>';
										if(accounts[i].verify == true && accounts[i].status == true) {
											s+='Đã xác thực';
										} else if(accounts[i].verify == false && accounts[i].status == true) {
											s+='Chưa xác thực';
										} else if(accounts[i].status == false) {
											s+='Vô hiệu hóa';
										}
										s+='</td>';
										s+='<td>'
										if(accounts[i].status == true) {
											s+= '<a href="${pageContext.request.contextPath }/superadmin/account?action=blockUser&id='+ accounts[i].id +'" onclick="return confirm(`Bạn có chắc chắn muốn chặn`)">Chặn</a> |';
										} else if(accounts[i].status == false) {
											s+= '<a href="${pageContext.request.contextPath }/superadmin/account?action=unblockUser&id='+ accounts[i].id +'" onclick="return confirm(`bạn có chắc chắn muốn bỏ chặn`)">Bỏ chặn</a> |';
										}
										s+= '<a  href="#" onclick="return confirm(`bạn có chắc chắn muốn xóa`)">Xóa</a>';
										s+='</td>';
										s+='</tr>';					
									}
									$('#example2 tbody').html(s);
								}							
							});
						});

						$('#changeStatus').change(function() {
							var value = $(this).val();
							$.ajax({
								type: 'GET',
								dataType: 'json',
								contentType: 'application/json; charset=utf-8',
								url: '${pageContext.request.contextPath}/superadmin/account',
								data: {
									action: "searchByVerify",
									value: value
								},
								success: function(accounts) {
									var s ='';						
									for(var i = 0;i < accounts.length; i++) {
										var ngaysinhDate = new Date(accounts[i].birthday);
										var ngaysinhFormatted = new Intl.DateTimeFormat('vi-VN', {day: '2-digit', month: '2-digit', year: 'numeric'}).format(ngaysinhDate);
										var ngaytaoDate = new Date(accounts[i].created);
										var ngaytaoFormatted = new Intl.DateTimeFormat('vi-VN', {day: '2-digit', month: '2-digit', year: 'numeric'}).format(ngaytaoDate);
										s+='<tr>';
										s+='<td>' + accounts[i].id + '</td>';
										s+='<td>' + accounts[i].username + '</td>';
										s+='<td>' + accounts[i].name + '</td>';
										s+='<td>' + ngaysinhFormatted + '</td>';
										s+='<td>' + accounts[i].email + '</td>';
										s+='<td>' + accounts[i].phoneNumber + '</td>';
										s+='<td>' + accounts[i].address + '</td>';
										s+='<td>' + ngaytaoFormatted + '</td>';
										s+='<td><img src="${pageContext.request.contextPath}/assets/user/images/'+ accounts[i].avatar +'" height="100" width="90" alt=""></td>';
										s+='<td>';
										if(accounts[i].verify == true && accounts[i].status == true) {
											s+='Đã xác thực';
										} else if(accounts[i].verify == false && accounts[i].status == true) {
											s+='Chưa xác thực';
										} else if(accounts[i].status == false) {
											s+='Vô hiệu hóa';
										}
										s+='</td>';
										s+='<td>'
										if(accounts[i].status == true) {
											s+= '<a href="${pageContext.request.contextPath }/superadmin/account?action=blockUser&id='+ accounts[i].id +'" onclick="return confirm(`Bạn có chắc chắn muốn chặn`)">Chặn</a> |';
										} else if(accounts[i].status == false) {
											s+= '<a href="${pageContext.request.contextPath }/superadmin/account?action=unblockUser&id='+ accounts[i].id +'" onclick="return confirm(`bạn có chắc chắn muốn bỏ chặn`)">Bỏ chặn</a> |';
										}
										s+= '<a  href="#" onclick="return confirm(`bạn có chắc chắn muốn xóa`)">Xóa</a>';
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
                	String msg = (String) session2.getAttribute("msg");
                	String msgUnblock = (String) session2.getAttribute("msg2");
                	String msg1 = msg;
                	String msgUnblock1 = msgUnblock;
                	session2.removeAttribute("msg");
                	session2.removeAttribute("msg2");
                	
               %>
               <%if(msg1 != null) { %>
                		<script>
                		  alert('<%= msg1 %>');
                		</script>
                <% }%>
              <%if(msgUnblock1 != null) { %>
                		<script>
                		  alert('<%= msgUnblock1 %>');
                		</script>
                <% }%>
            
                <!-- /.card-header -->
                <div class="card-body">
                	<script>
								$(document).ready(function() {
									$('#buttonReload').click(function() {
										location.reload();
									});
								});
							
							
							</script>
<script>
        function exportTableToExcel(tableID, filename = '') {
        	var table = $('#' + tableID).DataTable();
            var data = table.rows().data().toArray();
            var headers = [];
            $('#' + tableID + ' thead th').each(function() {
                headers.push($(this).text().trim());
            });

            var jsonData = [];
            data.forEach(function(row) {
                var rowData = {};
                headers.forEach(function(header, index) {
                    rowData[header] = row[index];
                });
                jsonData.push(rowData);
            });

            var ws = XLSX.utils.json_to_sheet(jsonData);
            var wb = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(wb, ws, "Sheet1");

            XLSX.writeFile(wb, filename + ".xlsx");
        }
    </script>
						<!-- /.card-header -->
						
								<button id="buttonReload" class="btn" ><i class="fa-solid fa-rotate"></i></button>
								 <button class="btn btn-primary btn-md" onclick="exportTableToExcel('example2', 'myData')">Export to Excel</button>
                  <table style="text-align: center;" id="example2" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th style="width: 50px; vertical-align: top;">
                          Mã tài khoản
                        </th>
                        <th style="vertical-align: top;">
                          Tên tài khoản                      
                        </th>              
                        <th style="vertical-align: top;">
                          Họ và tên
                          <br>
                          <input type="text" name="name" id="name">
                         </th>
                        <th style="vertical-align: top;">Ngày sinh</th>
                        <th style="vertical-align: top;">Thư điện tử</th>
                        <th style="vertical-align: top;">Số điện thoại
                        <br>
                          <input type="text" name="phone" id="phone">
                        </th>
                        <th style="vertical-align: top;">Địa chỉ</th>
                        <th style="vertical-align: top;">Ngày khởi tạo</th>
                        <th style="vertical-align: top;">Ảnh đại diện</th>
                        <th style="vertical-align: top;">Trạng thái
                          <br>
                          <select style="margin-top: 10px;" name="" id="changeStatus">
                            <option value="0">Chọn trạng thái</option>
                            <option value="1">Đã xác thực</option>
                            <option value="2">Chưa xác thực</option>
                            <option value="3">Vô hiệu hóa</option>

                          </select>
                        </th>
                        <th style="vertical-align: top;">Hành động</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="account" items="${accounts}">
                      <tr>
                        <td>${account.id } - ${account.role == 1 ? "Người dùng" : "Admin" }</td>
                        <td>${account.username }</td>
                        <td>${account.name }</td>
                        <td><f:formatDate value="${account.birthday }"
													pattern="dd/MM/yyyy" var="birthday" /> ${birthday }</td>
                        <td>${account.email }</td>
                        <td>${account.phoneNumber }</td>
                        <td>${account.address }</td>
                        <td><f:formatDate value="${account.created }"
													pattern="dd/MM/yyyy" var="created" /> ${created }</td>
                        <td><img src="${pageContext.request.contextPath}/assets/user/images/${account.avatar}" height="100" width="90" alt=""></td>
                        <td>
                        	<c:if test="${account.verify == true && account.status == true}">
                        		Đã xác thực 
                        	</c:if>
                        	<c:if test="${account.verify == false && account.status == true}">
                        		Chưa xác thực 
                        	</c:if>
                        	<c:if test="${account.status == false }">
                        		Vô hiệu hóa 
                        	</c:if>
                        </td>
                       <td>
                       		<c:if test="${account.status == true }">
                       			<a href="${pageContext.request.contextPath }/superadmin/account?action=blockUser&id=${account.id}" onclick="return confirm('bạn có chắc chắn muốn chặn')">Chặn</a> | 
                       		</c:if>
                       		<c:if test="${account.status == false }">
                       			<a href="${pageContext.request.contextPath }/superadmin/account?action=unblockUser&id=${account.id}" onclick="return confirm('bạn có chắc chắn muốn bỏ chặn')">Bỏ chặn</a> | 
                       		</c:if>
                       	
                       		<a  href="#" onclick="return confirm('bạn có chắc chắn muốn xóa')">Xóa</a> |
                       		<c:if test="${account.role == 1}">
                       			<a onclick="return confirm('Chuyển tài khoản thành admin?')" href="${pageContext.request.contextPath }/superadmin/account?action=setAdmin&id=${account.id}">Cấp admin</a>
                       		</c:if>
                       		<c:if test="${account.role != 1}">
                       			<a onclick="return confirm('Chuyển tài khoản thành người dùng?')" href="${pageContext.request.contextPath }/superadmin/account?action=unAdmin&id=${account.id}">Gỡ admin</a>
                       		</c:if>
                       </td>
                      
                        
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