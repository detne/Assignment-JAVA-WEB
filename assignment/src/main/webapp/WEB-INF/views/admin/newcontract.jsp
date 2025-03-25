<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
  <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Hợp đồng mới</h1>
            </div>
            
          </div>
        </div><!-- /.container-fluid -->
      </section>
  	<script>
  		$(document).ready(function () {
  			$('#check').click(function () {
				var branchID = $('#inputBranch').val();
				var floorID = $('#inputFloor').val();
				var roomID = $('#inputRoom').val();
				$.ajax({
						type: 'GET',
						url: '${pageContext.request.contextPath}/admin/newcontract',
						data: {
							action: 'checkExists',
							branchID: branchID,
							floorID: floorID,
							roomID: roomID
						},
						success: function (data) {
							if(data == false){
								$('#submit').prop('disabled', 'true');
								alert('Phòng này đã được bán');
							} else {
								
								alert('Còn phòng');
								$('#submit').removeAttr('disabled');
							}
						}
				});
			});
			$('#autocomplete').autocomplete({
				source: '${pageContext.request.contextPath}/autocomplete',
				 select: function( event, ui ) {
				        $( "#autocomplete" ).val( ui.item.id + ' - ' +  ui.item.name);
				        return false;
				      }
					
			})
			.autocomplete( "instance" )._renderItem = function( ul, item ) {
				
			      return $( "<li>" )
			        .append( "<div><img src='${pageContext.request.contextPath}/assets/user/images/" + item.avatar + "' height='50' width='50'> &nbsp; " + item.id + " - " + item.name +"</div>" )
			        .appendTo( ul );
			    };
		});
  	</script>
      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Hợp đồng</h3>
  
                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
              <form method="post" action="${pageContext.request.contextPath }/admin/newcontract">
                <div class="form-group">
                  <label for="inputDescription">Chủ sở hữu </label>
                  <input type="text" id="autocomplete" name="owner" style="width: 250px; margin-left: 30px;">
                </div>
                <div class="form-group">
                  <label for="inputName">Ngày tạo hợp đồng</label>
                  <input type="text" id="datepicker" name="created" class="form-control" value="23/01/2024">
                </div>
                <div class="form-group">
                  <label for="inputStatus">Chi nhánh</label>
                  <select id="inputBranch" class="form-control custom-select" name="branch">
                    <option disabled selected>Quận</option>
                    <option value=1>Quận 1</option>
                    <option value=2>Quận 2</option>
                    <option value=3>Quận 3</option>
                    <option value=4>Quận 4</option>
                    <option value=5>Quận 5</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="inputStatus">Tầng</label>
                  <select id="inputFloor" class="form-control custom-select" name="floor">
                    <option disabled selected>Tầng</option>
                    <option value=1>Tầng 1</option>
                    <option value=2>Tầng 2</option>
                    <option value=3>Tầng 3</option>
                    <option value=4>Tầng 4</option>
                    <option value=5>Tầng 5</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="inputStatus">Phòng</label>
                  <select id="inputRoom" class="form-control custom-select" name="room">
                    <option disabled selected>Tên phòng</option>
                    <option value=1>Phòng 1</option>
                    <option value=2>Phòng 2</option>
                    <option value=3>Phòng 3</option>
                    <option value=4>Phòng 4</option>
                    <option value=5>Phòng 5</option>
                  </select>
                </div>
                <div class="form-group">
                   <input type="button" id="check" value="Kiểm tra phòng" class="btn btn-success">
                </div>
                <div class="form-group">
                  <label for="inputDescription">Mô tả</label>
                  <input type="text" name="description" id="inputName" class="form-control" placeholder="Nhập mô tả...">
                </div>
               
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
         
        </div>
        <div class="row">
          <div class="col-12">
         
            <input type="submit"  id="submit"  value="Thêm mới" class="btn btn-success float-right">
          </div>
        </div>
        </form>
      </section>
      <!-- /.content -->
    </div>