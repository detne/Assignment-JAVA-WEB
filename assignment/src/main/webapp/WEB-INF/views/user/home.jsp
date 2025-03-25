<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%
	
	HttpSession httpSession = request.getSession();
	if(httpSession.getAttribute("language")== null){
		request.getSession().setAttribute("language", "vi");
		
	}
	String language = httpSession.getAttribute("language").toString();
	ResourceBundle messages = ResourceBundle.getBundle("messages", new Locale(language));
%>
  <div class="main-banner">
    <div class="owl-carousel owl-banner">
      <div class="item item-1">
        <div class="header-text">
          <span class="category"><em><%= messages.getString("can_ho_cua_chung_toi") %></em></span>
          <h2>ApaRTMENT!<br><%= messages.getString("cung_cap_nhung_can_ho_cao_cap_nhat") %></h2>
        </div>
      </div>
      <div class="item item-2">
        <div class="header-text">
          <span class="category"><em><%= messages.getString("cac_can_ho_khac") %></em></span>
          <h2><%= messages.getString("chung_toi") %><br><%= messages.getString("cung_cap_cac_can_ho_cao_cap_uy_tin_khac") %></h2>
        </div>
      </div>
      <div class="item item-3">
        <div class="header-text">
          <span class="category"><em><%= messages.getString("san_moi_gioi") %></em></span>
          <h2><%= messages.getString("san_moi_gioi") %><br><%= messages.getString("ky_gui_cac_can_ho_cua_ban") %></h2>
        </div>
      </div>
     
    </div>
  </div>

  <div class="featured section">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="left-image">
            <img src="${pageContext.request.contextPath}/assets/user/images/featured.jpg" alt="">
             <a href="${pageContext.request.contextPath}/userapartmentdetails"><img src="${pageContext.request.contextPath}/assets/user/images/featured-icon.png" alt="" style="max-width: 60px; padding: 0px;"></a>
          </div>
        </div>
        <div class="col-lg-5">
          <div class="section-heading">
            <h6>| <%= messages.getString("ve_apartment") %></h6>
            <h2><%= messages.getString("dich_vu_cung_cap_can_ho_tot_nhat") %></h2>
          </div>
          <div class="accordion" id="accordionExample">
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                  *<%= messages.getString("cac_can_ho_cua_chung_toi") %>.
                </button>
              </h2>
              <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                <%= messages.getString("chung_toi") %> <strong><%= messages.getString("chuyen_cung_cap_va_quan_ly") %></strong> <%= messages.getString("cac_can_ho_cao_cap_tren_dia_ban_TP_Ho_Chi_Minh") %>. <span style="color: blue;"><%= messages.getString("phan_phoi_va_quan_ly_hon_100_can_ho") %>, </span><%= messages.getString("buoc_dem_dau_tien_trong_tam_nhin") %>.</div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                  * <%= messages.getString("cung_cap_nhung_can_ho_khac") %>.
                </button>
              </h2>
              <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <%= messages.getString("ngoai_ra_chung_toi_con_cung_cap") %>.
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                  *<%= messages.getString("san_moi_gioi_ky_gui_bat_dong_san_uy_tin") %>.
                </button>
              </h2>
              <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                 <%= messages.getString("chung_toi_cung_cap_va_tu_van") %>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="info-table">
            <ul>
              <li>
                <img src="${pageContext.request.contextPath}/assets/user/images/info-icon-03.png" alt="" style="max-width: 52px;">
                <h4><%= messages.getString("can_ho_cao_cap_nhat") %></h4>
              </li>
              <li>
                <img src="${pageContext.request.contextPath}/assets/user/images/info-icon-01.png" alt="" style="max-width: 52px;">
                <h4><%= messages.getString("tren_khap_TPHCM") %></h4>
              </li>
              <li>
                <img src="${pageContext.request.contextPath}/assets/user/images/info-icon-04.png" alt="" style="max-width: 52px;">
                <h4><%= messages.getString("an_toan_va_uy_tin") %></h4>
              </li>
            
              
              <li>
                <img src="${pageContext.request.contextPath}/assets/user/images/info-icon-02.png" alt="" style="max-width: 52px;">
                <h4><%= messages.getString("hop_dong_nhanh_chong") %></h4>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="video section">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 offset-lg-4">
          <div class="section-heading text-center">
            <h6>| <%= messages.getString("video_can_ho") %></h6>
            <h2><%= messages.getString("xem_video_chi_tiet") %></h2>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="video-content">
    <div class="container">
      <div class="row">
        <div class="col-lg-10 offset-lg-1">
          <div class="video-frame">
            <img src="${pageContext.request.contextPath}/assets/user/images/video-frame.jpg" alt="">
            <a href="https://www.youtube.com/watch?v=nM2PWSDaQhE" target="_blank"><i class="fa fa-play"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="fun-facts">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="wrapper">
            <div class="row">
              <div class="col-lg-4">
                <div class="counter">
                  <h2 class="timer count-title count-number" data-to="5" data-speed="1000"></h2>
                   <p class="count-text "><%= messages.getString("he_thong_tren_TP.HCM") %><br></p>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="counter">
                  <h2 class="timer count-title count-number" data-to="12" data-speed="1000"></h2>
                  <p class="count-text "><%= messages.getString("nam_thanh_lap") %></p>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="counter">
                  <h2 class="timer count-title count-number" data-to="24" data-speed="1000"></h2>
                  <p class="count-text "><%= messages.getString("giai_thuong") %></p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="section best-deal">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="section-heading">
            <h6>| <%= messages.getString("ve_chung_toi") %></h6>
            <h2><%= messages.getString("tim_ngay_bay_gio") %></h2>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="tabs-content">
            <div class="row">
              <div class="nav-wrapper ">
                <ul class="nav nav-tabs" role="tablist">
                  <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="appartment-tab" data-bs-toggle="tab" data-bs-target="#appartment" type="button" role="tab" aria-controls="appartment" aria-selected="true"><%= messages.getString("chi_nhanh") %></button>
                  </li>
                  <li class="nav-item" role="presentation">
                    <button class="nav-link" id="villa-tab" data-bs-toggle="tab" data-bs-target="#villa" type="button" role="tab" aria-controls="villa" aria-selected="false"><%= messages.getString("can_ho") %></button>
                  </li>
                  <li class="nav-item" role="presentation">
                    <button class="nav-link" id="penthouse-tab" data-bs-toggle="tab" data-bs-target="#penthouse" type="button" role="tab" aria-controls="penthouse" aria-selected="false"><%= messages.getString("san_cung_cap") %></button>
                  </li>
                </ul>
              </div>              
              <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="appartment" role="tabpanel" aria-labelledby="appartment-tab">
                  <div class="row">
                    <div class="col-lg-3">
                      <div class="info-table">
                        <ul>
                          <li>123, Nguyễn Văn Linh <span>Quận Hải Châu</span></li>
                          <li>456, Hoàng Văn Thụ <span>Quận Liên Chiểu</span></li>
                          <li>35, Hoàng Diệu <span>Quận Hải Châu</span></li>
                          <li>11, võ Văn Ngân <span>Quận Hải Châu</span></li>
                          <li>88, Hoàng Hoa Thám <span>Quận Hải Châu</span></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <img src="${pageContext.request.contextPath}/assets/user/images/ban-do-tphcm.jpg" alt="">
                    </div>
                    <div class="col-lg-3">
                      <h4>Apartment - <%= messages.getString("he_thong_cung_cap_can_ho_chung_cu_cao_cap") %></h4>
                      <p><%= messages.getString("phan_phoi_va_quan_ly_hon_100_can_ho") %>, <%= messages.getString("buoc_dem_dau_tien_trong_tam_nhin") %>.
                      <br><br><%= messages.getString("chung_toi_co_5_he_thong_chi_nhanh") %>.</p>
                      <div class="icon-button">
                        <a href="${pageContext.request.contextPath }/contact"><i class="fa fa-calendar"></i><%= messages.getString("lien_he") %></a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="tab-pane fade" id="villa" role="tabpanel" aria-labelledby="villa-tab">
                  <div class="row">
                    <div class="col-lg-3">
                      <div class="info-table">
                        <ul>
                          <li><%= messages.getString("dien_tich") %> <span><%= messages.getString("from") %> 250 m2</span></li>
                          <li><%= messages.getString("phong_ngu") %> <span>1-3 <%= messages.getString("phong") %></span></li>
                          <li><%= messages.getString("phong_tam") %> <span>1-2 <%= messages.getString("phong") %></span></li>
                          <li><%= messages.getString("noi_that") %> <span><%= messages.getString("day_du") %></span></li>
                          <li style="color: red;"><%= messages.getString("gia") %> <span style="color: red;"><%= messages.getString("chi_tu_1_ty") %></span></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <img src="${pageContext.request.contextPath}/assets/user/images/deal-02.jpg" alt="">
                    </div>
                    <div class="col-lg-3">
                      <h4><%= messages.getString("mo_ta_chi_tiet") %></h4>
                      <p><%= messages.getString("moi_he_thong_co_5_tang") %><br><br><%= messages.getString("cac_can_ho_chung_1_thiet_ke") %>.</p>
                      <div class="icon-button">
                        <a href="${pageContext.request.contextPath }/systemapartment"><i class="fa fa-calendar"></i> <%= messages.getString("xem_them_chi_tiet") %></a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="tab-pane fade" id="penthouse" role="tabpanel" aria-labelledby="penthouse-tab">
                  <div class="row">
                    <div class="col-lg-3">
                      <div class="info-table">
                        - <%= messages.getString("ban_can_cung_cap_day_du_thong_tin") %>
                        <br>
                        - <%= messages.getString("cac_giay_to_phap_ly") %>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <img src="${pageContext.request.contextPath}/assets/user/images/deal-03.jpg" alt="">
                    </div>
                    <div class="col-lg-3">
                      <h4><%= messages.getString("dich_vu_ky_gui_moi_gioi") %></h4>
                      <p><%= messages.getString("cung_cap_quan_ly_marketing") %> <br><br><%= messages.getString("cung_cap_thong_tin_du_an") %>.</p>
                      <div class="icon-button">
                        <a href="${pageContext.request.contextPath }/postapartment"><i class="fa fa-calendar"></i> <%= messages.getString("ky_gui_ngay") %></a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="properties section">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 offset-lg-4">
          <div class="section-heading text-center">
            <h6>| <%= messages.getString("cac_can_ho_khac") %></h6>
            <h2><%= messages.getString("cac_can_ho_cao_cap_khac") %></h2>
          </div>
        </div>
      </div>
      <div class="row">
      <c:forEach var="post" items="${posts }">
       <div class="col-lg-4 col-md-6">
          <div class="item">
             <a href="${pageContext.request.contextPath}/userapartmentdetails?id=${post.id}"><img src="${pageContext.request.contextPath}/assets/user/images/150canho/${post.avatar}" alt=""></a>
            <span class="category">Căn hộ</span>
            <h6>3 tỷ VNĐ</h6>
             <h4><a href="${pageContext.request.contextPath}/userapartmentdetails?id=${post.id}">${post.subject}</a></h4>
            <ul>
              <li>Phòng ngủ: <span>${post.bedroom}</span></li>
              <li>Phòng tắm: <span>${post.bathroom}</span></li>
              <li>Diện tích: <span>${post.area} m2</span></li>
              <li>Ngày đăng: <span><f:formatDate value="${post.postdate }"
													pattern="dd-MM-yyyy" var="postdate" /> ${postdate }</span></li>
              <li>Địa chỉ: <span>${post.address}</span></li>
            </ul>
            <div class="main-button">
              <a href="${pageContext.request.contextPath}/userapartmentdetails?id=${post.id}">Chi tiết</a>
            </div>
          </div>
        </div> 
      </c:forEach>
      	
      
          </div>
        </div>
      </div>


  <div class="contact section">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 offset-lg-4">
          <div class="section-heading text-center">
            <h6>| <%= messages.getString("hay_de_lai_danh_gia_cua_ban") %></h6>
            <h2><%= messages.getString("de_chung_toi_hoan_thien_hon") %></h2>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="contact-content">
    <div class="container">
      <div class="row">
        <div class="col-lg-7">
          <div id="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31355.769673958534!2d106.67776287966731!3d10.775176369887062!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f38f9ed887b%3A0x14aded5703768989!2zUXXhuq1uIDEsIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaCwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1697898273223!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
          </div>
          <div class="row">
            <div class="col-lg-6">
              <div class="item phone">
                <img src="${pageContext.request.contextPath}/assets/user/images/phone-icon.png" alt="" style="max-width: 52px;">
                <h6>18001515<br><span><%= messages.getString("duong_day_nong") %></span></h6>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="item email">
                <img src="${pageContext.request.contextPath}/assets/user/images/email-icon.png" alt="" style="max-width: 52px;">
                <h6>apart@gmail.com<br><span>Email</span></h6>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-5">
          <form id="contact-form" action="${pageContext.request.contextPath }/home?action=submitFeedback" method="post" accept-charset="UTF-8" >
            <div class="row">
              <div class="col-lg-12">
                <fieldset>
                  <label for="name"><%= messages.getString("ho_va_ten") %></label>
                  <input type="name" name="name" id="name" placeholder="<%= messages.getString("nhap_ten_cua_ban") %>" autocomplete="on" required>
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <label for="email"><%= messages.getString("email_cua_ban") %></label>
                  <input type="text" name="email" id="email" pattern="[^ @]*@[^ @]*" placeholder="<%= messages.getString("nhap_thu_dien_tu") %>" required>
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <label for="subject"><%= messages.getString("tieu_de") %></label>
                  <input type="subject" name="subject" id="subject" placeholder="<%= messages.getString("tieu_de") %>" autocomplete="on" >
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <label for="message"><%= messages.getString("danh_gia") %></label>
                  <textarea name="message" id="message" placeholder="<%= messages.getString("danh_gia_cua_ban") %>"></textarea>
                </fieldset>
              </div>
              <div class="col-lg-12">
                <fieldset>
                  <button type="submit" id="form-submit" class="orange-button"><%= messages.getString("gui") %></button>
                </fieldset>
                <br>
                 <%
                	HttpSession session1 = request.getSession();
                	String success = (String) session1.getAttribute("msg");
                	String success1 = success;               	
                	session1.removeAttribute("msg");
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
      </div>
    </div>
  </div>