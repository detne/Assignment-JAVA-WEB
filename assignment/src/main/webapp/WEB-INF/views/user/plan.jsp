<%@page import="dao.AccountDetailsDAO"%>
<%@page import="models.Accountdetails"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="models.Duration"%>
<%@page import="models.AccountService"%>
<%@page import="models.Account"%>
<%@page import="models.Invoice"%>
<%@page import="models.Service"%>
<%@ page import="dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	HttpSession httpSession = request.getSession();
	ServiceDAO serviceDAO = new ServiceDAO();
	InvoiceDAO invoiceDAO = new InvoiceDAO();
	DurationDAO durationDAO = new DurationDAO();
	AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
	Accountdetails accountdetails = new Accountdetails();
	AccountServiceDAO accountServiceDAO = new AccountServiceDAO();
	Account account = (Account)  httpSession.getAttribute("account") == null ? new Account() : (Account)  httpSession.getAttribute("account");
	accountdetails = accountDetailsDAO.findAccountByAccountID(account.getId());
	AccountService accountService = accountServiceDAO.findAccountByAccountId(account.getId());
	int serviceId = (accountService != null) ? accountService.getServiceID() : 0;
	boolean isBuyed = (accountService != null) ? accountService.isStatus() : false;
	String msg = (String) httpSession.getAttribute("msg");
	String msg1 = msg;
	httpSession.removeAttribute("msg");
	if(httpSession.getAttribute("language")== null){
		request.getSession().setAttribute("language", "vi");
		
	}
	String language = httpSession.getAttribute("language").toString();
	ResourceBundle messages = ResourceBundle.getBundle("messages", new Locale(language));
	ServiceLanguageDAO postLanguageModel = new ServiceLanguageDAO();
	LanguageDAO languageDAO = new LanguageDAO();
	ServiceLanguageDAO serviceLanguageDAO = new ServiceLanguageDAO();
	DurationLanguageDAO durationLanguageDAO = new DurationLanguageDAO();
%>
<c:if test="<%= msg1 != null %>">
	<script>
		alert('<%=msg1 %>')
	</script>
</c:if>
<style>
.popup-container, .popup-container-vnpay, .popup-container-paypal {
	display:none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
    z-index: 1001;
    max-width: 400px;
    width: 90%; 
    text-align: center; 
}

.popup-container h1 {
    font-size: 24px;
    margin-bottom: 20px;
}
.close-button {
    position: absolute;
    top: 0px;
    right: 2px;
    background-color: transparent;
    border: none;
    font-size: 20px;
    cursor: pointer;
    outline: none;
}

.popup-content {
    display: flex;
    justify-content: center;
}

.payment-option {
    cursor: pointer;
    margin: 10px;
    padding: 10px;
    border-radius: 5px;
    transition: all 0.3s;
    width: 150px; 
}

.payment-option:hover {
    transform: translateY(-5px);
}

.payment-option img {
    width: 100%;
    height: auto;
    border-radius: 5px;
}

.plan-duration select {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #f9f9f9;
	color: #333;
	font-size: 16px;
	transition: border-color 0.3s, box-shadow 0.3s;
}

.plan-duration select:focus {
	border-color: #007bff;
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
	outline: none;
}
.plan-button input[type="submit"] {
	display: inline-block;
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s;
	border: none;
	cursor: pointer;
}

.plan-button input[type="submit"]:hover {
	background-color: #0056b3;
}

.wrapper {
	width: 100%;
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

.pricing-yearly {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
}
  .plan-button input[type="submit"]:disabled {
        cursor: no-drop !important;
        background-color: #ccc;
        color: #666;
    }
  .plan-button input[type="submit"]:disabled:hover {
	cursor: no-drop !important;
}

</style>
	<script>
		$(document).ready(function() {
			$('#rechargeBtn').click(function() {
				var account = '<%= account.getId() %>';
				var accountDetails = '<%= accountdetails %>';
					if (account == 0) {
	                    alert("Bạn chưa có tài khoản để thực hiện chức năng nạp tiền!");
	                } 
                	if(accountDetails === "null"){
	                	 alert("Bạn cần phải cập nhật thông tin tài khoản để nạp tiền!");
	                } 
	                if(account != 0 && accountDetails !== "null"){
	                	$('.popup-container').css('display', 'block');
		            }
			})
			/* $('.payment-option').click(function() {
				$('.popup-container-vnpay').css('display','block');
				$('.popup-container').css('display','none');
			}) */
			$('#vnpay-option').click(function() {
				$('.popup-container-vnpay').css('display','block');
				$('.popup-container').css('display','none');
			})
			$('#paypal-option').click(function() {
				$('.popup-container-paypal').css('display','block');
				$('.popup-container').css('display','none');
			})
		});

		function closePopup() {
			 var popup = document.querySelector('.popup-container');
			 var popupvnpay = document.querySelector('.popup-container-vnpay');
			 var popuppaypal = document.querySelector('.popup-container-paypal');
			 popup.style.display = 'none';
			 popupvnpay.style.display = 'none';
			 popuppaypal.style.display = 'none';
		}
	</script>
	<br>
	<br>
	<%-- <form action="${pageContext.request.contextPath}/payment" method="post">
		<input type="number" name="amount">
		<input type="submit" value="Submit">
	</form> --%>
	<div class="container">
		<div>
			<button id="rechargeBtn" class="btn btn-primary mx-3">Nạp tiền</button>
		</div>
		<h4>Bạn có thể sử dụng 2 phương thức là VNPay hoặc là Paypal, đối với Paypal sẽ có tỉ giá mới nhất chuyển đổi từ USD sang VND theo tỉ giá mà dịch vụ chúng tôi sử dụng</h4>
	<br>
	<h4>Tỉ giá USD sang VND hiện tại: ${usdSellRate }</h4>
	</div>
	
<div class="wrapper">
		<div class="pricing-content">
			<div class="PageWidth">
				<div class="pricing-detail-content">
			
				<div class="pricing-content-items-tabs">
					<div class="pricing-yearly">
				<% for(Service service : serviceDAO.findAll()) { %>
						<form action="${pageContext.request.contextPath}/plan" method="get">
							<input type="hidden" name="action" value="buy">
							<input type="hidden" name="id" value="<%= service.getId() %>">
							<div class="pricing-item">
								<div class="pricing-item-box">
									<c:if test="<%= serviceId == service.getId() %>">
										<span class="ribbon"></span>
									</c:if>
									<div class="plan-name"><%= serviceLanguageDAO.find(service.getId(), languageDAO.findByLanguageID(language).getId()) != null ? serviceLanguageDAO.find(service.getId(), languageDAO.findByLanguageID(language).getId()).getName() : service.getName()%></div>
									<div class="plan-text"><%=  serviceLanguageDAO.find(service.getId(), languageDAO.findByLanguageID(language).getId()) != null ? serviceLanguageDAO.find(service.getId(), languageDAO.findByLanguageID(language).getId()).getIntroduction() : service.getIntroduction() %></div>
									<div class="plan-price-content">
										<div class="plan-price"><%= service.getPrice() %> VND</div>
									</div>
									<div class="plan-features">
										<div class="plan-feature-item"><%=  serviceLanguageDAO.find(service.getId(), languageDAO.findByLanguageID(language).getId()) != null ? serviceLanguageDAO.find(service.getId(), languageDAO.findByLanguageID(language).getId()).getDescription() : service.getDescription()  %></div>
									</div>
									<div class="plan-duration">
										<select name="duration" required="required">
											<% for(Duration duration : durationDAO.findAll()) { %>
												<option value="<%= duration.getId() %>"><%= durationLanguageDAO.find(duration.getId(), languageDAO.findByLanguageID(language).getId()) != null ? durationLanguageDAO.find(duration.getId(), languageDAO.findByLanguageID(language).getId()).getName() : duration.getName()%></option>
											<% } %>
										</select>
									</div>
									<div class="plan-button">
										<c:if test="<%= isBuyed %>">
											<input type="submit" value="Mua ngay" disabled="disabled">
										</c:if>
										<c:if test="<%= !isBuyed %>">
											<input type="submit" value="Mua ngay">
										</c:if>
									</div>
								</div>
							</div>
						</form>
						<% } %>


				</div>			
			</div>
			</div>
	

	
		</div>
		</div>
		
	</div>
	
 
    <!-- Popup -->
	<div class="popup-container">
	<h1>Vui lòng chọn phương thức thanh toán</h1>
	<button class="close-button" onclick="closePopup()">x</button>
    <div class="popup-content">
        <div class="payment-option" id="vnpay-option">
            <img src="${pageContext.request.contextPath }/assets/user/images/vnpay-logo.jpg" alt="VNPAY Logo">
        </div>
        <div class="payment-option" id="paypal-option">
            <img src="${pageContext.request.contextPath }/assets/user/images/paypal-logo.webp" alt="PayPal Logo">
        </div>
    </div>
    </div>
    
    <div id="vn-pay" class="popup-container-vnpay" style="display: none">
	<h1>Vui lòng nhập số tiền</h1>
	<button class="close-button" onclick="closePopup()">x</button>
    <div class="popup-content">
       <form action="${pageContext.request.contextPath }/payment" method="POST">
       		<div class="input-group mb-3">
			  <input type="text" class="form-control" name="amount" placeholder="Nhập số tiền" required>
			  <div class="input-group-append">
			    <span class="input-group-text">VND</span>
			  </div>
			</div>
       		<input type="submit" class="btn btn-primary" value="Nạp tiền">
       </form>
    </div>
    </div>
    
    <div id="paypal" class="popup-container-paypal" style="display: none">
	<h3 class="py-3">Vui lòng nhập số tiền</h3>
	<h6>Tỉ giá USD hiện tại: ${usdSellRate }</h6>
	<button class="close-button" onclick="closePopup()">x</button>
	<div class="popup-content">
		<form method="post"
			action="https://www.sandbox.paypal.com/cgi-bin/webscr">
			<div class="input-group mb-3">
			<input type="hidden" name="business"
				value="sb-tseqm29238642@business.example.com"> <input
				type="hidden" name="item_number_1" value="1"> <input
				type="hidden" name="item_name_1" value="Nap tien vao tai khoan">
			<input type="text" name="amount_1" class="form-control rounded-2"> &nbsp; $ <input type="hidden"
				name="item_quantity_1" value="1"> <input type="hidden"
				name="upload" value="1"> <input type="hidden" name="return"
				value="http://localhost:8080/projectGroup2/payment?action=returnPaypal">
			<input type="hidden" name="cmd" value="_cart">
			</div>
			<button type="submit" class="btn btn-primary">Nạp tiền</button>
		</form>
	</div>
</div>
    
    
<script type="text/javascript">
	$(document).ready(function(){
  $("#tab1").click(function(){
  
   $('.pricing-monthly').addClass('active-tab-content');
   $('.pricing-yearly').hide();
   $(this).addClass('tab-active');
     $('#tab2').removeClass('tab-active');
 
  });
 $("#tab2").click(function(){
  
   $('.pricing-monthly').removeClass('active-tab-content');
   $('.pricing-yearly').show();
  $(this).addClass('tab-active');
     $('#tab1').removeClass('tab-active');
  });


  });


</script>
