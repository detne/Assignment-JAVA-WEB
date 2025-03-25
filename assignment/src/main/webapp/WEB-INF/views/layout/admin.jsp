<%@page import="models.Account"%>
<%@page import="dao.FeedbackDAO"%>
<%@ page import="dao.FeedbackDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$Apartment</title>

<!-- Google Font: Source Sans Pro -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/admin/dist/css/admin.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'dd/mm/yy'
		});
		$("#datepicker1").datepicker({
			dateFormat : 'dd/mm/yy'
		});
	});
</script>

<%
String feedbackNoti = "";
String contactNoti = "";
int feedbackNumber = 0;
int contactNumber = 0;

HttpSession session2 = request.getSession();
Account account = (Account) session.getAttribute("accountAdmin");

if (account == null || session2.getAttribute("feedbacks") == null || session2.getAttribute("contacts") == null) {
    response.sendRedirect(request.getContextPath() + "/accessdenied");
    return;
}


    feedbackNoti = session.getAttribute("feedbacks").toString();
    feedbackNumber = Integer.parseInt(feedbackNoti);

    contactNoti = session.getAttribute("contacts").toString();
    contactNumber = Integer.parseInt(contactNoti);


FeedbackDAO feedbackDAO = new FeedbackDAO();
//session.removeAttribute("feedbacks");
%>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="${pageContext.request.contextPath }/admin/dashboard"
					class="nav-link">Trang chủ</a></li>

			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->
				<li class="nav-item">

					<div class="navbar-search-block">
						<form class="form-inline">
							<div class="input-group input-group-sm">
								<input class="form-control form-control-navbar" type="search"
									placeholder="Search" aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button"
										data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
				</li>


				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#" id="getContact"> <i
						style="font-size: 30px;" class="far  fa-comments"></i> <span
						style="font-size: 15px;" class="badge badge-danger navbar-badge"
						id="numberContact">0</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<div id="resultContact"></div>

						<div class="dropdown-divider"></div>
						<a href="${pageContext.request.contextPath}/admin/contact"
							class="dropdown-item dropdown-footer">Xem tất cả</a>
					</div></li>
				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i style="font-size: 30px;"
						class="far fa-bell"></i> <span style="font-size: 15px;"
						class="badge badge-warning navbar-badge" id="totalNotiNumber">0</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-item dropdown-header" id="totalNoti">0
							thông báo mới</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-envelope mr-2"></i> <input type="hidden"
							id="contactNumber" value="<%=contactNumber%>"></span> <span
							style="color: red;" id="newNumberContact"></span> <span
							style="color: red;"> liên hệ mới</span>

						</a>
						<div class="dropdown-divider"></div>

						<div class="dropdown-divider"></div>
						<a href="${pageContext.request.contextPath }/admin/feedback"
							class="dropdown-item"> <i class="fa-solid fa-comment mr-2"></i><input
							type="hidden" id="feedbackNumber" value="<%=feedbackNumber%>"><span
							style="color: red;" id="feedbackNoti"></span><span
							style="color: red;"> đánh giá mới</span>
						</a>
						<div class="dropdown-divider"></div>

					</div></li>
				<li class="nav-item dropdown"><a class="nav-link"
					href="${pageContext.request.contextPath }/login?action=logout">
						<i style="font-size: 20px;" class="fa-solid fa-right-from-bracket"></i>
				</a></li>
			</ul>

		</nav>
		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake"
				src="${pageContext.request.contextPath}/assets/admin/dist/img/AdminLTELogo.png"
				alt="AdminLTELogo" height="60" width="60">
		</div>

		<!-- Navbar -->

		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4"
			style="background-color: #5D45C1;">
			<!-- Brand Logo -->
			<a href="${pageContext.request.contextPath}/admin/dashboard"
				class="brand-link"> <img
				src="${pageContext.request.contextPath}/assets/admin/dist/img/AdminLTELogo.png"
				alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
				style="opacity: .8;"> <span
				class="brand-text font-weight-light" style="color: #F4F6F9">Apartment</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img
							src="https://scontent.fsgn2-10.fna.fbcdn.net/v/t39.30808-6/476542494_1863365384492285_6174652955216018765_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=Y2qAXBQlTnQQ7kNvgGY_HPW&_nc_oc=AdlkUOtci0-rPDUL3vlmotccjS3Xdgna7LYIWPH69FzkxjlD6hzP_7BS9iJgMXTCb2M&_nc_zt=23&_nc_ht=scontent.fsgn2-10.fna&_nc_gid=pbeF4IDsR4Aj1vgbRURlVA&oh=00_AYFCJHVbQWqJ2FJzF3-xvwRBqaS2SAatASAPd42okwUC2g&oe=67E1A55A"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="${pageContext.request.contextPath}/admin/dashboard"
							class="d-block">Admin Apartment</a>
					</div>
				</div>

				<!-- SidebarSearch Form -->
				<div class="form-inline">
					<div class="input-group" data-widget="sidebar-search">
						<input class="form-control form-control-sidebar" type="search"
							placeholder="Tìm kiếm" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-sidebar">
								<i class="fas fa-search fa-fw"></i>
							</button>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item menu-open"><a href="#"
							class="nav-link active"> <i class="fa-solid fa-list-check"></i>
								&nbsp;
								<p>
									Quản lý <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<%
								if (account.getRole() == 2) {
								%>
								<li class="nav-item active"><a
									href="${pageContext.request.contextPath }/superadmin/account"
									class="nav-link ${activeAccount }"> <i
										class="fa-solid fa-user"></i> &nbsp;
										<p>Tài khoản</p>
								</a></li>
								<%
								}
								%>


								<li class="nav-item"><a
									href="${pageContext.request.contextPath }/admin/chatadmin"
									class="nav-link ${activeAdminSystem }"> <i class="fa-solid fa-inbox"></i> &nbsp;
										<p>Chăm sóc khách hàng</p>
								</a></li>
								<li class="nav-item "><a
									href="${pageContext.request.contextPath }/admin/userapartment"
									class="nav-link ${activeUser }"> <i
										class="fa-solid fa-building-user"></i> &nbsp;
										<p>Căn hộ của người dùng</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath }/admin/postapartment"
							class="nav-link ${activePost }"> <i
								class="fa-solid fa-newspaper"></i>&nbsp;
								<p>Bài đăng của người dùng</p>
						</a></li>
					
						<%
						if (account.getRole() == 2) {
						%>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath }/superadmin/feedback"
							class="nav-link ${activeFeedback }"> <i
								class="fa-solid fa-comment"></i> &nbsp;
								<p>Đánh giá</p>
						</a></li>
						<%
						}
						%>
						
						<%
						if (account.getRole() == 2) {
						%>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath }/superadmin/contact"
							class="nav-link ${activeContact }"> <i
								class="fa-solid fa-circle-info"></i> &nbsp;
								<p>Liên hệ</p>
						</a></li>
						<%
						}
						%>
						<%
						if (account.getRole() == 2) {
						%>
						<li class="nav-item"><a
							href="${pageContext.request.contextPath }/superadmin/receiverEmail"
							class="nav-link ${activeReceiverEmail }"> <i
								class="fa-solid fa-email"></i> &nbsp;
								<p>Hộp thư</p>
						</a></li>
						<%
						}
						%>
						<%
						if (account.getRole() == 2) {
						%>
						<li class="nav-item ${activeContractOpen} "><a href="#"
							class="nav-link ${activeContract }"> <i 
								class="fa-solid fa-list"></i> &nbsp;
								<p>
									Dịch vụ <i class="fas fa-angle-left right"></i>

								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="${pageContext.request.contextPath }/superadmin/service"
									class="nav-link ${activeService }"> <i 
										class="fa-solid fa-plane"></i>&nbsp;
										<p>Dịch vụ</p>
								</a></li>
								<li class="nav-item "><a
									href="${pageContext.request.contextPath }/superadmin/sale"
									class="nav-link ${activeSale }"> <i 
										class="fa-solid fa-money-bill-trend-up"></i> &nbsp;
										<p>Doanh thu</p>
								</a></li>
								<li class="nav-item"><a
									href="${pageContext.request.contextPath }/superadmin/duration"
									class="nav-link ${activeDuration }"> <i 
										class="fa-solid fa-clock"></i></i> &nbsp;
										<p>Thời hạn</p>
								</a></li>



							</ul></li>
						<%
						}
						%>
						
						
						<li class="nav-item ${activeContractOpen}  menu-open"><a href="#"
							class="nav-link ${activeContract }"> <i 
								class="fa-solid fa-list"></i> &nbsp;
								<p>
									Quản lý dịch vụ <i class="fas fa-angle-left right"></i>

								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="${pageContext.request.contextPath }/admin/serviceAccount"
									class="nav-link ${activeServiceAccount }"> <i 
										class="fa-solid fa-plane"></i>&nbsp;
										<p>Tổng quan dịch vụ</p>
								</a></li>
								<li class="nav-item "><a
									href="${pageContext.request.contextPath }/admin/accountService"
									class="nav-link ${activeAccountService }"> <i 
										class="fa-solid fa-money-bill-trend-up"></i> &nbsp;
										<p>Tổng quan người dùng</p>
								</a></li>
								



							</ul></li>
						

						
						<li class="nav-item"><a
							href="${pageContext.request.contextPath }/admin/transaction"
							class="nav-link ${activeTransaction }"> <i
								class="fa-solid fa-comment"></i> &nbsp;
								<p>Giao dịch</p>
						</a></li>
						


					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<jsp:include page="${admin }"></jsp:include>
		<!-- /.content-wrapper -->
		<footer class="main-footer">

			<strong>Hệ thống cung cấp căn hộ cao cấp và kí gửi căn hộ
				của bạn <a href="${pageContext.request.contextPath}/admin/dashboard">Apartment</a>
			</strong>

		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/sparklines/sparkline.js"></script>
	<!-- JQVMap -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<!-- jQuery Knob Chart -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/moment/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/dist/js/adminlte.js"></script>
	<!-- AdminLTE for demo purposes -->
	<!-- <script src="${pageContext.request.contextPath}/assets/admin/dist/js/demo.js"></script> -->
	<!-- bo? dong nay de load lai trang ko xuat hien alert -->
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/jszip/jszip.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/pdfmake/pdfmake.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/pdfmake/vfs_fonts.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/admin/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
	<script>
		$(function() {
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : false,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
		});
	</script>
</body>
<script>
	function getAllNoti() {
		var newNumberContact = $('#numberContact').html();
		var newNumberFeedback = $('#feedbackNoti').html();
		$('#totalNoti').html(
				(parseInt(newNumberContact) + parseInt(newNumberFeedback))
						+ ' thông báo mới');
		$('#totalNotiNumber').html(
				(parseInt(newNumberContact) + parseInt(newNumberFeedback)));

	}
	setInterval(getAllNoti, 10000);
	function notificationFeedback() {

		var oldFeedback = $('#feedbackNumber').val();
		if (window.location.href == 'http://localhost:8080/projectGroup6/superadmin/feedback') {
			var test = 'aaa';
		}
		$
				.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath}/notification',
					data : {
						test : test,
						oldFeedback : oldFeedback
					},
					success : function(data) {
						if (window.location.href == 'http://localhost:8080/projectGroup6/superadmin/feedback') {
							$('#feedbackNoti').html(0);
						} else {
							if ((data - oldFeedback) < 0) {
								$('#feedbackNoti').html(0);
							} else {
								$('#feedbackNoti').html(data - oldFeedback);
							}

						}
					}
				});

	}
	setInterval(notificationFeedback, 10000);

	function notificationContact() {
		var oldContact = $('#contactNumber').val();
		if (window.location.href == 'http://localhost:8080/projectGroup6/superadmin/contact') {
			var test = 'aaa';
		}
		$
				.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath}/superadmin/contact',
					data : {
						test : test,
						action : 'checkContact',
						oldContact : oldContact
					},
					success : function(data) {
						if (window.location.href == 'http://localhost:8080/projectGroup6/superadmin/contact') {
							$('#newNumberContact').html(0);
						} else {
							$('#newNumberContact').html(data - oldContact);
							if ((data - oldContact) < 0) {
								$('#numberContact').html(0);
							} else {
								$('#numberContact').html(data - oldContact);
							}

						}

					}
				});

	}
	setInterval(notificationContact, 10000);

	$(document)
			.ready(
					function() {

						$('#getContact')
								.click(
										function() {

											var s = '';
											$
													.ajax({
														type : 'GET',
														url : '${pageContext.request.contextPath}/superadmin/contact',
														data : {
															action : 'getContact'
														},
														success : function(data) {
															for (var i = 0; i < data.length; i++) {
																s += '<a href="${pageContext.request.contextPath}/superadmin/contact" class="dropdown-item">';
																s += '<div class="media">';
																s += '<img src="${pageContext.request.contextPath}/assets/user/images/Unknown_person.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">';
																s += '<div class="media-body">';
																s += ' <h3 class="dropdown-item-title">';
																s += '<span style="font-weight: bold;">'
																		+ data[i].name
																		+ '</span>';
																s += '<span  class="float-right bold-text text-sm text-'
																		+ (data[i].status == true ? 'success'
																				: 'danger')
																		+ '"><i class="fas fa-star"></i></span>';
																s += '</h3>';
																s += ' <p class="text-sm">'
																		+ data[i].subject
																		+ '</p>';
																s += '<p class="text-sm text-muted"><i class="fa-solid fa-circle-info"></i></i> '
																		+ data[i].description
																				.substring(
																						0,
																						20)
																		+ '</p>';
																s += ' </div>';
																s += '</div>';
																s += '</a>';
															}
															$('#resultContact')
																	.html(s);

														}

													});
										});
					});
</script>
</html>