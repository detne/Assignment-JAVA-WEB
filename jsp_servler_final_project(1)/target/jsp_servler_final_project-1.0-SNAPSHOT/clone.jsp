<%@ include file="../includes/header.jsp"%>
<div class="sidebar" id="sidebar">
	<div class="sidebar-inner slimscroll">
		<div id="sidebar-menu" class="sidebar-menu">
			<ul>
				<li class="active"><a href="userhome"><i
						class="feather-grid active"></i> <span>Home</span></a></li>
				<li class="submenu"><a href="#"><i class="fas fa-book"></i>
						<span>My Library</span> <span class="menu-arrow"></span></a>
					<ul>
						<li><a href="#">Published Documents</a></li>
						<li><a href="#">Pending Documents</a></li>
					</ul></li>
				<li><a href="user-notification"><i class="fas fa-bell"></i>
						<span>Notification</span></a></li>
			</ul>
		</div>
	</div>
</div>

<div class="page-wrapper">
	<div class="content container-fluid">

		<div class="page-header">
			<div class="row align-items-center">
				<div class="col">
					<h3 class="page-title">Search Document</h3>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="teachers.html">Document</a></li>
						<li class="breadcrumb-item active">Search</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<form action="user-search" method="POST">
							<div class="row">
								<div class="col-12 col-sm-3">
									<label>Search <span class="login-danger">*</span></label> <input
										name="cn1" type="text" class="form-control"
										value="${txtSearch}" placeholder="Search here">
								</div>
								<div class="col-12 col-sm-3">
									<div class="form-group ">
										<label>Major <span class="login-danger">*</span></label> 
										<select
											class="form-control select" name="major" id="slct1"
											name="major" onchange="populate(this.id,'slct2')">
											<option disabled selected value="">Please select a
												major</option>
											<c:forEach items="${majors}" var="major">
												<option value="${major.id}">${major.id}-
													${major.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-12 col-sm-3">
									<div class="form-group ">
										<label>Course <span class="login-danger">*</span></label> <select
											class="form-control select" name="course" id="slct2" disabled>
											<option disabled selected value="">Please select a
												major first</option>
										</select>
									</div>
								</div>

								<div class="col-12 col-sm-3">
									<div class="form-group ">
										<label>Category <span class="login-danger">*</span></label> <select
											class="form-control select" name="category">
											<option disabled selected value="">Please select a
												category</option>
											<c:forEach items="${categories}" var="category">
												<option value="${category.id_category}">${category.title_category}</option>
											</c:forEach>
										</select>
									</div>
								</div>

								<div class="col-12">
									<div class="student-submit">
										<button type="submit" class="btn btn-primary">Search</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	

	<c:choose>
		<c:when test="${filteredDocuments.size()==0}">
			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-body">
							<h4 class=" card-title">Searching Document: Not Found!</h4>
						</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row">
				<c:forEach items="${filteredDocuments}" var="document">
					<div class="col-md-6 col-xl-4 col-sm-12 d-flex">
						<div class="blog grid-blog flex-fill">
							<c:set var="imagePath"
								value="assets/img/major/${CourseUtils.getCourseById(document.idCourse).get().getId_major()}.jpg" />
							<div class="blog-image">
								<a href="details?id_document=${document.id}"> <img
									class="img-fluid" src="${imagePath}" alt="Post Image">
								</a>
							</div>
							<div class="blog-content">
								<ul class="entry-meta meta-item">
									<li>
										<div class="post-author">
											<a href="#"> <img src="assets/img/profiles/avatar-06.jpg"
												alt="Post Author"> <span> <span
													class="post-title">${document.username}</span> <span
													class="post-date"><i class="far fa-clock"></i>${DateTimeUtils.format(document.datePublished)}</span>
											</span>
											</a>
										</div>
									</li>
								</ul>
								<h3 class="blog-title">
									<a href="details?id_document=${document.id}">${document.title}</a>
								</h3>
								<p>${document.description}</p>
							</div>
							<div class="row">
								<div class="edit-options">
									<div class="edit-delete-btn">
										<a href="#" class="text-black"><i class="fa fa-heart"></i>
											111</a> <a href="blog-details.html" class="text-body"><i
											class="fa fa-comment me-1"></i> 1111</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
</div>

</div>

<script type="text/javascript">
	function populate(s1, s2) {
		var majorSelect = document.getElementById(s1);
		var courseSelect = document.getElementById(s2);
		courseSelect.innerHTML = "";
		courseSelect.innerHTML = "<option value='' disabled selected>Please select a course</option>";
		var courses = [];
		<c:forEach items="${courses}" var="course">
		var courseData = {
			id : '${course.id}',
			title : '${course.title}',
			id_major : '${course.id_major}'
		};
		courses.push(courseData);
		</c:forEach>

		for (var i = 0; i < courses.length; i++) {
			var course = courses[i];
			if (majorSelect.value == course.id_major) {
				var newOption = document.createElement("option");
				newOption.value = course.id;
				newOption.innerHTML = course.title + "  (" + course.id + ")";
				courseSelect.options.add(newOption);
			}
		}
		courseSelect.disabled = majorSelect.value === "Please select a major";
	}
</script>
<%@ include file="../includes/js.jsp"%>
<%@ include file="../includes/footer.jsp"%>