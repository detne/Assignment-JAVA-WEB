<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
          <span class="breadcrumb"><a href="index.html"><%= messages.getString("trang_chu") %></a> / <%= messages.getString("chi_tiet_can_ho") %></span>
          <h3><%= messages.getString("chi_tiet_can_ho") %></h3>
        </div>
      </div>
    </div>
  </div>

  <div class="single-property section">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
          <div class="main-image">
          <a id="a_img" href="${pageContext.request.contextPath}/assets/user/images/150canho/${post.avatar}">  <img class="img_proMain" height="428" width="856" src="${pageContext.request.contextPath}/assets/user/images/150canho/${post.avatar}" alt=""></a>
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
          <a href="${pageContext.request.contextPath}/wishlist?action=wishlist&id=${post.id}"><span class="category"><i class="fa-solid fa-heart-circle-plus" style="color:#f35525;font-size: 20px;"></i></span></a> <br>
            <span class="category" style="margin-top: 8px;"><%= messages.getString("da_dang_vao") %> <f:formatDate value="${post.postdate }"
													pattern="dd/MM/yyyy" var="postdate" /> ${postdate }</span>
            <h4>${post.subject}</h4>
            <h5 style="margin-bottom: -25px;"><%= messages.getString("gia") %>: ${post.price} <%= messages.getString("ty") %></h5>
          </div>
          <div class="accordion" id="accordionExample">
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingOne">
                <button disabled class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne"
                  aria-expanded="true" aria-controls="collapseOne">
                  <h6><%= messages.getString("chi_tiet_can_ho") %></h6>
                </button>
              </h2>
              <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="row">
                    <div class="col">
                      <ul>
                        <li>
                         <strong><%= messages.getString("khu_vuc") %>: </strong>
                          <span><%= messages.getString("tphcm") %></span>
                        </li>
                        <li>
                          <strong>
                            <i class="fa-solid fa-bed" style="color: #e57010;"></i>
                          </strong>
                          <span>${post.bedroom} <%= messages.getString("phong_ngu") %></span>
                        </li>
                        <li>
                          <strong>
                            <i class="fa-solid fa-person" style="color: #e57010;"></i>
                          </strong>
                          <span>3-4 <%= messages.getString("nguoi") %></span>
                        </li>
                        <li>
                          <strong><%= messages.getString("dat_coc") %></strong>
                          <span>${post.deposit} <%= messages.getString("trieu") %></span>
                        </li>
                      </ul>
                    </div>
                    <div class="col">
                      <ul>
                        <li>
                         <strong><%= messages.getString("dia_chi") %>: </strong>
                          <span>${post.address}</span>
                        </li>
                        <li>
                          <strong>
                            <i class="fa-solid fa-bath" style="color: #e57010;"></i>
                          </strong>
                          <span>${post.bathroom} <%= messages.getString("phong_tam") %></span>
                        </li>
                        <li>
                          <strong>
                            <i class="fa-solid fa-arrows-up-down-left-right" style="color: #e57010;"></i>
                          </strong>
                          <span>${post.area} m2</span>
                        </li>
                        <li>
                          <i class="fa-solid fa-square-parking" style="color: #e57010;"></i>
                          <span><%= messages.getString("rong_rai_cho_xe_may_va_xe_hoi") %></span>
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
                  <h6><%= messages.getString("tien_nghi_va_tien_ich") %></h6>
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
                          <span><%= messages.getString("thang_may") %></span>
                        </li>
                        <li>
                          <strong>
                           <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                          </strong>
                           <span><%= messages.getString("cho_dau_xe") %></span>
                         </li>
                         <li>
                          <strong>
                           <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                          </strong>
                           <span><%= messages.getString("ho_boi") %></span>
                         </li>
                      </ul>
                    </div>
                    <div class="col">
                      <ul>
                        <li>
                         <strong>
                          <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                         </strong>
                          <span><%= messages.getString("camera_an_ninh") %></span>
                        </li>
                        <li>
                          <strong>
                           <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                          </strong>
                           <span><%= messages.getString("pccc") %></span>
                         </li>
                         <li>
                          <strong>
                           <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                          </strong>
                           <span><%= messages.getString("gym") %></span>
                         </li>
                      </ul>
                    </div>
                    <div class="col">
                      <ul>
                        <li>
                         <strong>
                          <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                         </strong>
                          <span><%= messages.getString("mat_tien") %></span>
                        </li>
                        <li>
                          <strong>
                           <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                          </strong>
                           <span><%= messages.getString("bao_ve") %></span>
                         </li>
                         <li>
                          <strong>
                           <i class="fa-solid fa-circle-check" style="color: #e57010;"></i>
                          </strong>
                           <span><%= messages.getString("sieu_thi") %></span>
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
                  <h6><%= messages.getString("uu_diem") %></h6>
                </button>
              </h2>
              <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree"
                data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="row">
                    <div class="col">
                      <ul>
                        <li>
                          <p style="font-size: 15px;color: #000;font-weight: bold;margin-bottom: 100px;"><%= messages.getString("dac_diem_noi_bat") %></p>
                        </li>
                      </ul>
                    </div>
                    <div class="col">
                      <ul>
                        <li>
                          <p>${post.description }</p>
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
              <span style="color: white;"><%= messages.getString("thong_tin_chu") %></span>
              
            </div>
            <div class="card-body pt-0 mt-3">
              <div class="row">
                <div class="col-7">
                  <h2 class="lead mb-3" style="font-weight: bold;"><b>${account.name }</b></h2>
                  <p class="text-muted text-sm"><%= messages.getString("phone") %>: ${account.phonenumber } </p>
                  <p class="text-muted text-sm">Email: ${account1.email } </p>
             
                  
                </div>
                <div class="col-5 text-center">
                  <img style="border-radius: 50%; width: 150px; height: 150px;" src="${pageContext.request.contextPath}/assets/user/images/${account.avatar}" alt="user-avatar" class="img-circle img-fluid">
                </div>
              </div>
            </div>
            <div class="card-footer">
              <div class="text-right d-flex justify-content-center">
                <a href="mailto:apart@gmail.com" class="btn btn-sm btn-primary w-25 mx-4">
                  <i class="fa-solid fa-envelope"></i>
                </a>
                <a href="#" class="btn btn-sm btn-primary w-25">
                  <i class="fa-solid fa-phone"></i> 
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
