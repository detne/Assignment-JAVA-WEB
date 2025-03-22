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
                        <li>
                            <a href="showaccounts"><i class="fas fa-users"></i> <span>Account</span></a>
                        </li>
                        <li class="submenu active">
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
			<div class="col-xl-4 col-sm-6 col-12 d-flex">
				<div class="card bg-comman w-100">
					<div class="card-body">
						<div
							class="db-widgets d-flex justify-content-between align-items-center">
							<div class="db-info">
								<h6>Majors</h6>
								<h3>${dataIndex[0]}</h3>
							</div>
							<div class="db-icon">
								<img src="assets/img/icons/major-icon.svg"
									alt="Dashboard Icon">
							</div>
						</div>
						<a href="addnewmajor" class="btn btn-outline-primary me-2"><i
							class="fas"></i>Add new major</a>
					</div>
				</div>
			</div>
			<div class="col-xl-4 col-sm-6 col-12 d-flex">
				<div class="card bg-comman w-100">
					<div class="card-body">
						<div
							class="db-widgets d-flex justify-content-between align-items-center">
							<div class="db-info">
								<h6>Courses</h6>
								<h3>${dataIndex[1]}</h3>
							</div>
							<div class="db-icon">
								<img src="assets/img/icons/course-icon.svg"
									alt="Dashboard Icon">
							</div>
						</div>
						<a href="#" class="btn btn-outline-primary me-2"><i
							class="fas"></i>Add new course</a>
					</div>
				</div>
			</div>
			<div class="col-xl-4 col-sm-6 col-12 d-flex">
				<div class="card bg-comman w-100">
					<div class="card-body">
						<div
							class="db-widgets d-flex justify-content-between align-items-center">
							<div class="db-info">
								<h6>Categories</h6>
								<h3>${dataIndex[2]}</h3>
							</div>
							<div class="db-icon">
								<img src="assets/img/icons/category-icon.svg"
									alt="Dashboard Icon">
							</div>
						</div>
						<a href="#" class="btn btn-outline-primary me-2"><i
							class="fas"></i>Add new category</a>
					</div>
				</div>
			</div>
		</div>


		<div class="row align-content-center justify-content-center">
			<div class="col-sm-6">
				<div class="card card-table">
					<div class="card-body">

						<div class="table-responsive">
							<table
								class="table star-student table-hover table-center table-borderless table-striped">
								<thead class="student-thread">
									<tr>
										<th>Major ID</th>
										<th>Major</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${majors}" var="major">
										<tr>
											<td><a>${major.id}</a></td>
											<td>${major.name}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card">
					<div class="card-body">
						<form action="a-index.jsp" method="post">
							<div class="row">
								<div class="col-12">
									<h5 class="form-title">
										<span>Major Details</span>
									</h5>
								</div>
								<div class="col-12 col-sm-6">
									<div class="form-group local-forms">
										<label>Major ID <span class="login-danger">*</span></label>
										<input type="text" class="form-control">
									</div>
								</div>
								<div class="col-12 col-sm-6">
									<div class="form-group local-forms">
										<label>Major Name <span class="login-danger">*</span></label>
										<input type="text" class="form-control">
									</div>
								</div>
								<div class="col-12 col-sm-4">
									<div class="student-submit">
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../includes/footer.jsp"%>
