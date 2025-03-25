<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Xác thực Email</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<div class="container d-flex flex-column">
		<div
			class="row align-items-center justify-content-center
          min-vh-100">
			<div class="col-12 col-md-8 col-lg-4">
				<div class="card shadow-sm">
					<div class="card-body">
						<div class="mb-4">
							<h5>Bạn quên mật khẩu?</h5>
							<p class="mb-2">Bạn vui lòng nhập email để nhận mã xác thực</p>
						</div>
						<form
							action="${pageContext.request.contextPath }/email?action=email"
							onsubmit="return checkValidateEmail()" method="post">
							<div class="mb-3">
								<label for="email" class="form-label">Email</label>
								<span style="color: red; font-weight: bold;margin-left: 1px;">*</span> 
									<input
									type="email" id="email" class="form-control" name="email"
									placeholder="Vui lòng nhập email" required="required">
							<%
							  HttpSession session2 = request.getSession();
							  String email = (String) session2.getAttribute("msgEmail");
							  String msg = email;
							  session2.removeAttribute("msgEmail");
							
							%>		
							
							<p style="color: red; font-weight: bold;"><%= msg != null ? msg : "" %></p>

							</div>
							<p id="error" style="color: red;"></p>
							<div class="mb-3 d-grid">


								<input type="submit" value="Xác thực" id="submitRegister"
									class="btn btn-primary" />
							</div>
							<span>Bạn đã có tài khoản ? <a
								href="${pageContext.request.contextPath }/login">Đăng kí</a></span>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath }/assets/forgotPassword/js/app.js"></script>
</body>

</html>