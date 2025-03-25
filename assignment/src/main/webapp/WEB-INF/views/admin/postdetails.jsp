<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.PostImage"%>
<%@page import="dao.PostImageDAO"%>
<%@page import="models.Post"%>
<%@page import="dao.PostDAO"%>
<%@ page import="dao.PostImageDAO" %>
<%@ page import="dao.PostDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%
    	PostDAO postDAO = new PostDAO();
    	PostImageDAO postImageDAO = new PostImageDAO();
    	int id = Integer.parseInt(request.getParameter("id"));
    	Post post = postDAO.findPostByID(id);
    	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            
            <div class="col-sm-6">
             <a style="color: black;" href="${pageContext.request.contextPath }/admin/postapartment"> <i style="font-size: 20px; margin-bottom: 10px;" class="fa-solid fa-arrow-right fa-rotate-180" ></i></a>
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
                <h3 class="d-inline-block d-sm-none"><%= post.getSubject() %>	</h3>
                <div class="col-12">
                  <img id="imgMain" src="${pageContext.request.contextPath}/assets/user/images/150canho/<%= post.getAvatar() %>" class="product-image" alt="Product Image">
                </div>
                <div class="col-12 product-image-thumbs">
                <% for(PostImage postImage : postImageDAO.findPostImageByPostID(post.getId())) {%>
                  <img class="imgSub" src="${pageContext.request.contextPath}/assets/user/images/150canho/<%= postImage.getName() %>" style="cursor: pointer;"  height="130px" width="300px" alt="Product Image">
                
                  <% } %>
                </div>
                <script>
                    $(document).ready(function(){
                     
                      $('.imgSub').click(function(){
                        var src = $(this).attr('src');
                        $('#imgMain').attr('src', src);
                      });
                    });
                </script>
              </div>
              <div style="font-size: larger;" class="col-12 col-sm-6">
                <h3 class="my-3" style="font-weight: bold;"><%= post.getSubject() %>	</h3>
                <p><%= post.getDescription() %> </p>
  
                <hr>
                <h3 style="font-weight: bold;">Thông tin căn hộ</h3>
                <div data-toggle="buttons" style="margin-left: 20px;">
                  <div>
                    <i class="fa-solid fa-bed" style="color: #e57010;"></i> &nbsp; Số phòng ngủ : <span><%= post.getBedroom() %></span>
                  </div >
                  <div  style="margin-top: 20px;">
                    <i class="fa-solid fa-bath" style="color: #e57010;"></i> &nbsp; Số phòng tắm : <span><%= post.getBathroom() %></span>
                  </div>
                  <div  style="margin-top: 20px;">
                    <i class="fa-solid fa-arrows-up-down-left-right" style="color: #e57010;"></i> &nbsp; Diện tích : <span><%= post.getArea() %> m2</span>
                  </div >
                  <div  style="margin-top: 20px;">
                    <i class="fa-solid fa-calendar-days" style="color: #e57010;"></i> &nbsp; Ngày đăng : <span><%= simpleDateFormat.format(post.getPostdate()) %></span>
                  </div>
                  <div  style="margin-top: 20px;">
                    <i class="fa-solid fa-location-dot" style="color: #e57010;"></i> &nbsp; Địa chỉ : <span><%= post.getAddress() %></span>
                  </div>
                  <div  style="margin-top: 20px;">
                    <i class="fa-solid fa-hand-holding-dollar" style="color: #e57010;"></i> &nbsp; Đặt cọc : <span><%= post.getDeposit() %> triệu VND</span>
                  </div>
                 
                </div>
  
                
            
                <div class="py-2 px-3 mt-4" style="background-color: #e57010;" >
                  <h2 style="color: white;"  class="mb-0">
                    <%= post.getPrice() %> tỷ VND
                  </h2>
                 
                </div>
  

  

  
              </div>
            </div>
            <!-- <div class="row mt-4">
              <nav class="w-100">
                <div class="nav nav-tabs" id="product-tab" role="tablist">
                  <a class="nav-item nav-link active" id="product-desc-tab" data-toggle="tab" href="#product-desc" role="tab" aria-controls="product-desc" aria-selected="true">Description</a>
                  <a class="nav-item nav-link" id="product-comments-tab" data-toggle="tab" href="#product-comments" role="tab" aria-controls="product-comments" aria-selected="false">Comments</a>
                  <a class="nav-item nav-link" id="product-rating-tab" data-toggle="tab" href="#product-rating" role="tab" aria-controls="product-rating" aria-selected="false">Rating</a>
                </div>
              </nav>
              <div class="tab-content p-3" id="nav-tabContent">
                <div class="tab-pane fade show active" id="product-desc" role="tabpanel" aria-labelledby="product-desc-tab"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae condimentum erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed posuere, purus at efficitur hendrerit, augue elit lacinia arcu, a eleifend sem elit et nunc. Sed rutrum vestibulum est, sit amet cursus dolor fermentum vel. Suspendisse mi nibh, congue et ante et, commodo mattis lacus. Duis varius finibus purus sed venenatis. Vivamus varius metus quam, id dapibus velit mattis eu. Praesent et semper risus. Vestibulum erat erat, condimentum at elit at, bibendum placerat orci. Nullam gravida velit mauris, in pellentesque urna pellentesque viverra. Nullam non pellentesque justo, et ultricies neque. Praesent vel metus rutrum, tempus erat a, rutrum ante. Quisque interdum efficitur nunc vitae consectetur. Suspendisse venenatis, tortor non convallis interdum, urna mi molestie eros, vel tempor justo lacus ac justo. Fusce id enim a erat fringilla sollicitudin ultrices vel metus. </div>
                <div class="tab-pane fade" id="product-comments" role="tabpanel" aria-labelledby="product-comments-tab"> Vivamus rhoncus nisl sed venenatis luctus. Sed condimentum risus ut tortor feugiat laoreet. Suspendisse potenti. Donec et finibus sem, ut commodo lectus. Cras eget neque dignissim, placerat orci interdum, venenatis odio. Nulla turpis elit, consequat eu eros ac, consectetur fringilla urna. Duis gravida utils pulvinar mauris ornare, eget porttitor enim vulputate. Mauris hendrerit, massa nec aliquam cursus, utils elit euismod lorem, vehicula rhoncus nisl dui sit amet eros. Nulla turpis lorem, dignissim a sapien eget, ultrices venenatis dolor. Curabitur vel turpis at magna elementum hendrerit vel id dui. Curabitur a utils ullamcorper, ornare velit vel, tincidunt ipsum. </div>
                <div class="tab-pane fade" id="product-rating" role="tabpanel" aria-labelledby="product-rating-tab"> Cras ut ipsum ornare, aliquam ipsum non, posuere elit. In hac habitasse platea dictumst. Aenean elementum leo augue, id fermentum risus efficitur vel. Nulla iaculis malesuada scelerisque. Praesent vel ipsum felis. Ut molestie, purus aliquam placerat sollicitudin, mi ligula euismod neque, non bibendum nibh neque et erat. Etiam dignissim aliquam ligula, aliquet feugiat nibh rhoncus ut. Aliquam efficitur lacinia lacinia. Morbi ac molestie lectus, vitae hendrerit nisl. Nullam metus odio, malesuada in vehicula at, consectetur nec justo. Quisque suscipit odio velit, at accumsan urna vestibulum a. Proin dictum, urna ut varius consectetur, sapien justo porta lectus, at mollis nisi orci et nulla. Donec pellentesque tortor vel nisl commodo ullamcorper. Donec varius massa at semper posuere. Integer finibus orci vitae vehicula placerat. </div>
              </div>
            </div> -->
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
  
      </section>
      <!-- /.content -->
    </div>
</body>
</html>