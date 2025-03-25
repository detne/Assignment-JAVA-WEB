<%@page import="dao.DurationDAO"%>
<%@page import="models.Duration"%>
<%@page import="dao.SaleDAO"%>
<%@page import="models.Sale"%>
<%@page import="dao.AccountDetailsDAO"%>
<%@page import="dao.AccountDAO"%>
<%@page import="models.Account"%>
<%@page import="dao.ServiceDAO"%>
<%@page import="models.Service"%>
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
              <h1>Tạo thời hạn mới</h1>
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
                <h3 class="card-title">Tạo thời hạn</h3>
  
                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
              <form method="post" action="${pageContext.request.contextPath }/superadmin/duration?action=newDuration">
                <div class="form-group">
                  <label for="inputDescription">Thời hạn </label>
                  <input type="text" name="name" id="inputName" class="form-control" placeholder="Nhập thời hạn mới ...">
                </div>
                <!-- <div class="form-group">
                   <input type="button" id="check" value="Kiểm tra dịch vụ" class="btn btn-success">
                </div> -->
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
         
        </div>
        <div class="row">
          <div class="col-12">
            <a href="${pageContext.request.contextPath }/superadmin/duration?action=newDuration" class="btn btn-secondary">Hủy</a>
            <input type="submit"  id="submit"  value="Thêm mới" class="btn btn-success float-right">
          </div>
        </div>
        </form>
      </section>
      <!-- /.content -->
    </div>