<%@page import="models.AccountService"%>
<%@page import="dao.ChatDAO"%>
<%@page import="models.Account"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="models.Post"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

  <title>Apartment</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/assets/user/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- Additional CSS Files -->
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/user/css/fontawesome.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/user/css/templatemo-villa-agency.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/user/css/owl.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/user/css/animate.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/user/css/edit.css">
  <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

<%--   <script src="${pageContext.request.contextPath}/assets/user/vendor/jquery/jquery.min.js"></script> --%>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css"> 
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script> 
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
   <script>
  $( function() {
    $( "#datepicker" ).datepicker({
        dateFormat: 'dd/mm/yy'
    });
    
 
    
    
 
  });

  </script> 
  <script>
  $( function() {
    $( document ).tooltip();
  } );
  </script>
<!--

TemplateMo 591 villa agency

https://templatemo.com/tm-591-villa-agency

-->
</head>
<%
	
	HttpSession httpSession = request.getSession();
	ServletContext context = request.getServletContext();
	List<AccountService> accountServices = (List<AccountService>) context.getAttribute("services");
	Account account = null;
	String msgService = "";

	if(httpSession.getAttribute("account") != null && accountServices != null){
		account = (Account) httpSession.getAttribute("account");
		for(int i = 0; i < accountServices.size(); i++){
			if(accountServices.get(i).getAccountID() == account.getId()){
				msgService = (String) context.getAttribute("notiService");
				System.out.println(accountServices.get(i));
				System.out.println(i);
				accountServices.remove(i); 
			}
		}
		
	}
	System.out.println(msgService);
	ChatDAO chatDAO = new ChatDAO();
	if(httpSession.getAttribute("language")== null){
		request.getSession().setAttribute("language", "vi");
		
	}
	String language = httpSession.getAttribute("language").toString();
	ResourceBundle messages = ResourceBundle.getBundle("messages", new Locale(language));

%>
<body>
	<% if(!msgService.equals("")){ %>
		<script>
	
		$(function() {
		 $( "#dialog" ).dialog(); 
			alert('aaa');
		  } );
		</script>
	<%} %>
  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div> 
  <!-- ***** Preloader End ***** -->
<div id="dialog" title="Thông báo" style="display: none;">
  <p><%= msgService %></p>
</div>
  <div class="sub-header">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-8">
          <ul class="info">
            <li><i class="fa fa-envelope"></i> group5fpt@gmail.com</li>
            <li><i class="fa fa-map"></i> Ngũ Hành Sơn, Đà Nẵng </li>
              <li><a href="${pageContext.request.contextPath}/language?action=vi">Việt Nam</a>
				<a href="${pageContext.request.contextPath}/language?action=en">England</a>
				</li>
          </ul>
        </div>
        <div class="col-lg-4 col-md-4">
          <ul class="social-links">
           <c:if test="${sessionScope.account != null }">
           		 <li><img style="border-radius: 25%;" src="${pageContext.request.contextPath}/assets/user/images/${sessionScope.accountdetails.avatar != null ? sessionScope.accountdetails.avatar : "Unknown_person.jpg"}" height="50" width="50" alt=""></li>
            <li>${sessionScope.accountdetails.name!=null ? sessionScope.accountdetails.name : "Chào bạn mới, vui lòng cập nhật tài khoản" }</li>
           	
            <span style="position: relative;top: 24px;left: -72px;">Số dư: ${sessionScope.accountdetails.balance} VND</span>
           </c:if>
            
          </ul>
        </div>
      </div>
    </div>
  </div>

  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="${pageContext.request.contextPath }/home" class="logo">
                        <h1>Apartment</h1>
                    </a>
                    <!-- ***** Logo End ***** -->
                    <!-- ***** Menu Start ***** -->
                    <%
                    	HttpSession session1 = request.getSession();
                    	List<Post> posts = (List<Post>) session1.getAttribute("posts");
                    	
                    %>
                    <ul class="nav">
                      <li><a href="${pageContext.request.contextPath }/home" class="${activeHome }"><%= messages.getString("trang_chu") %></a></li>
                      <li><a href="${pageContext.request.contextPath }/userapartment" class="${activeUser }"><%= messages.getString("can_ho_khac") %></a></li>
                      <li><a href="${pageContext.request.contextPath }/chatuser" class="${activeSystem }"><%= messages.getString("nhan_tin") %> <%= account!= null ? "<sup id='msgNoti' style='font-size: 20px;'></sup>" : "" %></a></li>
                      <li><a href="${pageContext.request.contextPath }/contact" class="${activeContact }"><%= messages.getString("lien_he") %></a></li>
                      <li><a href="${pageContext.request.contextPath }/plan" class="${activePlan }"><%= messages.getString("dich_vu") %></a></li>
                      <li><a style="border: 2px solid #f35525; border-radius: 20px;" href="${pageContext.request.contextPath }/wishlist"><i class="fa-solid fa-heart" style="color:#f35525 ;">
                      </i><span id="total_item" style="position: relative;left: 5px;top: -10px;color: #f35525;"><%= posts != null ? posts.size() : 0 %></span></a></li>
                      <li><a style="border-radius: 20px;  background-color: #f35525; color: black;" href="${pageContext.request.contextPath }/postapartment"><i class="fa fa-pen"></i> <%= messages.getString("dang_tin") %></a></li>
                      <li><a href="${pageContext.request.contextPath }/account"><i class="fa fa-user"></i><%= messages.getString("tai_khoan") %></a></li>
                  </ul>   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
  </header>
  <% if(account!= null){ %>
  	  <input type="hidden" value="<%= httpSession.getAttribute("msgNoti") %>" id="oldMSG">
  	   <script>
 function notificationMSG() {

		var oldMSG = $('#oldMSG').val();
		/* if (window.location.href == 'http://localhost:8080/projectGroup2/admin/feedback') {
			var test = 'aaa';
		} */
		if (window.location.href == 'http://localhost:8080/projectGroup2/chatuser') {
			var test = 'aaa';
		}
		$
				.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath}/msgnotification',
					data : {
						oldMSG : oldMSG,
						test: test
					},
					success : function(data) {
						/* if (window.location.href == 'http://localhost:8080/projectGroup2/admin/feedback') {
							$('#feedbackNoti').html(0);
						} else {
							if ((data - oldFeedback) < 0) {
								$('#feedbackNoti').html(0);
							} else {
								$('#feedbackNoti').html(data - oldFeedback);
							}

						} */
						 if (window.location.href == 'http://localhost:8080/projectGroup2/chatuser') {
							 $('#msgNoti').html("");
							} else if(data){
								$('#msgNoti').html("♥");
							}
						
					}
				});

	}
	setInterval(notificationMSG, 3000);
 </script>
  <%} %>

	
  <!-- ***** Header Area End ***** -->
		<jsp:include page="${p}"></jsp:include>
  <footer>
    <div class="container">
      <div style="margin-left: 250px;" class="col-lg-8">
        <p><%= messages.getString("footer") %>
        
        <a rel="nofollow" href="${pageContext.request.contextPath }/home" target="_blank">Apartment</a></p>
      </div>
    </div>
  </footer>

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
  
 <%--  <script src="${pageContext.request.contextPath}/assets/user/vendor/jquery/jquery.min.js"></script> --%>
  <script src="${pageContext.request.contextPath}/assets/user/vendor/bootstrap/js/bootstrap.min.js"></script> 
  <script src="${pageContext.request.contextPath}/assets/user/js/isotope.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/user/js/owl-carousel.js"></script>
  <script src="${pageContext.request.contextPath}/assets/user/js/counter.js"></script>
  <script src="${pageContext.request.contextPath}/assets/user/js/custom.js"></script>
  <script src="${pageContext.request.contextPath}/assets/user/js/pagination.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

  </body>
</html>