<%@page import="models.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
	HttpSession httpSession = request.getSession();
	Account account = (Account) httpSession.getAttribute("account");
	
%>
<div class="container my-5">
  <div class="row justify-content-center my-5">
    <div class="col-md-6 my-5" style="height: 30em;">
      <h2 class="text-center mb-4">Nạp Tiền</h2>
      <form action="${pageContext.request.contextPath }/payment" method="post">
        <div class="form-group">
          <label for="amount" class="mb-2">Nhập số tiền bạn muốn nạp:</label>
          <input type="text" class="form-control mb-3" name="amount" id="amount" placeholder="Nhập số tiền">
        </div>
        <div class="form-group">
          <label for="paymentMethod" class="mb-2">Chọn phương thức thanh toán:</label>
          <div class="btn-group btn-group-toggle d-flex" data-toggle="buttons">
            <label class="btn btn-primary flex-fill mr-1">
             <input type="radio" name="vnpay" id="option1" autocomplete="off" checked> VNPAY
            </label>
            <label class="btn btn-primary flex-fill ml-1">
              <input type="radio" name="paypal" id="option2" autocomplete="off"> PayPal
            </label>
          </div>
        </div>
        <button type="submit" class="btn btn-success btn-block mt-3">Nạp tiền</button>
      </form>
    </div>
  </div>
</div>