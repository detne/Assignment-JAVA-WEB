<%@page import="dao.FeedbackDAO"%>
<%@page import="dao.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Danh sách liên hệ</h1>
				</div>

			</div>
		</div>
		<!-- /.container-fluid -->
	</section>
	<%
		HttpSession session2 = request.getSession();
		String msg = (String) session2.getAttribute("msg");
		String msg1 = msg;
		session2.removeAttribute("msg");
	
	%>
<c:if test="<%= msg1 != null%>">
	<script>
		alert(' <%= msg1%>');
	</script>
</c:if>
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
							<script>
								$(document).ready(function() {
									$('#buttonReload').click(function() {
										location.reload();
									});
								});
							
							
							</script>

						<!-- /.card-header -->
						<div class="card-body" >
						
								<button id="buttonReload" class="btn" ><i class="fa-solid fa-rotate"></i></button>
						
							<table style="text-align: center;" id="example2"
								class="table table-bordered table-hover">
								<thead>
									<tr>
										<th style="width: 50px; vertical-align: top;">STT</th>
										<th style="vertical-align: top;">Tiêu đề</th>
										<th style="vertical-align: top;">Nội dung</th>
										<th style="vertical-align: top;">Họ và tên</th>
										<th style="vertical-align: top;">Số điện thoại</th>
										<th style="vertical-align: top;">Email</th>
										<th style="vertical-align: top;">Ngày liên hệ</th>
										<th style="vertical-align: top;">Trạng thái</th>
										<th style="vertical-align: top;">Hành động</th>
									</tr>
								</thead>
								<tbody>
								
									<c:forEach var="contact" items="${contacts }">
										<tr>
											<td>${contact.id }</td>
											<td>${contact.subject }</td>
											<td>${contact.description }</td>
											<td>${contact.name }</td>
											<td>${contact.phone }</td>
											<td>${contact.email }</td>
											<td><f:formatDate value="${contact.created }"
													pattern="dd/MM/yyyy" var="created" /> ${created }</td>
											<td>${contact.status ? "Đã giải quyết " : "Chưa giải quyết"}</td>
											<td><a onclick="return confirm('Xác nhận đã giải quyết?')" href="${pageContext.request.contextPath }/superadmin/contact?action=updateContact&id=${contact.id }"><i class="fa-solid fa-pen-to-square"></i></i></a> &nbsp;
											 <a  href="mailto:${contact.email }"><i class="fa-solid fa-envelope"></i></a> &nbsp;
											 <a onclick="return confirm('Xóa bài?')" href="${pageContext.request.contextPath }/superadmin/contact?action=deleteContact&id=${contact.id }"><i class="fa-solid fa-trash"></i></a></td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->


					<!-- /.card -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</section>
	<!-- /.content -->
</div>