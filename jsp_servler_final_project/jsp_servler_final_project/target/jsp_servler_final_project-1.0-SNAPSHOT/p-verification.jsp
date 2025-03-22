<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/head.jsp"%>
<div class="main-wrapper login-body">
	<div class="login-wrapper">
		<div class="container">
			<div class="loginbox">
				<div class="login-left">
					<img class="img-fluid" src="assets/img/login.png" alt="Logo">
				</div>
				<div class="login-right">
					<div class="login-right-wrap">
						<h1>OTP Verification</h1>
						<b>A email with 6 digits already sent to your email.</b>
						<p>Enter OTP:</p>
						<form action="pass-verification" method="POST">
							<div class="form-group">
								<input class="form-control" type="text" name="otp" required>
							</div>
							<div class="form-group">
								<button class="btn btn-primary btn-block" type="submit">Submit</button>
							</div>
							<p class="account-subtitle">
								Back to login? <a href="login">Login Here</a>
							</p>
						</form>
						<div class="mt-2 text-danger font-weight-bold">${fPVERIFY}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../includes/js.jsp"%>