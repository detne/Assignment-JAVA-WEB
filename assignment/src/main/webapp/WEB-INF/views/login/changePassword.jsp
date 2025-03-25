<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật mật khẩu</title>
	<!-- Bootstrap 5 CDN Link -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom CSS Link -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/forgotPassword/css/changePassword.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body> 
    <section class="wrapper">
		<div class="container">
			<div class="col-sm-8 offset-sm-2 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4 text-center">
				
				<form class="rounded bg-white shadow p-5" action="${pageContext.request.contextPath }/changepassword?action=changePass" method="post" onsubmit="return checkValidatePassword()">
					<h3 class="text-dark fw-bolder fs-4 mb-2">Cài đặt lại mật khẩu</h3>

					<div class="fw-normal text-muted mb-2">
						Bạn đã có tài khoản chưa? <a href="${pageContext.request.contextPath }/login" class="text-primary fw-bold text-decoration-none">Đăng kí</a>
					</div>


                    <div class="form-floating mb-3">
                    
					
					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="newPassword" placeholder="Mật khẩu mới" name="newPassword">
						<span class="toggle-newPassword" onclick="showPassword()">
							<i class="far fa-eye"></i>
						  </span>
						<label for="floatingPassword">Mật khẩu mới</label>
                        <span id="errorNewPass" class="password-info mt-2 text-danger">Mật khẩu phải chứa kí tự đặc biệt,có tối thiểu 1 chữ viết hoa,<br>viết thường, có số và có đội dài từ 8-20</span>
					</div> 
                    <div class="form-floating mb-3">
						<input type="password" class="form-control" id="confirmPassword" placeholder="Xác thực lại mật khẩu" name="confirmPassword">
						<label for="floatingPassword">Xác thực lại mật khẩu</label>
						<span id="errorConfirmPass" class="password-info mt-2 text-danger"></span>
					</div> 
					<span class="toggle-confirmPassword" onclick="showPassword1()">
						<i class="far fa-eye"></i>
					  </span>
                    <!-- <a href="../login/index.html" class="btn btn-primary submit_btn  my-4">Cập nhật</a> -->
					<input type="submit" value="Cập nhật" id="submitChangePassword" class="btn btn-primary submit_btn  my-4"/>
				</form>
			</div>
		</div>
	</section>

	<script src="${pageContext.request.contextPath }/assets/forgotPassword/js/app.js"></script>
</body>

</html>