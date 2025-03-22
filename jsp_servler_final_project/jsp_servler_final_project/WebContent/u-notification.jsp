<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="utils.DateTimeUtils"%>
<%@ include file="../includes/header.jsp"%>
<div class="sidebar" id="sidebar">
	<div class="sidebar-inner slimscroll">
		<div id="sidebar-menu" class="sidebar-menu">
			<ul>
				<li><a href="userhome"><i
						class="feather-grid active"></i> <span>Home</span></a></li>
				<li class="submenu">
	                         <a href="#"><i class="fas fa-book"></i> <span>My Library</span> <span
	                                 class="menu-arrow"></span></a>
	                         <ul>
	                             <li><a href="#">Published Documents</a></li>
	                             <li><a href="#">Pending Documents</a></li>
	                         </ul>
	            </li>
				<li class="active"><a href="u-notification.jsp"><i class="fas fa-bell"></i> <span>Notification</span></a>
				</li>
			</ul>
		</div>
	</div>
</div>

<div class="page-wrapper">
	<div class="content container-fluid">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="card">
					<div class="card-body">
						<div class="email-header"></div>
						<div class="email-content">
							<div class="table-responsive">
								<table class="table table-inbox table-hover">
									<thead>
										<tr>
											<th colspan="6"><input type="checkbox"
												class="checkbox-all"> Select All</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${yourNotis}" var="noti">
											<tr class="clickable-row">
												<td><input type="checkbox" class="checkmail"></td>
												<td class="subject"><b>${noti.title}</b></td>
												<td></td>
												<td class="mail-date"><b>${DateTimeUtils.format(noti.timestamp)}</b></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>