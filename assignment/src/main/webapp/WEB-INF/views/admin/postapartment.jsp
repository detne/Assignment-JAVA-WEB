<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.Post"%>
<%@page import="dao.AccountDetailsDAO"%>
<%@page import="dao.PostDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%
    	PostDAO postDAO = new PostDAO();
    	AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
    %>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    
  <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Danh sách bài đăng người dùng</h1>
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
                <!-- /.card-header -->
                <div class="card-body">
                  <table style="text-align: center;" id="example2" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th style="vertical-align: top;">
                          Mã căn hộ
                        </th>
                        <th style="vertical-align: top;">
                          Tiêu đề
                          
                        </th>
                        <th style="vertical-align: top;">Mã tài khoản</th>
                        <th style="vertical-align: top;">Ngày đăng</th>
                        <th style="vertical-align: top;">Giá</th>
                        <th style="vertical-align: top;">Địa chỉ</th>
                        <th style="vertical-align: top;">Ảnh căn hộ</th>
                        <th>&nbsp;</th>
                        <th style="vertical-align: top;">Xét duyệt</th>
                      </tr>
                    </thead>
                    <tbody>
                    <% for(Post post : postDAO.findAllInAdmin()) {%>
                      <tr>
                        <td><%= post.getId() %></td>
                        <td><%= post.getSubject() %></td>
                        <td><%= post.getAccountid() + " - " + accountDetailsDAO.findAccountByAccountID(post.getAccountid()).getName() %></td>
                        <td><%= simpleDateFormat.format(post.getPostdate()) %></td>
                        <td><%= post.getPrice() %> tỷ</td>
                        <td><%= post.getAddress() %></td>
                        <td><a href="${pageContext.request.contextPath }/assets/user/images/150canho/<%= post.getAvatar() %>" target="_blank"><img src="${pageContext.request.contextPath }/assets/user/images/150canho/<%= post.getAvatar() %>" height="100" width="90" alt=""></a></td>
                        <td data-id="<%= post.getId() %>">Xem chi tiết</td>
                        <td>
                        	<%if (post.isStatus() == false) {%>
                       		<a onclick="return confirm('Đăng bài?')" href="${pageContext.request.contextPath }/admin/postapartment?action=updatePost&id=<%= post.getId() %>"><i class="fa-solid fa-pen-to-square"></i></a> &nbsp;
                       	<% } else if (post.isStatus() == true) {%>
							<a onclick="return confirm('Gỡ bài đăng xuống?')" href="${pageContext.request.contextPath }/admin/postapartment?action=updatePost&id=<%= post.getId() %>"><i class="fa-solid fa-circle-xmark"></i></a>  &nbsp;
                       	<% } %> 
							<a onclick="return confirm('Bạn có chắc chắn muốn xóa?')" href="${pageContext.request.contextPath }/admin/postapartment?action=deletePost&id=<%= post.getId() %>"><i class="fa-solid fa-trash"></i></a>
                        </td>
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
        <script>
        	$('#example2 tbody tr td').click(function () {
        		
        		var s = '';
				var postID = $(this).attr('data-id');
				$.ajax({
					type: 'GET',
					url: '${pageContext.request.contextPath}/admin/postapartment',
					data: {
						action: 'dialogDetails',
						postID: postID
					},
					success: function (data) {
						var post = data.post;
						var postImages = data.postImages;
						$('#postName').html(post.subject);
						$('#postPrice').html(post.price);
						$('#postDeposit').html(post.deposit);
						$('#postArea').html(post.area);
						$('#postAddress').html(post.address);
						var parsedDate = moment(post.postdate, "MMM DD, YYYY");
					    var formattedDate = parsedDate.format("DD/MM/YYYY");
						$('#postPostDate').html("23/01/2024");
						$('#postBedroom').html(post.bedroom);
						$('#postBathroom').html(post.bathroom);
						$('#imgMain').attr('src', '${pageContext.request.contextPath}/assets/user/images/150canho/' + post.avatar);
						for (var i = 0; i < postImages.length; i++) {
							s+= '<img class="imgSub" src="${pageContext.request.contextPath}/assets/user/images/150canho/' + postImages[i].name + '" style="margin-left: 37px; cursor: pointer;"  height="80px" width="120px" alt="Product Image">';
						}
						
						$('#postImages').html(s);
						 $('.imgSub').on('click', function(){
							 var src = $(this).attr('src');
		                        $('#imgMain').attr('src', src);
		                    });
						$("#dialog-message" ).dialog({
						      modal: true,
						      width: 1000,
						      height: 500,
						      buttons: {
						        Ok: function() {
						          $( this ).dialog( "close" );
						        }
						      }
						    });
					}
					
				});
				
			});
        </script>
        <!-- /.container-fluid -->
      </section>
      <div id="dialog-message" style="display: none;" title="Chi tiết bài đăng">

        <!-- Content Header (Page header) -->
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              
              <div class="col-sm-6">
               <a style="color: black;" href="postapartment.html"> <i style="font-size: 20px; margin-bottom: 10px;" class="fa-solid fa-arrow-right fa-rotate-180" ></i></a>
                <br>
               <h1>Chi tiết bài đăng</h1>
              </div>
              
            </div>
          </div><!-- /.container-fluid -->
        </section>
    
        <!-- Main content -->
        <section class="content">
    
          <!-- Default box -->
          <div class="card card-solid">
            <div class="card-body">
              <div class="row">
                <div class="col-12 col-sm-6">
                  <h3 class="d-inline-block d-sm-none">CĂN HỘ CAO CẤP 2PN FULL NỘI THẤT</h3>
                  <div class="col-12">
                    <img id="imgMain" height="200" width="450" src="../assets/images/50canho/can8.jpg" class="product-image" alt="Product Image">
                  </div>
                  <div class="col-12 product-image-thumbs" id="postImages">
                  	
                  </div>
                 
                </div>
                <div style="font-size: larger;" class="col-12 col-sm-6">
                  <h3 class="my-3" style="font-weight: bold;"  id="postName">CĂN HỘ CAO CẤP 2PN FULL NỘI THẤT	</h3>
                  <p>Kết cấu: 2 phòng ngủ,1 phòng tắm, 1 khu vực đa năng Thiết kế tiện nghi, nội thất cao cấp sang trọng Nội thất đầy đủ, Thang máy, hầm xe bảo vệ 24/7 Ở từ 2-4 người, cho nuôi thú cưng</p>
    
                  <hr>
                  <h3 style="font-weight: bold;">Thông tin căn hộ</h3>
                  <div data-toggle="buttons" style="margin-left: 20px;">
                    <div>
                      <i class="fa-solid fa-bed" style="color: #e57010;" ></i> &nbsp; Số phòng ngủ : <span id="postBedroom">2</span>
                    </div >
                    <div  style="margin-top: 20px;">
                      <i class="fa-solid fa-bath" style="color: #e57010;"></i> &nbsp; Số phòng tắm : <span id="postBathroom">2</span>
                    </div>
                    <div  style="margin-top: 20px;">
                      <i class="fa-solid fa-arrows-up-down-left-right" style="color: #e57010;"></i> &nbsp; Diện tích : <span id="postArea">69.5m2</span>
                    </div >
                    <div  style="margin-top: 20px;">
                      <i class="fa-solid fa-calendar-days" style="color: #e57010;"></i> &nbsp; Ngày đăng : <span id="postPostDate">28/03/2003</span>
                    </div>
                    <div  style="margin-top: 20px;">
                      <i class="fa-solid fa-location-dot" style="color: #e57010;"></i> &nbsp; Địa chỉ : <span id="postAddress">Chung cư An Bình</span>
                    </div>
                    <div  style="margin-top: 20px;">
                      <i class="fa-solid fa-hand-holding-dollar" style="color: #e57010;"></i> &nbsp; Đặt cọc : <span id="postDeposit">20.000.000</span> triệu
                    </div>
                   
                  </div>
    
                  
              
                  <div class="py-2 px-3 mt-4" style="background-color: #e57010;" >
                    <h2 style="color: white;"  class="mb-0">
                      <span id="postPrice"></span> <span> tỷ</span>
                    </h2>
                   
                   
                  </div>
    
  
    
  
    
                </div>
              </div>

            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
    
        </section>
        <!-- /.content -->
     
</div>
      <!-- /.content -->
    </div>