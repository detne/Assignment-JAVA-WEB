<%@page import="dao.BranchDAO"%>
<%@page import="models.Systemapartment"%>
<%@page import="dao.SystemApartmentDAO"%>
<%@ page import="dao.BranchDAO" %>
<%@ page import="dao.SystemApartmentDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%
    	SystemApartmentDAO systemApartmentDAO = new SystemApartmentDAO();
    	BranchDAO branchDAO = new BranchDAO();
    	HttpSession session1 = request.getSession();
    	int id = Integer.parseInt(request.getParameter("id"));
    	/* String msg = "";
    	if(session1.getAttribute("msg") != null){
    		msg = session1.getAttribute("msg").toString();
        	session1.removeAttribute("msg");
    	}  */
    	
    	String msg = (String) session1.getAttribute("msg");
    	String msg1 = msg;
    	session1.removeAttribute("msg");
    	
    	Systemapartment systemapartment = systemApartmentDAO.findSystemApartmentByID(id);
    %>
   <head>
   		<meta charset="UTF-8">
   </head>
  <div class="page-heading header-text">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <span class="breadcrumb"><a href="index.html">Trang chủ</a> / Căn hộ của hệ thống</span>
          <h3>Căn hộ của hệ thống</h3>
        </div>
      </div>
    </div>
  </div>
	
  <div class="single-property section">
    <div class="container">
       <a href="${pageContext.request.contextPath}/systemapartment"><button class="btn" style="color: white;background-color: #f35525;font-weight: bold;"><i class="fa-solid fa-arrow-right fa-rotate-180"></i> Trở lại</button></a>
      	<br> <br>
      <div class="row">
      	
        <div class="col-lg-8">
          <div class="main-image">
          <a id="a_img" href="${pageContext.request.contextPath}/assets/user/images/150canho/<%= systemapartment.getAvatar() %>">  <img height="428" width="856" class="img_proMain" src="${pageContext.request.contextPath}/assets/user/images/150canho/<%= systemapartment.getAvatar() %>" alt=""></a>
            <br>
            <br>
            <div style="display: flex;">
            <c:forEach var="image" items="${images }">
            	<img class="img_pro" src="${pageContext.request.contextPath}/assets/user/images/150canho/${image.name}" alt=""> &nbsp;
            </c:forEach>
              <style>
                .img_pro {
                  cursor: pointer;
                }
              </style>
              <script>
                $(document).ready(function () {
                  $('.img_pro').click(function () {
                    var src = $(this).attr('src');
                    $('.img_proMain').attr('src', src);
                    $('#a_img').attr('href', src);
                  });
                });
              </script>
            </div>
          </div>
          <div class="main-content">
     	
           <span class="category">Đã đăng vào ngày <f:formatDate value="${system.created }"
													pattern="dd/MM/yyyy" var="created" /> ${created }</span>
            <h4><%= systemapartment.getSubject() %></h4>
            <h5 style="margin-bottom: -25px;">Giá: <%= systemapartment.getPrice()%> tỷ</h5>
          </div>
          <div class="accordion" id="accordionExample">
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingOne">
                <button disabled class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne"
                  aria-expanded="true" aria-controls="collapseOne">
                  <h6>Chi tiết căn hộ</h6>
                </button>
              </h2>
              <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="row">
                    <div class="col">
                      <ul>
                        <li>
                         <strong>Khu vực</strong>
                          <span>TP. Hồ Chí Minh</span>
                        </li>
                        <li>
                          <strong>
                            <i class="fa-solid fa-bed" style="color: #e57010;"></i>
                          </strong>
                          <span><%= systemapartment.getBedroom() %> Phòng ngủ</span>
                        </li>
                        <li>
                          <strong>
                            <i class="fa-solid fa-person" style="color: #e57010;"></i>
                          </strong>
                          <span>3-4 Người</span>
                        </li>
                        <li>
                          <strong>Đặt cọc</strong>
                          <span><%= systemapartment.getDeposit() %> triệu</span>
                        </li>
                      </ul>
                    </div>
                    <div class="col">
                      <ul>
                        <li>
                         <strong>Địa chỉ</strong>
                          <span><%= branchDAO.findBranchByID(systemapartment.getBranchid()).getAddress() %></span>
                        </li>
                        <li>
                          <strong>
                            <i class="fa-solid fa-bath" style="color: #e57010;"></i>
                          </strong>
                          <span><%= systemapartment.getBathroom() %> Phòng tắm</span>
                        </li>
                        <li>
                          <strong>
                            <i class="fa-solid fa-arrows-up-down-left-right" style="color: #e57010;"></i>
                          </strong>
                          <span><%= systemapartment.getArea() %> m2</span>
                        </li>
                        <li>
                          <i class="fa-solid fa-square-parking" style="color: #e57010;"></i>
                          <span>Rộng rãi cho xe máy và cả xe hơi</span>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingTwo">
                <button disabled class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                  <h6>Tiện nghi và Tiện ích</h6>
                </button>
              </h2>
              <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="row">
                    <div class="col">
                      <ul>
                        <li>
                         <strong>
                          <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                         </strong>
                          <span>Thang máy</span>
                        </li>
                        <li>
                          <strong>
                           <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                          </strong>
                           <span>Chỗ đậu xe</span>
                         </li>
                         <li>
                          <strong>
                           <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                          </strong>
                           <span>Hồ bơi</span>
                         </li>
                      </ul>
                    </div>
                    <div class="col">
                      <ul>
                        <li>
                         <strong>
                          <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                         </strong>
                          <span>Camera An Ninh</span>
                        </li>
                        <li>
                          <strong>
                           <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                          </strong>
                           <span>PCCC đạt tiêu chuẩn</span>
                         </li>
                         <li>
                          <strong>
                           <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                          </strong>
                           <span>Phòng gym</span>
                         </li>
                      </ul>
                    </div>
                    <div class="col">
                      <ul>
                        <li>
                         <strong>
                          <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                         </strong>
                          <span>Mặt tiền đường</span>
                        </li>
                        <li>
                          <strong>
                           <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                          </strong>
                           <span>Bảo vệ 24/7</span>
                         </li>
                         <li>
                          <strong>
                           <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                          </strong>
                           <span>Siêu thị tiện lợi</span>
                         </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingThree">
                <button disabled class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                  <h6>Ưu điểm căn hộ</h6>
                </button>
              </h2>
              <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="row">
                    <div class="col">
                      <ul>
                        <li>
                          <p style="font-size: 15px;color: #000;font-weight: bold;margin-bottom: 100px;">Đặc điểm nổi bật</p>
                        </li>
                      </ul>
                    </div>
                    <div class="col">
                      <ul>
                        <li>
                          <p><%= systemapartment.getDescription() %></p>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="card bg-light d-flex flex-fill">
            <div style="text-align: center;" class="card-header text-muted border-bottom-0 bg-primary">
              <span style="color: white;">Bạn cần tư vấn thêm?</span>
              
            </div>
            <div class="card-body pt-0 mt-3">
              <div class="row">
            	  <%-- <span style="color: green; font-size: large;"><%= msg == null ? "" : msg %></span> --%>
            	  <span style="color: green; font-size: large;"><%= msg1 == null ? "" : msg1%></span>
            	  <br>
                  <span>Để lại thông tin và chúng tôi sẽ liên hệ với bạn ngay.</span>
                  <br>
                  <div class="card-body">
                    <form method="post" action="${pageContext.request.contextPath }/systemapartmentdetails?action=contact" accept-charset="UTF-8" >
                        <!-- Form Group (username)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="inputName">Họ và tên</label>
                            <input class="form-control" id="inputName"  type="text" placeholder="Nhập họ và tên" required name="name">
                        </div>
                        <div class="mb-3">
                          <label class="small mb-1" for="inputPhone">Số điện thoại</label>
                          <input class="form-control" id="inputPhone" name="phone" pattern="(\(\+[0-9]{2}\)|0)([0-9]{9,10})" type="text" placeholder="Nhập số điện thoại" required>
                        </div>
                         <div class="mb-3">
                            <label class="small mb-1" for="inputEmail">Email</label>
                            <input class="form-control" id="inputEmail" name="email" pattern="[^ @]*@[^ @]*" type="text"  placeholder="Nhập email" required>
                        </div>
                          <div class="mb-3">
                            <label class="small mb-1" for="inputDescription">Tin nhắn</label>
                            <textarea class="form-control" placeholder="Nhập nội dung" name="description"   id="inputDescription" required=""></textarea>
                        </div>
                      		
                    	<input type="hidden" value="<%= systemapartment.getId() %> - <%= systemapartment.getSubject() %>"  name="subject" id="subject">
                    	<input type="hidden" value="<%= systemapartment.getId()%>" name="id" >
                        <!-- Save changes button-->
                        <div style="display: flex; align-items: center; justify-content: center;">
                        <button  class="btn btn-primary"   id="submit">Gửi thông tin</button>
                      </div>
                  </form>
                </div>
              </div>
            </div>
          
          </div>
        </div>
      </div>
    </div>
  </div>
