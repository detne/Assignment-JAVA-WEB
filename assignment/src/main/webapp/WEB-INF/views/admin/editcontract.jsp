<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
  <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Chỉnh sửa hợp đồng</h1>
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
                <h3 class="card-title">Hợp đồng</h3>
  
                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="form-group">
                  <label for="inputDescription">Chủ sở hữu</label>
                  <select id="inputStatus" class="form-control custom-select">
                    <option disabled selected>Chọn chủ sở hữu</option>
                    <option>1- Lê Thanh Tú</option>
                    <option>2- Lê Thanh Tú</option>
                    <option>3- Lê Thanh Tú</option>
                    <option>4- Lê Thanh Tú</option>
                    <option>5- Lê Thanh Tú</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="inputName">Ngày sửa hợp đồng</label>
                  <input type="text" id="datepicker" class="form-control" value="28/03/2023">
                </div>
                <div class="form-group">
                  <label for="inputStatus">Chi nhánh</label>
                  <select id="inputStatus" class="form-control custom-select">
                    <option disabled selected>Quận</option>
                    <option>Quận 1</option>
                    <option>Quận 2</option>
                    <option selected>Quận 3</option>
                    <option>Quận 4</option>
                    <option>Quận 5</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="inputStatus">Phòng ngủ</label>
                  <select id="inputStatus" class="form-control custom-select">
                    <option disabled selected>Tầng</option>
                    <option>Tầng 1</option>
                    <option>Tầng 2</option>
                    <option>Tầng 3</option>
                    <option selected>Tầng 4</option>
                    <option>Tầng 5</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="inputStatus">Phòng</label>
                  <select id="inputStatus" class="form-control custom-select">
                    <option disabled selected>Tên phòng</option>
                    <option>Phòng 1</option>
                    <option selected>Phòng 2</option>
                    <option>Phòng 3</option>
                    <option>Phòng 4</option>
                    <option>Phòng 5</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="inputDescription">Mô tả</label>
                  <input type="text" id="inputName" class="form-control" value="Nhập mô tả...">
                </div>
               
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
         
        </div>
        <div class="row">
          <div class="col-12">
            <a href="#" class="btn btn-secondary">Hủy</a>
            <input type="submit" value="Cập nhật" class="btn btn-success float-right">
          </div>
        </div>
      </section>
      <!-- /.content -->
    </div>