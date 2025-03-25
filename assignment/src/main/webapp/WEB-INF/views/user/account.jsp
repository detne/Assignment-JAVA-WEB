<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%
	
	HttpSession httpSession = request.getSession();
	if(httpSession.getAttribute("language")== null){
		request.getSession().setAttribute("language", "vi");
		
	}
	String language = httpSession.getAttribute("language").toString();
	ResourceBundle messages = ResourceBundle.getBundle("messages", new Locale(language));
%>
  <div class="featured section">
    <div class="container" style="margin-top: -50px;">
      <div class="row">
        <%
	HttpSession session2 = request.getSession();
	String errorAccount = (String) session2.getAttribute("msg");
	String errorAccount1 = errorAccount;
	session2.removeAttribute("msg");
%>
 		<%
            	if(errorAccount1 != null) {
            		
        %>
            <script>
				alert("<%= errorAccount1 %>");
            </script> 
            <%} %>
        <div class="col-lg-4">
          <div class="card mb-4 mb-xl-0">
            <div class="card-header"><%= messages.getString("avt") %></div>
            <div class="card-body text-center">
               <form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/account">
                <!-- Profile picture image-->
                <img id="imgAvatar" class="img-account-profile rounded-circle mb-2" src="${pageContext.request.contextPath }/assets/user/images/${sessionScope.accountdetails != null ? sessionScope.accountdetails.avatar : "" }" alt="">
                <!-- Profile picture help block-->
                <div class="small font-italic text-muted mb-4"><%= messages.getString("kich_thuoc_limit") %></div>
                <!-- Profile picture upload button-->
                <input  type="file" name="file" accept="image/*" id="inputAvatar">
                <label for="inputAvatar" class="custom-upload-btn" title="Chọn ảnh đại diện ccura bạn, ảnh không lớn hơn 5Mb"><i class="fa-solid fa-arrow-up-from-bracket"></i> &nbsp; <%= messages.getString("tai_len") %></label>
                <script>
                  $(document).ready(function(){
                    $('#inputAvatar').change( function() {
                var tmppath = URL.createObjectURL(event.target.files[0]);
                    
                    $("#imgAvatar").attr('src',tmppath);       
                });
                  });
                </script>
            </div>
        </div>
        </div>
          
        <div class="col-lg-8">
          <div class="card mb-4">
            <div class="card-header d-flex justify-content-between">
              <span><%= messages.getString("cap_nhat_thong_tin_tk") %></span>
              <a href="${pageContext.request.contextPath }/login?action=logout" title="Đăng xuất"> <i style="font-size: 20px;" class="fa-solid fa-right-from-bracket"></i></a>
            </div>
            <div class="card-body">
       
                    <!-- Form Group (username)-->
                    <div class="mb-3">
                        <label class="small mb-1" for="inputUsername"><span style="color: red;">*</span> <%= messages.getString("ho_va_ten") %> </label>
                        <input class="form-control" name="fullName" id="inputUsername" value="${sessionScope.accountdetails != null ? sessionScope.accountdetails.name : "" }" type="text" placeholder="<%= messages.getString("nhap_ten_cua_ban") %>" title="Nhập họ và tên của bạn" required>
                    </div>
                <div class="mb-3">
                    <label class="small mb-1" for="inputCurrentPass"><%= messages.getString("mk_hien_tai") %></label>
                    <span class="small mb-1" style="color: orange;">(<%= messages.getString("mk_mac_dinh") %>)</span>
                    <input class="form-control" name="currentPass" id="inputCurrentPass"   type="password" placeholder="<%= messages.getString("nhap_mk_hien_tai") %>">
                </div>
                    <div class="mb-3">
                      <label class="small mb-1" for="inputPassword"><%= messages.getString("mk_moi") %></label>
                      <input class="form-control" name="newPass" id="inputPassword"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,}" type="password" placeholder="<%= messages.getString("nhap_mk_moi") %>" title="Nhập mật khẩu mới, mật khẩu phải có chiều dài >8 ký tự, có ký tự viết hoa và ký tự đặc biệt">
                  </div>
                  <div class="mb-3">
                    <label class="small mb-1" for="inputUsername"><%= messages.getString("xac_nhan_mk") %></label>
                    <input class="form-control" name="confirm" id="inputConfirmPassword" type="password" placeholder="<%= messages.getString("nhap_lai_mk") %>" title="Nhập lại mật khẩu để xác nhận, phải trùng với mật khẩu mới đã nhập">
                  </div>
                  <script>
                    var password = document.getElementById("inputPassword")
                      , confirm_password = document.getElementById("inputConfirmPassword");

                    function validatePassword(){
                      if(password.value != confirm_password.value) {
                        confirm_password.setCustomValidity("Passwords Don't Match");
                      } else {
                        confirm_password.setCustomValidity('');
                      }
                    }

                    password.onchange = validatePassword;
                    confirm_password.onkeyup = validatePassword;
                  </script>
                  <div class="mb-3">
                    <label class="small mb-1" for="inputAddress"><span style="color: red;">*</span> <%= messages.getString("dia_chi") %></label>
                    <input class="form-control" name="address" id="inputAddress" type="text" value="${sessionScope.accountdetails != null ? sessionScope.accountdetails.address : "" }" placeholder="<%= messages.getString("nhap_dia_chi") %>" title="Nhập địa chỉ của bạn" required>
                </div>
                    <!-- Form Group (email address)-->
                    <div class="mb-3">
                        <label class="small mb-1" for="inputEmailAddress">Email</label>
                        <input class="form-control" name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" id="inputEmailAddress" type="email" placeholder="<%= messages.getString("nhap_email") %>" title="Nhập email của bạn">
                    </div>
                    <!-- Form Row-->
                    <div class="row gx-3 mb-3">
                        <!-- Form Group (phone number)-->
                        <div class="col-md-6">
                            <label class="small mb-1" for="inputPhone"><span style="color: red;">*</span> <%= messages.getString("phone") %></label>
                            <input class="form-control" value="${sessionScope.accountdetails != null ? sessionScope.accountdetails.phonenumber : "" }" name="phoneNumber" id="inputPhone" pattern="(\(\+[0-9]{2}\)|0)([0-9]{9,10})" type="tel" placeholder="<%= messages.getString("nhap_phone") %>" title="Nhập số điện thoại của bạn" required>
                        </div>
                        <!-- Form Group (birthday)-->
                        <div class="col-md-6">
                            <label class="small mb-1"><span style="color: red;">*</span> <%= messages.getString("ngay_sinh") %></label>
                            <f:formatDate value="${sessionScope.accountdetails.birthday }" pattern="dd/MM/yyyy" var="birthday" />
                            <input class="form-control" id="datepicker" value="${sessionScope.accountdetails != null ? birthday : "" }"  type="text" name="birthday" placeholder="<%= messages.getString("nhap_dob") %>" title="Chọn ngày sinh của bạn" required>
                        </div>
                    </div>
                    <!-- Save changes button-->
                  <button class="btn btn-primary" type="submit"><%= messages.getString("cap_nhat") %></button>
               </form>
            </div>
        </div>
         
        </div>
      </div>
    </div>
  </div>
