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
						<h1>Reset Password</h1>
						<p class="account-subtitle">Reset your password in 3 steps:</p>
						<ol>
							<li>1. Enter your email below.</li>
							<li>2. We'll sent you OTP to your email.</li>
							<li>3. Enter OTP</li>
						</ol>
						<br>
						<form action="checkemail" method="post">
							<div class="form-group">
								<label>Enter your registered email address <span
									class="login-danger">*</span></label> <input class="form-control"
									type="email" name="email" required> <span class="profile-views"><i
									class="fas fa-envelope"></i></span>
							</div>
							<div class="form-group">
								<button class="btn btn-primary btn-block" type="submit">Reset
									My Password</button>
							</div>
							<p class="account-subtitle">
								Back to login? <a href="login">Login Here</a>
							</p>
						</form>
						<div class="mt-2 text-danger font-weight-bold">${fEMAIL}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../includes/js.jsp"%>