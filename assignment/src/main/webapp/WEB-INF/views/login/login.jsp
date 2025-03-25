<%@page import="service.MailHelper"%>
<%@page import="models.Log"%>
<%@page import="java.util.List"%>
<%@page import="dao.LogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/c/CodingLabYT-->
<html lang="en" dir="ltr">

<head>
  <meta charset="UTF-8" />
  <!--<title> Login and Registration Form in HTML & CSS | CodingLab </title>-->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/login/style.css" />
  <!-- Fontawesome CDN Link -->
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
  />
  <script
    src="https://code.jquery.com/jquery-3.7.1.js"
    integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
    crossorigin="anonymous"
  ></script>
  <link
    rel="stylesheet"
    href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"
  />
  <link rel="stylesheet" href="/resources/demos/style.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
  <script>
    $(function () {
      $("#datepicker").datepicker({ dateFormat: "dd-mm-yy" });
    });
  </script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
 

</head>
<%
	HttpSession session2 = request.getSession();
	String errorAccount = (String) session2.getAttribute("msg");
	String errorAccount1 = errorAccount;
	session2.removeAttribute("msg");


	String email = "tuhoangnguyen2003@gmail.com";
	
%>
 		<%
            	if(errorAccount1 != null) {
            		
        %>
            <script>
				alert("<%= errorAccount1 %>");
            </script> 
            <%} %>
<body>
  <div class="container">
    <input type="checkbox" id="flip" />
    <div class="cover">
      <div class="front">
        <img src="${pageContext.request.contextPath }/assets/login/Images/bannerApartment.jpg" alt="" />
        <div class="text">
          <span class="text-1">Bắt đầu khám phá những tiện ích<br />
            cao cấp nhất</span>
          <span class="text-2">Hãy kết nối với chúng tôi</span>
        </div>
      </div>
      <div class="back">
        <img class="backImg" src="${pageContext.request.contextPath }/assets/login/Images/apartment.jpg" alt="" />
        <div class="text">
          <span class="text-1">Complete miles of journey <br />
            with one step</span>
          <span class="text-2">Let's get started</span>
        </div>
      </div>
    </div>
    <div class="forms">
      <div class="form-content">
        <div class="login-form">
          <div class="title">Đăng nhập</div>
          <br>
          <% 
          HttpSession session1 = request.getSession();
          	String msg = (String)session1.getAttribute("msg");
          	String mess = msg;
          	session1.removeAttribute("msg");
          
          %>
          		<div class="text" style="color:red; font-weight: bold;"><%= msg!=null ? msg : "" %></div>
          <form action="${pageContext.request.contextPath }/login?action=login" method="post">
            <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-user"></i>
                <input type="text" id="username" name="username" placeholder="Tên đăng nhập" required/>
              </div>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password"  id="password" name="password" placeholder="Mật khẩu" required/>
                <span class="toggle-newPassword" onclick="showPasswordLogin()">
                  <i class="far fa-eye"></i>
                </span>
              </div>
 		
              <div class="text"><a href="${pageContext.request.contextPath }/email" id="myBtn">Quên mật khẩu</a></div>
              <div class="button input-box">
                
                <input type="submit"  value="Đăng nhập" id="submit"/>
              </div>
              <div class="text sign-up-text">
                Bạn chưa có tài khoản? <label for="flip">Đăng ký ngay!</label>
              </div>
              <a style="text-decoration: none" href="https://accounts.google.com/o/oauth2/auth?
	scope=email&redirect_uri=http://localhost:8080/projectGroup6/login-google&
	response_type=code&client_id=818352606855-64naicbsoagu0cdmr6af6n1hmrv37a8q.apps.googleusercontent.com
	&approval_prompt=force">
	              <div class="text sign-up-text" style="width: 45%;border: 1px solid #d4d1d3;border-radius: 7px;display: flex;justify-content: center;transform: translateX(50%);cursor: pointer">
	              	<p style="margin: auto;font-weight: bold;">Google</p>
	              	<img class="rounded  d-block rounded-circle" style="margin: 6px 20px 8px 0;" src="${pageContext.request.contextPath }/assets/user/images/google.png" width="30" height="30">
	              </div>
              </a>
            </div>
          </form>
        </div>
        <div class="signup-form">
          <div class="title">Đăng ký</div>
          <form action="${pageContext.request.contextPath }/login?action=register" method="post">
            <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-user"></i>
                <input type="text" id="name" name="username" placeholder="Nhập tên đăng nhập"  />
              </div>
              <span id="errorName"></span>
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="email" id="email" name="email" placeholder="Nhập email"  />
              </div>
              <span id="errorEmail"></span>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" id="newPassword" name="password" placeholder="Nhập mật khẩu"  />
                <span class="toggle-newPassword" onclick="showPasswordRegister()">
                  <i class="far fa-eye"></i>
                </span>
              </div>
              <span id="errorNewPass"></span>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" id="confirmPassword" placeholder="Nhập lại mật khẩu"  />
                <span class="toggle-confirmPassword" onclick="showConfirmPasswordRegister()">
                  <i class="far fa-eye"></i>
                </span>
              </div>
              <span id="errorConfirmPass"></span>
              <div class="button input-box">
                <input type="submit" value="Đăng ký" onclick="return checkSignIn();" id="submitRegister"/>
              </div>
              <div class="text sign-up-text">
                Bạn đã có tài khoản ? <label for="flip">Đăng nhập ngay</label>
              </div>
                <a style="text-decoration: none" href="https://accounts.google.com/o/oauth2/auth?
	scope=email&redirect_uri=http://localhost:8080/projectGroup6/signup-google&
	response_type=code&client_id=818352606855-64naicbsoagu0cdmr6af6n1hmrv37a8q.apps.googleusercontent.com
	&approval_prompt=force">
	              <div class="text sign-up-text" style="width: 45%;border: 1px solid #d4d1d3;border-radius: 7px;display: flex;justify-content: center;transform: translateX(50%);cursor: pointer">
	              	<p style="margin: auto;font-weight: bold;">Google</p>
	              	<img class="rounded  d-block rounded-circle" style="margin: 6px 20px 8px 0;" src="${pageContext.request.contextPath }/assets/user/images/google.png" width="30" height="30">
	              </div>
              </a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- Trigger/Open The Modal -->
 
  <!-- The Modal -->
  <div id="modal" class="modal">
    <div class="modal-content">
      <span class="close">&times;</span>
      <h2>Cảnh báo</h2>
      <p id="empty"></p>
    </div>
  </div>

  </div>
  <script src="${pageContext.request.contextPath }/assets/login/login.js"></script>
</body>

</html>