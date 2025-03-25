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
<%
Properties properties = new Properties();
properties.put("mail.imap.host", "imap.gmail.com");
properties.put("mail.imap.port", "993");
properties.put("mail.imap.starttls.enable", "true");
properties.put("mail.imap.ssl.enable", "true");
properties.put("mail.imap.auth", "true");
MailHelper mailHelper = new MailHelper();
Session session1 = Session.getInstance(properties, new Authenticator() {
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("atun123456789cu@gmail.com", "qnwb zznk duhr ogmw");
	}
});

Store store = session1.getStore("imap");
store.connect();

Folder inbox = store.getFolder("INBOX");
inbox.open(Folder.READ_ONLY);

// Lấy tất cả các email
Message[] messages = inbox.getMessages();
request.setAttribute("messages", messages);

// Giới hạn số lượng email hiển thị
int numberOfEmailsToShow = 10;
int startIndex = Math.max(messages.length - numberOfEmailsToShow, 0);

for (int i = startIndex; i < messages.length; i++) {
	Message message = messages[i];
	System.out.println("Email Subject: " + message.getSubject());
	System.out.println("From: " + message.getFrom()[0]);
	System.out.println("Sent Date: " + message.getSentDate());
	System.out.println("---------------------------------");
}

inbox.close(false);
store.close();
%>
<div class="content-wrapper">

	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Inbox</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Inbox</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<section class="content">
		<div class="row">

			<div class="col-md-12">
				<div class="card card-primary card-outline">
					<div class="card-header">
						<h3 class="card-title">Inbox</h3>
						<div class="card-tools">
							<div class="input-group input-group-sm">
								<input type="text" class="form-control"
									placeholder="Search Mail">
								<div class="input-group-append">
									<div class="btn btn-primary">
										<i class="fas fa-search"></i>
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="card-body p-0">
						<div class="mailbox-controls">

							<button type="button"
								class="btn btn-default btn-sm checkbox-toggle">
								<i class="far fa-square"></i>
							</button>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="far fa-trash-alt"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fas fa-reply"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fas fa-share"></i>
								</button>
							</div>

							<button type="button" class="btn btn-default btn-sm">
								<i class="fas fa-sync-alt"></i>
							</button>
							<div class="float-right">
								1-50/200
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-chevron-left"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-chevron-right"></i>
									</button>
								</div>

							</div>

						</div>
						<div class="table-responsive mailbox-messages">
							<table class="table table-hover table-striped">
								<tbody>
									<%
									for (int i = messages.length - 1; i > messages.length - 11; i--) {
										Message message = messages[i];
									%>
									<tr>
										<td>
											<div class="icheck-primary">
												<input type="checkbox" value id="check1"> <label
													for="check1"></label>
											</div>
										</td>
										<td class="mailbox-star"><a href="#"><i
												class="fas fa-star text-warning"></i></a></td>
										<td class="mailbox-name"><a href="read-mail.html"><%=message.getFrom()[0]%></a></td>
										<td class="mailbox-subject"><b><%=message.getSubject()%></b>
											-</td>
										<td class="mailbox-attachment"></t	d>
										<td class="mailbox-date"><%=message.getSentDate()%></td>
										
										
										<td class="mailbox-date"><a href="${pageContext.request.contextPath }/superadmin/receiverEmail?action=emailDetails&emailID=<%= i %>">Xem email</a></td>
										


									</tr>
									<%
									}
									%>
								</tbody>
							</table>

						</div>

					</div>

					<div class="card-footer p-0">
						<div class="mailbox-controls">

							<button type="button"
								class="btn btn-default btn-sm checkbox-toggle">
								<i class="far fa-square"></i>
							</button>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="far fa-trash-alt"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fas fa-reply"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fas fa-share"></i>
								</button>
							</div>

							<button type="button" class="btn btn-default btn-sm">
								<i class="fas fa-sync-alt"></i>
							</button>
							<div class="float-right">
								1-50/200
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-chevron-left"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fas fa-chevron-right"></i>
									</button>
								</div>

							</div>

						</div>
					</div>
				</div>

			</div>

		</div>

	</section>

</div>