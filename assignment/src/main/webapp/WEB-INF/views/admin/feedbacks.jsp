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
					<h1>Danh sách bài đánh giá</h1>
				</div>

			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

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
										<th style="vertical-align: top;">Mã tài khoản</th>
										<th style="vertical-align: top;">Tiêu đề</th>
										<th style="vertical-align: top;">Mô tả</th>
										<th style="vertical-align: top;">Ngày đánh giá</th>

									</tr>
								</thead>
								<tbody>
								
									<c:forEach var="feedback" items="${feedbacks }">
										<tr>
											<td>${feedback.id }</td>
											<td>${feedback.accountid }</td>
											<td>${feedback.subject }</td>
											<td>${feedback.description }</td>
											<td><f:formatDate value="${feedback.created }"
													pattern="dd/MM/yyyy" var="created" /> ${created }</td>
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