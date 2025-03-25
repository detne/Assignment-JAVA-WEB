<%@page import="models.Duration"%>
<%@page import="models.Sale"%>
<%@page import="dao.AccountDetailsDAO"%>
<%@page import="models.Account"%>
<%@page import="models.Service"%>
<%@ page import="dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	HttpSession httpSession = request.getSession();
 	String msg = (String) httpSession.getAttribute("msg");
	String msg1 = msg;
	httpSession.removeAttribute("msg");
 %>
 <c:if test="<%= msg1 != null %>">
	<script>
		alert('<%=msg1 %>')
	</script>
</c:if>
  <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Thêm người đăng ký dịch vụ mới</h1>
            </div>
            
          </div>
        </div><!-- /.container-fluid -->
      </section>
  	<script>
  		$(document).ready(function () {
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
              <form method="post" action="${pageContext.request.contextPath }/admin/serviceAccount?action=newService">
                <div class="form-group">
                  <label for="inputDescription">Chủ sở hữu </label>
                  <input type="text" id="autocomplete" name="owner" style="width: 250px; margin-left: 30px;">
                </div>
                <div class="form-group">
                  <label for="inputName">Ngày tạo hợp đồng</label>
                  <input type="text" id="datepicker" name="created" class="form-control" value="28/03/2023">
                </div>
                <div class="form-group">
                  <label for="inputStatus">Dịch vụ</label>
                  <select id="inputBranch" class="form-control custom-select" name="serviceID">
                    <option disabled selected>Chọn dịch vụ</option>
                    <% for(Service service : new ServiceDAO().findAll()){ %>
                    	  <option value="<%= service.getId() %>"><%= service.getId() %> - <%= service.getName() %></option>
                    <% } %>
                  </select>
                </div>
                <div class="form-group">
                  <label for="inputStatus">Người dùng</label>
                  <select id="inputFloor" class="form-control custom-select" name="accountID">
                     <option disabled selected>Chọn người dùng</option>
                    <% for(Account account : new AccountDAO().findAll()){ %>
                    	  <option value="<%= account.getId() %>"><%= account.getId() %> - <%= new AccountDetailsDAO().findAccountByAccountID(account.getId()) != null ? new AccountDetailsDAO().findAccountByAccountID(account.getId()).getName() : "Chưa cập nhật" %></option>
                    <% } %>
                  </select>
                  </select>
                </div>
                 <div class="form-group">
                  <label for="inputStatus">Thời hạn</label>
                  <select id="inputRoom" class="form-control custom-select" name="durationID">
                    <option disabled selected>Chọn thời hạn</option>
                    <% for(Duration duration : new DurationDAO().findAll()){ %>
                    	  <option value="<%= duration.getId() %>"><%= duration.getName() %></option>
                    <% } %>
                  </select>
                </div>
                <div class="form-group">
                  <label for="inputStatus">Sale</label>
                  <select id="inputRoom" class="form-control custom-select" name="saleID">
                    <option disabled selected>Chọn mã sale</option>
                    <% for(Sale sale : new SaleDAO().findAll()){ %>
                    	  <option value="<%= sale.getId() %>"><%= sale.getId() %> - <%= sale.getName() %></option>
                    <% } %>
                  </select>
                </div>
                <!-- <div class="form-group">
                   <input type="button" id="check" value="Kiểm tra dịch vụ" class="btn btn-success">
                </div> -->
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
            <a href="${pageContext.request.contextPath }/admin/serviceAccount?action=newService" class="btn btn-secondary">Hủy</a>
            <input type="submit"  id="submit"  value="Thêm mới" class="btn btn-success float-right">
          </div>
        </div>
        </form>
      </section>
      <!-- /.content -->
    </div>