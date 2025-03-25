<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/webcamjs/1.0.25/webcam.min.js"></script>
    
   <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Tạo chủ sở hữu mới</h1>
            </div>
            
          </div>
        </div><!-- /.container-fluid -->
      </section>
  
      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Tạo mới</h3>
  
                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <form action="${pageContext.request.contextPath }/admin/newcontractuser?action=newOwner" method="post" enctype="multipart/form-data">
                <div class="form-group">
                  <label for="inputName">Họ và tên</label>
                  <input type="text" id="inputName" class="form-control" name="name">
                </div>
                <div class="form-group">
                  <label for="inputName">Ngày sinh</label>
                  <input type="text" id="datepicker" class="form-control" name="birthday">
                </div>
                <div class="form-group">
                  <label for="inputName">Số điện thoại</label>
                  <input type="text" id="inputName" class="form-control" name="phone">
                </div>
                <div class="form-group">
                  <label for="inputName">Địa chỉ</label>
                  <input type="text" id="inputName" class="form-control" name="address">
                </div>
                <div class="form-group">
                  <label for="inputName">Số CCCD</label>
                  <input type="text" id="inputName" class="form-control" name="identifyNumber">
                </div>
                <div class="form-group">
                  <label for="inputName">Ảnh đại diện</label>
                  <br>
                  <input style="margin-left: 100px; display: none;"  type="file" required accept="image/*" id="inputAvatar" name="file">
                  <label style="margin-top: 5px; cursor: pointer;" for="inputAvatar" class="custom-upload-btn"><i class="fa-solid fa-arrow-up-from-bracket"></i> &nbsp; Tải lên</label>
                  
                  <label style="margin-top: 5px; cursor: pointer; margin-left: 5px;" class="custom-upload-btn" id="capture-btn"><i class="fa-solid fa-camera"></i> &nbsp; Chụp ảnh</label>
                  <div id="camera-container" style="height: 1px; width: 1px;">
    					<video id="camera-feed" autoplay playsinline></video>
    					
					</div>
					
                  
                  <br>
                  <img id="avatar" src="${pageContext.request.contextPath}/assets/user/images/Unknown_person.jpg" height="100px" width="100px" alt="">
               
                  
                <script>
		                document.addEventListener("DOMContentLoaded", function () {
		                	 
		                    Webcam.attach("#camera-feed");
		                    
		                    document.getElementById("capture-btn").addEventListener("click", function () {
		                    	
		                        Webcam.snap(function (data_uri) {
		                            document.getElementById("camera-container").style.display = "none";
		                            document.getElementById("avatar").src = data_uri;
		                            document.getElementById("avatar").style.display = "block";
		                        });
		                    });
		                });
		                Webcam.on("error", function (err) {
		                    if (err.name === "NotFoundError") {
		                        return;
		                    } else {
		                        // Xử lý các loại lỗi khác nếu cần
		                        alert('Thiết bị của bạn không hỗ trợ Webcam!');
		                    }
		                });
           	 </script>

                  
				
                  
                  <script>
                    $(document).ready(function(){
                      $('#inputAvatar').change( function() {
                  var tmppath = URL.createObjectURL(event.target.files[0]);
                      
                      $("#avatar").attr('src',tmppath);       
                  });
                    });
                  </script>
                </div>
            
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
      
        </div>
        <div class="row">
          <div class="col-12">

            <input type="submit" value="Tạo chủ sở hữu mới" class="btn btn-success float-right">
          </div>
        </div>
      </form>
      </section>
      <!-- /.content -->
    </div>