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
						<h1>Welcome to FDSH</h1>
						<p class="account-subtitle">
							Need an account? <a href="register">Sign Up</a>
						</p>
						<h2>Sign in</h2>

						<form action="login" method="POST">
							<div class="form-group">
								<label>Username <span class="login-danger">*</span></label> <input
									class="form-control" type="text" name="username" required> <span
									class="profile-views"><i class="fas fa-user-circle"></i></span>
							</div>
							<div class="form-group">
								<label>Password <span class="login-danger">*</span></label> <input
									class="form-control pass-input" type="password" name="password" required> <span
									class="profile-views feather-eye-off toggle-password"></span>
							</div>
							<div class="forgotpass">
								<div class="remember-me">
									<label class="custom_check mr-2 mb-0 d-inline-flex remember-me">
										Remember me <input type="checkbox" name="rmb-me"> <span
										class="checkmark"></span>
									</label>
								</div>
								<a href="checkemail">Forgot Password?</a>
							</div>
							<div class="form-group">
								<button class="btn btn-primary btn-block" type="submit">Login</button>
							</div>
						</form>
						<div class=" text-danger font-weight-bold">${fLOGIN}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../includes/js.jsp"%>
