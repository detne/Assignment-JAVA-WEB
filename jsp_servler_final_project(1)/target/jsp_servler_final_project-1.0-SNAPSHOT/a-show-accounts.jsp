<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="utils.DateTimeUtils"%>
<%@ page import="constant.Role"%>
<%@ include file="../includes/header.jsp"%>
<div class="sidebar" id="sidebar">
            <div class="sidebar-inner slimscroll">
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <li>
                            <a href="a-index.jsp"><i class="feather-grid active"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-book"></i> <span> Document</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a href="admin-published">Published Document</a></li>
                                <li><a href="admin-pending">Pending Document</a></li>
                            </ul>
                        </li>
                        <li class="active">
                            <a href="showaccounts"><i class="fas fa-users"></i> <span>Account</span></a>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="fas fa-graduation-cap"></i> <span>Add new category</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a href="addnewmajor">Add new major</a></li>
                                <li><a href="#">Add new course</a></li>
                                <li><a href="#">Add new category</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="admin-notification"><i class="fas fa-bell"></i> <span>Notification</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
<div class="page-wrapper">
	<div class="content container-fluid">

		<div class="page-header">
			<div class="row">
				<div class="col-sm-12">
					<div class="page-sub-header">
						<h3 class="page-title">Welcome Admin!</h3>
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Admin</li>
						</ul>
					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-xl-3 col-sm-6 col-12 d-flex">
				<div class="card bg-comman w-100">
					<div class="card-body">
						<div
							class="db-widgets d-flex justify-content-between align-items-center">
							<div class="db-info">
								<h6>Total Users</h6>
								<h3>${dataIndex[4]}</h3>
							</div>
							<div class="db-icon">
								<img src="assets/img/icons/user-icon.svg"
									alt="Dashboard Icon">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 col-12 d-flex">
				<div class="card bg-comman w-100">
					<div class="card-body">
						<div
							class="db-widgets d-flex justify-content-between align-items-center">
							<div class="db-info">
								<h6>Moderators</h6>
								<h3>${dataIndex[5]}</h3>
							</div>
							<div class="db-icon">
								<img src="assets/img/icons/moderator-icon.svg"
									alt="Dashboard Icon">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 col-12 d-flex">
				<div class="card bg-comman w-100">
					<div class="card-body">
						<div
							class="db-widgets d-flex justify-content-between align-items-center">
							<div class="db-info">
								<h6>Regular Users</h6>
								<h3>${dataIndex[4]-dataIndex[5]}</h3>
							</div>
							<div class="db-icon">
								<img src="assets/img/icons/moderator-icon.svg"
									alt="Dashboard Icon">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div class="card card-table">
					<div class="card-body">
						<div class="page-header">
							<div class="row align-items-center">
								<div class="col">
									<h3 class="page-title">Published Documents</h3>
								</div>
								<div class="col-auto text-end float-end ms-auto download-grp">
									<a href="#" class="btn btn-outline-primary me-2"> <i
										class="fa fa-chevron-left"></i> Previous
									</a> <a href="#" class="btn btn-outline-primary me-2">Next <i
										class="fa fa-chevron-right"></i>
									</a>
								</div>
							</div>
						</div>

						<div class="table-responsive">
							<table
								class="table star-student table-hover table-center table-borderless table-striped">
								<thead class="thead-light">
									<tr>
										<th>Username</th>
										<th>Email</th>
										<th>Password</th>
										<th>Created Date</th>
										<th class="text-center">Role</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${accounts}" var="account">
										<tr>
											<td><a>${account.username}</a></td>
											<td>${account.email}</td>
											<td>${account.password}</td>
											<td>${DateTimeUtils.format(account.date_created.toLocalDateTime())}</td>
											<td class="text-center"><c:choose>
													<c:when test="${account.role eq Role.ADMIN.getRole()}">
														<select disabled class="form-control select" name="role">
															<option selected disabled value="${account.role}">${account.role.toUpperCase()}</option>
														</select>
													</c:when>
													<c:otherwise>
														<select class="form-control select" name="role"
															onchange="sendToServlet(this.value, '${account.username}')"
															required>
															<option selected disabled value="${account.role}">${account.role.toUpperCase()}</option>
															<c:forEach items="${Role.values()}" var="role">
																<c:choose>
																	<c:when test="${role ne 'ADMIN'}">
																		<option value="${role.getRole()}">${role.getRole().toUpperCase()}</option>
																	</c:when>
																	<c:when test="${role.getRole() eq account.role}">
																		<option value="${role.getRole()}">${role.getRole().toUpperCase()}</option>
																	</c:when>
																	
																</c:choose>
															</c:forEach>
														</select>
													</c:otherwise>
												</c:choose></td>
											<td class="text-center">
												<div class="edit-delete-btn">
													<c:choose>
														<c:when test="${account.role eq Role.ADMIN.getRole()}">
														</c:when>
														<c:otherwise>
															<a href="#" class="text-danger" data-bs-toggle="modal"
																data-bs-target="#${account.username}"> <i
																class="feather-trash-2 me-1"></i> Delete
															</a>
														</c:otherwise>
													</c:choose>
												</div>
												<div class="modal custom-modal fade" tabindex="-1"
													id="${account.username}" role="dialog">
													<div class="modal-dialog modal-dialog-centered">
														<div class="modal-content">
															<div class="modal-body">
																<div class="form-header">
																			<h3>Delete Account Details</h3>
																			<p>
																				Are you sure want to delete <b>${account.username}</b>?
																			</p>
																</div>
																<div class="modal-btn delete-action">
																	<div class="row">
																		<div class="col-6">
																				<a
																					href="delete-account?username=${account.username}"
																					class="btn btn-primary paid-continue-btn">Delete</a>
																		</div>
																		<div class="col-6">
																						<a href="javascript:void(0);" data-bs-dismiss="modal"
																				class="btn btn-primary paid-cancel-btn">Cancel</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row align-items-center">
						<div class="col-auto text-end float-end ms-auto download-grp">
							<a href="#" class="btn btn-outline-primary me-2"> <i
								class="fa fa-chevron-left"></i> Previous
							</a> <a href="#" class="btn btn-outline-primary me-2">Next <i
								class="fa fa-chevron-right"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	document.querySelectorAll('.edit-delete-btn a').forEach(function(link) {
		link.addEventListener('click', function(event) {
			event.preventDefault();
			$('#deleteModal').modal('show');
		});
	});
	
	function sendToServlet(selectedValue, username) {
	    var xhr = new XMLHttpRequest();
	    xhr.open('POST', 'editaccount', true);
	    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	    
	    var data = 'username=' + username + '&selectedRole=' + selectedValue;
	    xhr.send(data);
	}
</script>
<%@ include file="../includes/footer.jsp"%>
