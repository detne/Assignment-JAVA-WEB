<%@page import="service.MailHelper"%>
<%@page import="java.util.List"%>
<%@page import="models.Log"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.AccountDetailsDAO"%>
<%@page import="models.Post"%>
<%@ page import="dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
PostDAO postDAO = new PostDAO();
ContactDAO contactDAO = new ContactDAO();
AccountDAO accountDAO = new AccountDAO();
FeedbackDAO feedbackDAO = new FeedbackDAO();
AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
LogDAO logDAO = new LogDAO();
%>
<script>
	$(document)
			.ready(
					function() {
						$('#changeLevel')
								.change(
										function() {
											var value = $(this).val();
											$
													.ajax({
														type : 'GET',
														dataType : 'json',
														contentType : 'application/json; charset=utf-8',
														url : '${pageContext.request.contextPath}/admin/dashboard',
														data : {
															action : "searchByLevel",
															value : value
														},
														success : function(logs) {
															var s = '';
															for (var i = 0; i < logs.length; i++) {
																var colorStyle = "";
																if ("danger" == logs[i].level) {
																	colorStyle = "color: red;";
																} else if ("warning" == logs[i].level) {
																	colorStyle = "color: #FFA500;";
																} else if ("alert" == logs[i].level) {
																	colorStyle = "color: #FFCC99;";
																} else if ("info" == logs[i].level) {
																	colorStyle = "color: #808080;";
																}
																s += '<tr style="' + colorStyle + '">';
																s += '<td>'
																		+ logs[i].ip
																		+ '</td>';
																s += '<td>'
																		+ logs[i].description
																		+ '</td>';
																s += '<td>'
																		+ logs[i].time
																		+ '</td>';
																s += '<td>'
																		+ logs[i].level
																		+ '</td>';
																s += '<td>'
																		+ logs[i].national
																		+ '</td>';
																s += '<td><textarea class="form-control" rows="3" cols="1" disabled >'
																		+ logs[i].beforeValue
																		+ '</textarea></td>';
																s += '<td><textarea class="form-control" rows="3" cols="1" disabled >'
																		+ logs[i].afterValue
																		+ '</textarea></td>';
																s += '</tr>';
															}
															$('#example2 tbody')
																	.html(s);
														}
													});
										});
					});
</script>
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">Trang chủ</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6"></div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<!-- Small boxes (Stat box) -->
			<div class="row">
				<div class="col-lg-3 col-12">
					<!-- small box -->
					<div class="small-box bg-info">
						<div class="inner">
							<h3><%=postDAO.findAll().size()%></h3>

							<p>Tổng số bài đăng người dùng</p>
						</div>
						<div class="icon">
							<i class="ion fa-solid fa-pen" style="font-size: 60px; top: 28px"></i>
						</div>
						<a href="${pageContext.request.contextPath }/admin/postapartment"
							class="small-box-footer">Xem thêm <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-6">
					<!-- small box -->
					<div class="small-box bg-success">
						<div class="inner">
							<h3>
								<%=contactDAO.findAll().size()%>
							</h3>

							<p>Tổng số liên hệ</p>
						</div>
						<div class="icon">
							<i class="ion fa-solid fa-envelope"
								style="font-size: 60px; top: 28px"></i>
						</div>
						<a href="${pageContext.request.contextPath }/superadmin/contact"
							class="small-box-footer">Xem thêm <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-6">
					<!-- small box -->
					<div class="small-box bg-warning">
						<div class="inner">
							<h3><%=accountDAO.findAll().size()%></h3>

							<p>Tổng số người dùng</p>
						</div>
						<div class="icon">
							<i class="ion ion-person-add"></i>
						</div>
						<a href="${pageContext.request.contextPath }/superadmin/account"
							class="small-box-footer">Xem thêm <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-6">
					<!-- small box -->
					<div class="small-box bg-danger">
						<div class="inner">
							<h3><%=feedbackDAO.findAll().size()%></h3>

							<p>Tổng số đánh giá</p>
						</div>
						<div class="icon">
							<i class="ion fa-solid fa-comment"
								style="font-size: 60px; top: 28px"></i>
						</div>
						<a href="${pageContext.request.contextPath }/superadmin/feedback"
							class="small-box-footer">Xem thêm <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
			</div>
			<!-- /.row -->
			<!-- Main row -->

			<!-- /.row (main row) -->
			<table id="example2"
				class="table table-bordered table-hover dataTable dtr-inline"
				aria-describedby="example2_info">
				<thead>
					<tr>
						<th>Địa chỉ IP</th>
						<th>Mô tả</th>
						<th>Thời Gian</th>
						<th>Cấp độ <br> <select style="margin-top: 10px;"
							name="" id="changeLevel">
								<option value="0">Chọn cấp độ</option>
								<option value="1">Info</option>
								<option value="2">Alert</option>
								<option value="3">Warning</option>
								<option value="4">Danger</option>
						</select>
						</th>
						<th>Quốc Gia</th>
						<th>Trước khi thay đổi</th>
						<th>Sau khi thay đổi</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Log log : logDAO.findTop20Log()) {
					%>
					<%
					String colorStyle = "";
					if ("danger".equalsIgnoreCase(log.getLevel())) {
						colorStyle = "color: red;";
					} else if ("warning".equalsIgnoreCase(log.getLevel())) {
						colorStyle = "color: #FFA500;";
					} else if ("alert".equalsIgnoreCase(log.getLevel())) {
						colorStyle = "color: #FFCC99;";
					} else if ("info".equalsIgnoreCase(log.getLevel())) {
						colorStyle = "color: #808080;";
					}
					%>
					<tr style="<%=colorStyle%>">
						<td><%=log.getIp()%></td>
						<td><%=log.getDescription()%></td>
						<td><%=log.getTime()%></td>
						<td><%=log.getLevel()%></td>
						<td><%=log.getNational()%></td>
						<td><textarea class="form-control" rows="3" cols="1" disabled> <%=log.getBeforeValue() == null ? "" : log.getBeforeValue()%></textarea></td>
						<td><textarea class="form-control" rows="3" cols="1" disabled> <%=log.getAfterValue() == null ? "" : log.getAfterValue()%></textarea></td>
					</tr>
					<%
					}
					%>
				</tbody>

			</table>
			<div class="container mt-5">
				<h1 class="text-center">Monthly Column Chart</h1>
				<div class="row justify-content-center">
					<div class="col-md-8">
						<canvas id="monthlyChart"></canvas>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const ctx = document.getElementById('monthlyChart')
					.getContext('2d');
			const monthlyChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [ 'January', 'February', 'March', 'April', 'May',
							'June', 'July', 'August', 'September', 'October',
							'November', 'December' ],
					datasets : [ {
						label : 'Monthly Data',
						data : [ 12, 19, 3, 5, 2, 3, 7, 10, 5, 2, 20, 15 ],
						backgroundColor : 'rgba(75, 192, 192, 0.2)',
						borderColor : 'rgba(75, 192, 192, 1)',
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						y : {
							beginAtZero : true
						}
					}
				}
			});
		});
	</script>
</div>

