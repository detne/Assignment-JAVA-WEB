<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="utils.DateTimeUtils"%>

<%@ page import="persistence.Document"%>
<%@ include file="../includes/header.jsp"%>
<div class="sidebar" id="sidebar">
	<div class="sidebar-inner slimscroll">
		<div id="sidebar-menu" class="sidebar-menu">
			<ul>
				<li class="active"><a href="u-index.jsp"><i
						class="feather-grid active"></i> <span>Home</span></a></li>
				<li><a href="u-notification.jsp"><i class="fas fa-book"></i>
						<span>My Library</span></a></li>
				<li><a href="u-notification.jsp"><i class="fas fa-bell"></i>
						<span>Notification</span></a></li>
			</ul>
		</div>
	</div>
</div>
<div class="page-wrapper">
	<div class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-lg-10 col-xl-9">

				<div class="blog-view">
					<div class="blog-single-post">
						<a href="userhome" class="back-btn"><i
							class="feather-chevron-left"></i> Back</a>
						<c:set var="imagePath" value="assets/img/major/${CourseUtils.getCourseById(document.idCourse).get().getId_major()}.jpg" />
						<div class="blog-image">
							<a href="javascript:void(0);"><img alt=""
								src="${imagePath}" class="img-fluid"></a>
						</div>
						<h3 class="blog-title">${document.title}</h3>
						<div class="blog-info">
							<div class="post-list">
								<ul>
									<li>
										<div class="post-author">
											<a href="#"><img
												src="assets/img/profiles/avatar-14.jpg" alt="Post Author">
												<span>by ${document.username}</span></a>
										</div>
									</li>
									<li><i class="feather-clock"></i>${DateTimeUtils.format(document.datePublished)}</li>
									<li><i class="feather-grid"></i> ${CourseUtils.getCourseById(document.idCourse).get().getTitle()}</li>
								</ul>
							</div>
						</div>
						<div class="blog-content">
							<p>${document.description}</p>
							<object data="${dataUrl}" type="${mineType}" width="100%"
								height="800"></object>
						</div>

					</div>

					<div class="card blog-comments">
						<div class="card-header">
							<h4 class="card-title">Comments (5)</h4>
							<h4>${fileData}</h4>
						</div>
						<div class="card-body pb-0">
							<ul class="comments-list">
								<li>
									<div class="comment">
										<div class="comment-author">
											<img class="avatar" alt=""
												src="assets/img/profiles/avatar-13.jpg">
										</div>
										<div class="comment-block">
											<div class="comment-by">
												<h5 class="blog-author-name">
													Michelle Fairfax <span class="blog-date"> <i
														class="feather-clock me-1"></i>Dec 6, 2017
													</span>
												</h5>
											</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit. Nam viverra euismod odio, gravida pellentesque urna
												varius vitae, gravida pellentesque urna varius vitae. Lorem
												ipsum dolor sit amet, consectetur adipiscing elit.</p>
											<a class="comment-btn" href="#"> <i
												class="fa fa-reply me-2"></i> Reply
											</a>
										</div>
									</div>
								</li>
								<li>
									<div class="comment">
										<div class="comment-author">
											<img class="avatar" alt=""
												src="assets/img/profiles/avatar-09.jpg">
										</div>
										<div class="comment-block">
											<div class="comment-by">
												<h5 class="blog-author-name">
													Elsie Gilley <span class="blog-date"> <i
														class="feather-clock me-1"></i> 7 Dec 2022
													</span>
												</h5>
											</div>
											<p>sed do eiusmod tempor incididunt ut labore et dolore
												magna aliqua. Ut enim ad minim veniam, quis nostrud
												exercitation.</p>
											<a class="comment-btn" href="#"> <i
												class="fa fa-reply me-2"></i> Reply
											</a>
										</div>
									</div>
								</li>
								<li>
									<div class="comment">
										<div class="comment-author">
											<img class="avatar" alt=""
												src="assets/img/profiles/avatar-11.jpg">
										</div>
										<div class="comment-block">
											<div class="comment-by">
												<h5 class="blog-author-name">
													Joan Gardner <span class="blog-date"> <i
														class="feather-clock me-1"></i> 12 Dec 2022
													</span>
												</h5>
											</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipiscing
												elit.</p>
											<a class="comment-btn" href="#"> <i
												class="fa fa-reply me-2"></i> Reply
											</a>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<%@ include file="../includes/footer.jsp"%>