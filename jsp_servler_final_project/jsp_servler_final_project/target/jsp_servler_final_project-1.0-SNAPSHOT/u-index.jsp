<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="utils.DateTimeUtils"%>
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
				<li><a href="user-notification"><i class="fas fa-bell"></i> <span>Notification</span></a>
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
						<h3 class="page-title">Welcome User!</h3>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-9">
				<ul class="list-links mb-4">
					<li class="active"><a href="#">General</a></li>
					<li><a href="personaldocuments">Personal</a></li>
				</ul>
			</div>
			<div class="col-md-3 text-md-end">
				<a href="upload" class="btn btn-primary btn-blog mb-3"><i
					class="feather-plus-circle me-1"></i> Upload</a>
			</div>
		</div>

		<div class="row">
			<c:forEach items="${publishedDocuments}" var="document">
				<div class="col-md-6 col-xl-4 col-sm-12 d-flex">
					<div class="blog grid-blog flex-fill">
						<c:set var="imagePath" value="assets/img/major/${CourseUtils.getCourseById(document.idCourse).get().getId_major()}.jpg" />
						<div class="blog-image">
							<a href="details?id_document=${document.id}">
								<img class="img-fluid" src="${imagePath}" alt="Post Image">
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
										class="fa fa-comment me-1"></i> 2233</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>