<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Xác thực mã OTP</title>
    <!-- Bootstrap 5 CDN Link -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <!-- Custom CSS Link -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/forgotPassword/css/otp.css" />

   <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

     <script>
      $(document).ready(function () {
        var index = 0;
        // $("input").focus(function () {
        //   console.log(index);
        // });
        $("input").keyup(function (e) {
          if (e.keyCode == 8) {
            if (index >= 6) {
              index = 6;
              index = index - 1;
              $("#i" + index + "").focus();
            } else {
              index = index - 1;
              $("#i" + index + "").focus();
            }
          } else if (/\D/g.test(this.value)) {
            // Filter non-digits from input value.
            this.value = this.value.replace(/\D/g, "");
          } else {
            if (index <= 0) {
              index = 1;    
              index = index + 1;    
              $("#i" + index + "").focus();         
            } else {
              index = index + 1;
              $("#i" + index + "").focus();
            }
            console.log(index);
          }
        });
      });
    </script>
  </head>
  <body>
    <section class="wrapper">
      <div class="container">
        <div
          class="col-sm-8 offset-sm-2 col-lg-6 offset-lg-3 col-xl-6 offset-xl-3 text-center"
        >
          <div class="logo">
            <!-- <img decoding="async" src="images/logo.png" class="img-fluid" alt="logo"> -->
          </div>
          <form
          	id="submit-otp"
            class="rounded bg-white shadow p-5"
            action="${pageContext.request.contextPath }/otp?action=otp"
            method="post"
          >
            <h3 class="text-dark fw-bolder fs-4 mb-2">Nhập mã xác thực</h3>

            <div class="fw-normal text-muted mb-4">
              Vui lòng nhập mã xác thực mà chúng tôi đã gửi cho bạn
            </div>
			<%
				HttpSession session2 = request.getSession();
				String announce = (String) session2.getAttribute("announceOTP");
				String announceOTP = announce;
				session.removeAttribute("announceOTP");
			%>
			<c:if test="<%= announceOTP == null %>">
            <div
              class="d-flex align-items-center justify-content-center fw-bold mb-4"
            >
              Chúng tôi đã gửi vào email ${sessionScope.accountEmail.email } một đoạn mã OTP. Xin vui lòng bạn điền cho.
            </div>
            </c:if>
            
            <c:if test="<%= announceOTP != null %>">
            <div
              class="d-flex align-items-center justify-content-center fw-bold mb-4"
            >
              Hệ thống đã cập nhật đoạn mã OTP mới vào email ${sessionScope.accountEmail.email }. Xin vui lòng bạn điền cho.
            </div>
			</c:if>
            <div class="otp_input text-start mb-2">
              <label for="digit">Nhập 6 kí tự xác thực</label>
              <div
                class="d-flex align-items-center justify-content-between mt-2 inputfield"
              >
                <input
                  id="i1"
                  type="text"
                  class="form-control"
                  placeholder=""
                  maxlength="1"
                  name = "i1"
                  required
/>
                <input
                  id="i2"
                  type="text"
                  class="form-control"
                  placeholder=""
                  maxlength="1"
                  name = "i2"
                  required
                />
                <input
                  id="i3"
                  type="text"
                  class="form-control"
                  placeholder=""
                  maxlength="1"
                  name = "i3"
                  required
                />
                <input
                  id="i4"
                  type="text"
                  class="form-control"
                  placeholder=""
                  maxlength="1"
                  name = "i4"
                  required
                />
                <input
                  id="i5"
                  type="text"
                  class="form-control"
                  placeholder=""
                  maxlength="1"
                  name = "i5"
                  required
                />
                <input
                  id="i6"
                  type="text"
                  class="form-control"
                  placeholder=""
                  maxlength="1"
                  name = "i6"
                  required
                />
              </div>
            </div>

            <input
              type="submit"
              id="submit"
              class="btn btn-primary submit_btn my-4"
              value="Gửi"
            />
			<%
				HttpSession session3 = request.getSession();
				String otp = (String) session3.getAttribute("msgOTP");
				String msg = otp;
				session2.removeAttribute("msgOTP");
							
			%>		
							
			<p style="color: red; font-weight: bold;"><%= msg != null ? msg : "" %></p>
            <!-- <input type="submit" value="Gửi" id="submitOTP" class="btn btn-primary"/> -->
            <div class="fw-normal text-muted mb-2">
              Bạn đã nhận được mã chưa ?
              <a href="${pageContext.request.contextPath }/otp?action=resendOTP" class="text-primary fw-bold text-decoration-none"
                >Gửi lại</a
              >
            </div>
          </form>
        </div>
      </div>
    </section>
  </body>

</html>