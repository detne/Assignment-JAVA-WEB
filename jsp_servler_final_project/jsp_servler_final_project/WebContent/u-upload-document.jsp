<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<div class="sidebar" id="sidebar">
	<div class="sidebar-inner slimscroll">
		<div id="sidebar-menu" class="sidebar-menu">
			<ul>
				<li class="active"><a href="userhome"><i
						class="feather-grid active"></i> <span>Home</span></a></li>
				<li class="submenu">
	                         <a href="#"><i class="fas fa-book"></i> <span>My Library</span> <span
	                                 class="menu-arrow"></span></a>
	                         <ul>
	                             <li><a href="#">Published Documents</a></li>
	                             <li><a href="#">Pending Documents</a></li>
	                         </ul>
	            </li>
				<li><a href="u-notification.jsp"><i class="fas fa-bell"></i> <span>Notification</span></a>
				</li>
			</ul>
		</div>
	</div>
</div>

<div class="page-wrapper">
	<div class="content container-fluid">

		<div class="page-header">
			<div class="row align-items-center">
				<div class="col">
					<h3 class="page-title">Upload Document</h3>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="teachers.html">User</a></li>
						<li class="breadcrumb-item active">Upload Document</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<form action="upload" method="POST" enctype="multipart/form-data">
							<div class="row">
									<a href="userhome" class="back-btn"><i
										class="feather-chevron-left"></i> Back</a>
								<div class="col-12">
									<h5 class="form-title">
										<span>Document Details</span>
									</h5>
								</div>
								<div class="col-lg-12 col-md-12">
									<div class="form-group">
										<label>Title <span class="text-danger">*</span></label> <input
											type="text" class="form-control" name="title"
											placeholder="Please enter document's title" required>
									</div>
								</div>
								<div class="col-12 col-sm-4">
									<div class="form-group ">
										<label>Major <span class="login-danger">*</span></label> <select
											class="form-control select" name="major" id="slct1"
											name="major" required onchange="populate(this.id,'slct2')">
											<option disabled selected value="">Please select a
												major</option>
											<c:forEach items="${majors}" var="major">
												<option value="${major.id}">${major.id}-
													${major.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-12 col-sm-4">
									<div class="form-group ">
										<label>Course <span class="login-danger">*</span></label> <select
											class="form-control select" name="course" id="slct2" disabled
											required>
											<option disabled selected value="">Please select a
												major first</option>
										</select>
									</div>
								</div>

								<div class="col-12 col-sm-4">
									<div class="form-group ">
										<label>Category <span class="login-danger">*</span></label> <select
											class="form-control select" name="category" required>
											<option disabled selected value="">Please select a
												category</option>
											<c:forEach items="${categories}" var="category">
												<option value="${category.id_category}">${category.title_category}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-lg-12 col-md-12">
									<div class="form-group">
										<label>Description <span class="login-danger">*</span></label>
										<textarea
											placeholder="Please give give as much as additional information as possible"
											class="form-control" rows="4" name="description" required></textarea>
									</div>
								</div>

								<div class="col-lg-12 col-md-12">
									<div class="form-group">
										<label class="col-form-label col-md-2">File Input <span
											class="login-danger">*</span></label>
										<div class="col-md-10">
											<input type="file" class="form-control" id="fileInput" name="file" 
											accept=".doc, .docx, .pdf" onchange="fileSelected()" required>
										</div>
									</div>
								</div>
								<script>
									function fileSelected() {
									    var fileInput = document.getElementById("fileInput");
									    var fileName = fileInput.value;
									    var fileExtension = fileName.split('.').pop().toLowerCase();
	
									    if (fileExtension !== "doc" && fileExtension !== "docx" && fileExtension !== "pdf") {
									        alert("Invalid file type. Only .doc, .docx, and .pdf are supported.");
									        fileInput.value = "";
									    }
									}
								</script>
								<div class="col-12">
									<div class="student-submit">
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</div>
							</div>
						</form>
						<c:choose>
							<c:when test="${not empty sUPLOAD}">
								<div class="mt-2 text-success font-weight-bold">${sUPLOAD}</div>
							</c:when>
							<c:otherwise>
								<div class="mt-2 text-danger font-weight-bold">${fUPLOAD}</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
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
<script src="assets/js/jquery-3.6.0.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/feather.min.js"></script>
<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/plugins/select2/js/select2.min.js"></script>
<script src="assets/plugins/moment/moment.min.js"></script>
<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
<script src="assets/js/script.js"></script>
<%@ include file="../includes/js.jsp"%>
<%@ include file="../includes/footer.jsp"%>