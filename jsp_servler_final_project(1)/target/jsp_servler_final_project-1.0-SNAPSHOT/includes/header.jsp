<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="utils.*" %>
<%@ page import="constant.*" %>
<%@ include file="head.jsp"%>
<body>
	<div class="header">
		<div class="header-left">
			<a href="#" class="logo"> <img src="assets/img/logo.png"
				alt="Logo">
			</a> <a href="#" class="logo logo-small"> <img
				src="assets/img/logo-small.png" alt="Logo" width="30" height="30">
			</a>
		</div>
		<div class="menu-toggle">
			<a href="javascript:void(0);" id="toggle_btn"> <i
				class="fas fa-bars"></i>
			</a>
		</div>

		<div class="top-nav-search">
			<form action="user-search" method="POST" >
				<input type="text" class="form-control" name="txtSearch" placeholder="Search here">
				<button class="btn" type="submit">
					<i class="fas fa-search"></i>
				</button>
			</form>
		</div>
		<a class="mobile_btn" id="mobile_btn"> <i class="fas fa-bars"></i>
		</a>

		<ul class="nav user-menu">
			<li class="nav-item dropdown noti-dropdown me-2"><a href=""
				class="dropdown-toggle nav-link header-nav-list"
				data-bs-toggle="dropdown"> <img	
					src="assets/img/icons/header-icon-05.svg" alt="">
			</a>
				<div class="dropdown-menu notifications">
					<div class="topnav-dropdown-header">
						<span class="notification-title">Notifications</span> <a
							href="javascript:void(0)" class="clear-noti"> Clear All </a>
					</div>
					<div class="noti-content">
						<ul class="notification-list">
 							<c:forEach items="${personalRecipients}" var="recipient">
									<li class="notification-message"><a href="#">
										<div class="media d-flex">
											<div class="media-body flex-grow-1">
												<p class="noti-details">
													<span class="noti-title"></span> ${NotificationUtils.getNotificationById(recipient.id_notification).get().getTitle()} <span
														class="noti-title">your estimate</span>
												</p>
												<p class="noti-time">
													<span class="notification-time">
													${DateTimeUtils.format(NotificationUtils.getNotificationById(recipient.id_notification).get().getTimestamp())}
													</span>
												</p>
											</div>
										</div>
								</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="topnav-dropdown-footer">
						<a href="#">View all Notifications</a>
					</div>
				</div></li>
	
			<li class="nav-item zoom-screen me-2"><a href="#"
				class="nav-link header-nav-list win-maximize"> <img
					src="assets/img/icons/header-icon-04.svg" alt="">
			</a></li>

			<li class="nav-item dropdown has-arrow new-user-menus"><a
				href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
					<span class="user-img"> <img class="rounded-circle"
						src="assets/img/profiles/avatar-01.jpg" width="31"
						alt="Soeng Souy">
						<div class="user-text">
							<h6>${account.username}</h6>
							<p class="text-muted mb-0">${account.role.toUpperCase()}</p>
						</div>
				</span>
			</a>
				<div class="dropdown-menu">
					<div class="user-header">
						<div class="avatar avatar-sm">
							<img src="assets/img/profiles/avatar-01.jpg" alt="User Image"
								class="avatar-img rounded-circle">
						</div>
						<div class="user-text">
							<c:choose>
								<c:when test="${account.role eq Role.ADMIN.getRole()}">
									<h6>${account.username}</h6>
									<p class="text-muted mb-0">Administrator</p>
								</c:when>
								<c:when test="${account.role eq Role.USER.getRole()}">
									<h6>${account.username}</h6>
									<p class="text-muted mb-0">User</p>
								</c:when>
								<c:when test="${account.role eq Role.MODERATOR.getRole()}">
									<h6>${account.username}</h6>
									<p class="text-muted mb-0">Moderator</p>
								</c:when>
							
							</c:choose>
						</div>
					</div>
					<a class="dropdown-item"
						href="logout">Logout</a>
				</div></li>

		</ul>

	</div>