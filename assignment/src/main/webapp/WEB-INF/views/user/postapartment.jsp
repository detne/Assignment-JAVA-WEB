<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
          <span class="breadcrumb"><a href="${pageContext.request.contextPath }/home"><%= messages.getString("trang_chu") %></a></span>
          <h3><%= messages.getString("ky_gui_can_ho") %></h3>
        </div>
      </div>
    </div>
  </div>
 
  <!-- ***** Header Area End ***** -->
  <div class="featured section">
    <div class="container" style="margin-top: -50px;">
      <div class="row">
        <div class="col-lg-8">
          <div class="card mb-4">
            <div class="card-header d-flex justify-content-between">
              <span><%= messages.getString("bai_dang") %></span>
              <button class="btn" style="background-color: #f35525; "><a style="color: white;" 
              href="${pageContext.request.contextPath}/mypost"><%= messages.getString("xem_bai_viet_da_dang") %></a></button>
            </div>
            
           
            <div class="card-body">
                <form method="post" action="${pageContext.request.contextPath}/postapartment" enctype="multipart/form-data">
                    <!-- Form Group (username)-->
                    <div class="mb-3">
                        <label class="small mb-1" for="inputUsername"><%= messages.getString("tieu_de") %></label>
                        <input class="form-control" name="subject" id="inputUsername" type="text" placeholder="<%= messages.getString("nhap_tieu_de") %>"  title="Nhập tiêu đề bài viết của bạn" required>
                    </div>
                    <div class="mb-3">
                      <label class="small mb-1" for="inputUsername"><%= messages.getString("gia") %> (<%= messages.getString("ty") %> VND)</label>
                      <input class="form-control" id="inputUsername" step="0.1" name="price" min="1" type="number" placeholder="<%= messages.getString("nhap_gia") %>" title="Giá của căn hộ" required>
                  </div>
                  <div class="mb-3">
                      <label class="small mb-1" for="inputUsername"><%= messages.getString("dat_coc") %> (<%= messages.getString("trieu") %> VND)</label>
                      <input class="form-control" id="inputUsername" step="0.1" name="deposit" type="number" min="1" placeholder="<%= messages.getString("nhap_tien_coc") %>" title="Tiền cọc trước phải thấp hơn giá tiền của căn hộ" required>
                  </div>
                  <div class="row gx-3 mb-3">
                    <!-- Form Group (phone number)-->
                    <div class="col-md-6">
                        <label class="small mb-1" for="inputPhone"><%= messages.getString("phong_ngu") %></label>
                        <input class="form-control" name="bedroom" id="inputPhone" min="1" max="3" type="number" placeholder="<%= messages.getString("nhap_so_pn") %>" title="Số lượng phòng ngủ của căn hộ" required>
                    </div>
                    <!-- Form Group (birthday)-->
                    <div class="col-md-6">
                      <label class="small mb-1" for="inputPhone"><%= messages.getString("phong_tam") %></label>
                      <input class="form-control" name="bathroom" id="inputPhone" min="1" max="3" type="number" placeholder="<%= messages.getString("nhap_so_pt") %>" title="Số lượng phòng tắm của căn hộ" required>
                  </div>
                </div>
                <div class="row gx-3 mb-3">
                  <!-- Form Group (phone number)-->
                  <div class="col-md-6">
                      <label class="small mb-1" for="inputPhone"><%= messages.getString("dia_chi") %></label>
                      <input class="form-control" name="address" id="inputPhone" type="text" placeholder="<%= messages.getString("nhap_dia_chi") %>" title="Địa chỉ của căn hộ" required>
                  </div>
                  <!-- Form Group (birthday)-->
                  <div class="col-md-6">
                    <label class="small mb-1" for="inputPhone"><%= messages.getString("dien_tich") %> (<%= messages.getString("met_vuong") %>)</label>
                    <input class="form-control" name="area" id="inputPhone" min="1" step="0.1" type="number" placeholder="<%= messages.getString("nhap_dien_tich") %>" title="Diện tích của căn hộ, tính theo mét vuông" required>
                </div>
              </div>
              
                  <div class="mb-3">
                    <label class="small mb-1" for="inputUsername"><%= messages.getString("mo_ta") %></label>
                    <br>
                    <textarea class="form-control" name="description" id="inputUsername" cols="30" rows="10"  title="Nhập mô tả chi tiết cho căn hộ" required></textarea>
                </div>
             
                
                    <!-- Save changes button-->
                    <input class="btn btn-primary" type="submit" value="<%= messages.getString("dang_bai") %>">
              
            </div>
        </div>
         
        </div>
        <div class="col-lg-4">
          <div class="card mb-4 mb-xl-0">
            <div class="card-header">Ảnh căn hộ</div>
            <div class="card-body text-center">
              <div class="small font-italic text-muted mb-2"><span id="msg">File hình không quá 5MB</span></div>
              <div class="small font-italic text-muted mb-4"><span id="msg">Chỉ được phép tối đa 4 ảnh</span></div>
                <!-- Profile picture image-->
                <div id="pictures" style="max-height: 300px; overflow: auto ;">
                    
                </div>
                <!-- Profile picture help block-->
              
                <!-- Profile picture upload button-->
                <input style="margin-left: 100px;"  type="file" name="files" multiple="multiple" required accept="image/*" id="inputAvatar">
                <label style="margin-top: 5px;" for="inputAvatar" class="custom-upload-btn" title="Ảnh căn hộ, không quá 4 ảnh, tổng ảnh có dung lượng không quá 5MB"><i class="fa-solid fa-arrow-up-from-bracket"></i> &nbsp; Tải lên</label>
                <script>
                  $(document).ready(function(){
                    var src = [];
                      $('#inputAvatar').change( function(event) {
                        if(event.target.files.length > 4){
                           alert('Chỉ được chọn tối đa 4 tấm hình');
                           location.reload();
                        } else {
                          for (var i = 0; i <  event.target.files.length; i++) {
                        console.log(event.target.files[i].name);
                        src[i] = URL.createObjectURL(event.target.files[i]);
                        $('<img src="' + src[i] + '" height="200" style="margin-top: 5px"/> ').appendTo('#pictures');
                        console.log(src[i]);
                    
                      }
                        }
                    
                      
                       
                });
                    
                   /*  $('<p>Thành phần p</p>').appendTo('#div'); */
                   
                  });
                </script>
            </div>
        </div>
        </div>
      </form>
        <!-- <div class="col-lg-3">
          <div class="info-table">
            <ul>
              <li>
                <img src="assets/images/info-icon-03.png" alt="" style="max-width: 52px;">
                <h4>Căn hộ<br>Cao cấp nhất</h4>
              </li>
              <li>
                <img src="assets/images/info-icon-01.png" alt="" style="max-width: 52px;">
                <h4>Trên khắp<br>TPHCM</h4>
              </li>
              <li>
                <img src="assets/images/info-icon-04.png" alt="" style="max-width: 52px;">
                <h4>An toàn<br>Và uy tín</h4>
              </li>
            
              
              <li>
                <img src="assets/images/info-icon-02.png" alt="" style="max-width: 52px;">
                <h4>Hợp đồng<br>Nhanh chóng</h4>
              </li>
            </ul>
          </div>
        </div> -->
      </div>
    </div>
  </div>
