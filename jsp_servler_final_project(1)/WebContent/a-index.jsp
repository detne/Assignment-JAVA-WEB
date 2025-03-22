<%@ include file="../includes/header.jsp"%>
<div class="sidebar" id="sidebar">
            <div class="sidebar-inner slimscroll">
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <li class="active">
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
                        <li class="submenu">
                            <a href="#"><i class="fas fa-graduation-cap"></i> <span>Add new category</span> <span
                                    class="menu-arrow"></span></a>
                            <ul>
                                <li><a href="addnewmajor">Add new major</a></li>
                                <li><a href="addnewcourse">Add new course</a></li>
                                <li><a href="addnewcategory">Add new category</a></li>
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
							<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
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
								<img src="assets/img/icons/major-icon.svg" alt="Dashboard Icon">
							</div>
						</div>
						<a href="addnewmajor" class="btn btn-outline-primary me-2"><i
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
								<img src="assets/img/icons/course-icon.svg" alt="Dashboard Icon">
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
								<h6>All documents</h6>
								<h3>${dataIndex[3]}</h3>
							</div>
							<div class="db-icon">
								<img src="assets/img/icons/document-icon.svg"
									alt="Dashboard Icon">
							</div>
						</div>
						<a href="#" class="btn btn-outline-primary me-2"><i
							class="fas"></i>View all documents</a>
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
								<img src="assets/img/icons/user-icon.svg" alt="Dashboard Icon">
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
								<h6>Document Published</h6>
								<h3>${dataIndex[6]}</h3>
							</div>
							<div class="db-icon">
								<img src="assets/img/icons/published-icon.svg"
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
								<h6>Pending</h6>
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
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>