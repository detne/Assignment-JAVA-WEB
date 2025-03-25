<%@page import="service.MailHelper"%>
<%@page import="javax.mail.Folder"%>
<%@page import="javax.mail.Store"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Message"%>
<%@page import="dao.FeedbackDAO"%>
<%@page import="dao.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="content-wrapper">

	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Compose</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Compose</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<section class="content">
		<div class="container-fluid">
			<div class="row">
			

				<div class="col-md-12">
					<div class="card card-primary card-outline">
						<div class="card-header">
							<h3 class="card-title">${messageSubject}</h3>
							<div class="card-tools">
								<a href="#" class="btn btn-tool" title="Previous"><i
									class="fas fa-chevron-left"></i></a> <a href="#"
									class="btn btn-tool" title="Next"><i
									class="fas fa-chevron-right"></i></a>
							</div>
						</div>

						<div class="card-body p-0">
							<div class="mailbox-read-info">
								<h5>Message Subject Is Placed Here</h5>
								<h6>
									From: <a href="/cdn-cgi/l/email-protection"
										class="__cf_email__"
										data-cfemail="01727471716e73754160656c686f6d75642f686e">${messageFrom}</a>
									<span class="mailbox-read-time float-right">${messageSentDate }</span>
								</h6>
							</div>

							<div class="mailbox-controls with-border text-center">
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm"
										data-container="body" title="Delete">
										<i class="far fa-trash-alt"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm"
										data-container="body" title="Reply">
										<i class="fas fa-reply"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm"
										data-container="body" title="Forward">
										<i class="fas fa-share"></i>
									</button>
								</div>

								<button type="button" class="btn btn-default btn-sm"
									title="Print">
									<i class="fas fa-print"></i>
								</button>
							</div>

							<div class="mailbox-read-message">
								${messageContent}
							</div>

						</div>

						<div class="card-footer bg-white">
							<ul
								class="mailbox-attachments d-flex align-items-stretch clearfix">
								<li><span class="mailbox-attachment-icon"><i
										class="far fa-file-pdf"></i></span>
									<div class="mailbox-attachment-info">
										<a href="#" class="mailbox-attachment-name"><i
											class="fas fa-paperclip"></i> Sep2014-report.pdf</a> <span
											class="mailbox-attachment-size clearfix mt-1"> <span>1,245
												KB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
												class="fas fa-cloud-download-alt"></i></a>
										</span>
									</div></li>
								<li><span class="mailbox-attachment-icon"><i
										class="far fa-file-word"></i></span>
									<div class="mailbox-attachment-info">
										<a href="#" class="mailbox-attachment-name"><i
											class="fas fa-paperclip"></i> App Description.docx</a> <span
											class="mailbox-attachment-size clearfix mt-1"> <span>1,245
												KB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
												class="fas fa-cloud-download-alt"></i></a>
										</span>
									</div></li>
								<li><span class="mailbox-attachment-icon has-img"><img
										src="../../dist/img/photo1.png" alt="Attachment"></span>
									<div class="mailbox-attachment-info">
										<a href="#" class="mailbox-attachment-name"><i
											class="fas fa-camera"></i> photo1.png</a> <span
											class="mailbox-attachment-size clearfix mt-1"> <span>2.67
												MB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
												class="fas fa-cloud-download-alt"></i></a>
										</span>
									</div></li>
								<li><span class="mailbox-attachment-icon has-img"><img
										src="../../dist/img/photo2.png" alt="Attachment"></span>
									<div class="mailbox-attachment-info">
										<a href="#" class="mailbox-attachment-name"><i
											class="fas fa-camera"></i> photo2.png</a> <span
											class="mailbox-attachment-size clearfix mt-1"> <span>1.9
												MB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
												class="fas fa-cloud-download-alt"></i></a>
										</span>
									</div></li>
							</ul>
						</div>

						<div class="card-footer">
							<div class="float-right">
								<button type="button" class="btn btn-default">
									<i class="fas fa-reply"></i> Reply
								</button>
								<button type="button" class="btn btn-default">
									<i class="fas fa-share"></i> Forward
								</button>
							</div>
							<button type="button" class="btn btn-default">
								<i class="far fa-trash-alt"></i> Delete
							</button>
							<button type="button" class="btn btn-default">
								<i class="fas fa-print"></i> Print
							</button>
						</div>

					</div>

				</div>

			</div>

		</div>
	</section>

</div>
