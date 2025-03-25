<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	HttpSession httpSession = request.getSession();
	if(httpSession.getAttribute("language")== null){
		request.getSession().setAttribute("language", "vi");
		
	}
	String language = httpSession.getAttribute("language").toString();
	ResourceBundle messages = ResourceBundle.getBundle("messages", new Locale(language));
%>
  <div class="page-heading header-text">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <span class="breadcrumb"><a href="${pageContext.request.contextPath}/home"><%= messages.getString("trang_chu") %></a></span>
          <h3> <%= messages.getString("lien_he_chung_toi") %></h3>
        </div>
      </div>
    </div>
  </div>

  <div class="contact-page section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="section-heading">
            <h6>| <%= messages.getString("lien_he_voi_chung_toi") %></h6>
            <h2><%= messages.getString("dung_ngan_ngai") %></h2>
          </div>
          <p><%= messages.getString("he_thong_nha_o_cam_on") %></p>
          <div class="row">
            <div class="col-lg-12">
              <div class="item phone">
                <img src="${pageContext.request.contextPath}/assets/user/images/phone-icon.png" alt="" style="max-width: 52px;">
                <h6>18001515<br><span><%= messages.getString("duong_day_nong") %></span></h6>
              </div>
            </div>
            <div class="col-lg-12">
              <div class="item email">
                <img src="${pageContext.request.contextPath}/assets/user/images/email-icon.png" alt="" style="max-width: 52px;">
                <h6>apart@gmail.com<br><span><%= messages.getString("email_cua_chung_toi") %></span></h6>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <form id="contact-form" action="${pageContext.request.contextPath }/contact?action=contact" method="post">
            <div class="row">
              <div class="col-lg-12">
                <fieldset>
                  <span style="color: red;">* </span><label for="name"><%= messages.getString("ho_va_ten") %></label>
                  <input type="name" name="name" id="name" placeholder="<%= messages.getString("nhap_ten_cua_ban") %>" autocomplete="on" required>
                </fieldset>
              </div>
               <div class="col-lg-12">
                <fieldset>
                  <span style="color: red;">* </span><label for="email"><%= messages.getString("phone") %></label>
                  <input type="text" name="phoneNumber" id="phoneNumber" pattern="(\(\+[0-9]{2}\)|0)([0-9]{9,10})" type="tel" placeholder="<%= messages.getString("nhap_phone") %>" required>
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <span style="color: red;">* </span><label for="email"><%= messages.getString("email_cua_ban") %></label>
                  <input type="text" name="email" id="email" pattern="[^ @]*@[^ @]*" placeholder="<%= messages.getString("nhap_thu_dien_tu") %>" required="">
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <label for="subject"><%= messages.getString("tieu_de") %></label>
                  <input type="subject" name="subject" id="subject" placeholder="<%= messages.getString("nhap_tieu_de") %>" autocomplete="on" required="">
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <label for="message"><%= messages.getString("thong_diep") %></label>
                  <textarea name="message" id="message" required="" placeholder="<%= messages.getString("nhap_thong_diep") %>"></textarea>
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <button type="submit" id="form-submit" class="orange-button"><%= messages.getString("gui") %></button>
                </fieldset>
                <br>
                <%
                	HttpSession session1 = request.getSession();
                	String success = (String) session1.getAttribute("success");
                	String success1 = success;               	
                	session1.removeAttribute("success");
                %>
              <c:if test="<%= success1 != null %>">
              	<script>
              		alert('<%= success1 %>');
              	</script>
              </c:if>
              </div>
            </div>
          </form>
        </div>
        <div class="col-lg-12">
          <div id="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31355.769673958534!2d106.67776287966731!3d10.775176369887062!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f38f9ed887b%3A0x14aded5703768989!2zUXXhuq1uIDEsIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaCwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1697898273223!5m2!1svi!2s" width="100%" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
          </div>
        </div>
      </div>
    </div>
  </div>