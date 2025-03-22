<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
						<h1>Confirm Reset Password</h1>
						<p class="account-subtitle">___________________________________________</p>
						<form action="newwpassword" METHOD="POST">
							<div class="form-group">
								<label>Enter New Password <span class="login-danger">*</span></label>
								<input class="form-control pass-confirm" type="pasword" name="password" required> <span
									class="profile-views feather-eye reg-toggle-password"></span>
							</div>
							<div class="form-group">
								<label>Confirm New password <span class="login-danger">*</span></label>
								<input class="form-control pass-confirm" type="pasword" name="confirm" required> <span
									class="profile-views feather-eye reg-toggle-password"></span>
							</div>
							<div class="form-group mb-0">
								<button class="btn btn-primary btn-block" type="submit">Reset
									Password</button>
							</div>
							<p class="mt-1 account-subtitle">
								Back to login? <a href="login">Login Here</a>
							</p>
						</form>
						<c:choose>
                            <c:when test="${not empty sNPASS}">
                                <div class="mt-2 text-success font-weight-bold">${sNPASS}</div>
                            </c:when>
                            <c:otherwise>
                                <div class="mt-2 text-danger font-weight-bold">${fNPASS}</div>
                            </c:otherwise>
                        </c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../includes/js.jsp"%>
