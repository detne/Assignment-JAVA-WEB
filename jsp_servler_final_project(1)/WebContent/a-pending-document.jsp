<%@ include file="../includes/header.jsp"%>
<div class="sidebar" id="sidebar">
            <div class="sidebar-inner slimscroll">
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <li>
                            <a href="a-index.jsp"><i class="feather-grid active"></i> <span>Dashboard</span></a>
                        </li>
                        <li class="submenu active">
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
                        <li class="submenu">
                            <a href="#"><i class="fas fa-graduation-cap"></i> <span>Add new category</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a href="#">Add new major</a></li>
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
								<h6>Majors</h6>
								<h3>${dataIndex[0]}</h3>
							</div>
							<div class="db-icon">
								<img src="assets/img/icons/major-icon.svg"
									alt="Dashboard Icon">
							</div>
						</div>
						<a href="#" class="btn btn-outline-primary me-2"><i
							class="fas"></i>Add new major</a>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-sm-6 col-12 d-flex">
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
			<div class="col-xl-3 col-sm-6 col-12 d-flex">
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
			<div class="col-xl-3 col-sm-6 col-12 d-flex">
				<div class="card bg-comman w-100">
					<div class="card-body">
						<div
							class="db-widgets d-flex justify-content-between align-items-center">
							<div class="db-info">
								<h6>Pending Documents</h6>
								<h3>${dataIndex[7]}</h3>
							</div>
							<div class="db-icon">
								<img src="assets/img/icons/pending-icon.svg"
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
									<h3 class="page-title">Pending Documents</h3>
								</div>
								<div class="col-auto text-end float-end ms-auto download-grp">
									<a href="#" 
										class="btn btn-outline-primary me-2">
										<i class="fa fa-chevron-left"></i>
										Previous 
									</a> 
									<a href="#"
										class="btn btn-outline-primary me-2">Next <i
										class="fa fa-chevron-right"></i>
									</a>
								</div>
							</div>
						</div>

						<div class="table-responsive">
							<table
								class="table star-student border-0 mb-0 table-hover table-center table-borderless table-striped">
								<thead class="student-thread">
									<tr>
										<th>ID</th>
										<th>Document Title</th>
										<th>Author</th>
										<th>Date Published</th>
										<th>Source</th>
										<th>Category</th>
										<th class="text-center">Action</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${pendingDocuments}" var="document">
										<tr>
											<td>${document.id}</td>
											<td><a href="details?id_document=${document.id}"> <b>${document.title}</b>
											</a></td>
											<td>
												<h2>${document.username}</h2>
											</td>
											<td>${DateTimeUtils.format(document.datePublished)}</td>
											<td><a style="color: blue;" href="details?id_document=${document.id}">file</a></td>
											<td>${CategoryUtils.getCategoryById(document.idCategory).get().getTitle_category()}</td>
											<td>
												<div
													class="actions align-content-center justify-content-center">
													<a href="details?id_document=${document.id}" class="btn btn-sm bg-success-light me-2"> <i
														class="feather-eye"></i>
													</a> <a href="admin-review?id_document=${document.id}&status=${Status.DECLINE.getStatus()}" 
														class="btn btn-sm bg-danger-light"> <i
														class="fa fa-times"></i>
													</a> <a href="admin-review?id_document=${document.id}&status=${Status.APPROVE.getStatus()}" class="btn btn-sm bg-danger-light"> <i
														class="fa fa-check"></i>
													</a>
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
<%@ include file="../includes/footer.jsp"%>