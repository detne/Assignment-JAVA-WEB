# Assignment-JAVA-WEB
# **MANAGEMENT APPLICATION APARTMENT**

# 1. Overview

Dự án **Management Application Apartment** là một hệ thống quản lý căn hộ trực tuyến, hỗ trợ người dùng đăng ký tài khoản, quản lý thông tin cá nhân, đăng bài ký gửi căn hộ, quản lý dịch vụ, hợp đồng, và sử dụng các tính năng nâng cao như chat trực tuyến, thanh toán. Đối với admin, hệ thống cung cấp các công cụ để quản lý tài khoản, bài đăng, dịch vụ, doanh thu, phản hồi và hợp đồng. Dự án được phát triển bởi nhóm 6 thành viên, kết hợp giữa Frontend (JSP, HTML, CSS, JS) và Backend (Java Servlet, DAO).

## Members:

-   **Phan Thị Ngọc Quyên** - Leader
-   **Nguyễn Song Gia Huy**
-   **Lê Hữu Nguyên Khang**
-   **Lê Tự Thanh Huy**
-   **Nguyễn Phương Thảo**
-   **Lê Ngọc Thiện**

#### Các chức năng chính:

-   **Frontend**:
    -   Hiển thị trang chủ với giới thiệu website và danh sách căn hộ mới nhất.
    -   Xem danh sách căn hộ (căn hộ hệ thống và căn hộ ký gửi), chi tiết từng căn hộ.
    -   Tìm kiếm/lọc căn hộ theo tiêu đề, địa điểm, với gợi ý từ khóa (autocomplete).
    -   Quản lý danh sách yêu thích (lưu và xem lại căn hộ đã đánh dấu).
    -   Trang tài khoản người dùng (xem và cập nhật thông tin cá nhân).
    -   Đăng bài ký gửi căn hộ (nhập thông tin, tải ảnh, trạng thái chờ duyệt).
    -   Xem bài đăng của tôi (danh sách bài đăng kèm trạng thái duyệt).
    -   Gửi thông tin liên hệ/góp ý (không cần đăng nhập).
    -   Chat trực tuyến với admin (real-time qua websocket).
    -   Đăng nhập bằng Google và hỗ trợ đa ngôn ngữ (Anh - Việt).
-   **Backend**:
    -   Quản lý tài khoản người dùng (đăng ký, đăng nhập, xác thực qua email, cập nhật thông tin).
    -   Quản lý căn hộ hệ thống và căn hộ ký gửi (CRUD: Create, Read, Update, Delete).
    -   Quản lý bài đăng chờ duyệt (phê duyệt/từ chối).
    -   Quản lý hợp đồng và giao dịch bán (tạo hợp đồng, theo dõi doanh thu).
    -   Quản lý dịch vụ đăng tin và giao dịch thanh toán (gói dịch vụ, nạp tiền).
    -   Xử lý chat, phản hồi, liên hệ từ người dùng.
    -   Quản lý phân quyền (admin, user) và nhật ký hệ thống (log hoạt động).
-   **Database**:
    -   Lưu trữ thông tin tài khoản (Account, Accountdetails), căn hộ (SystemApartment, Post), hợp đồng (Contract), dịch vụ (Service, AccountService), giao dịch (Transaction), liên hệ (Contact), phản hồi (Feedback), và nhật ký (Log).
    -   Sử dụng bảng trung gian để quản lý quan hệ nhiều-nhiều (ví dụ: AccountService, Wishlist).
    -   Thuộc tính trạng thái (status) để theo dõi bài đăng, hợp đồng, giao dịch.

#### Công nghệ sử dụng:

-   **Backend**: Java, Servlet, JSP, Maven, JDBC, BCrypt (mã hóa mật khẩu), JavaMail (email), Gson (JSON), Websocket (chat).
-   **Frontend**: JSP, HTML, CSS, JavaScript, Ajax (autocomplete, load more).
-   **Database**: MySQL.

# 2. Getting Started

#### Yêu cầu hệ thống:

-   **Máy chủ**: Java Runtime Environment (JRE) 8+, Apache Tomcat.
-   **Môi trường phát triển**: JDK 8+, Maven, IDE (IntelliJ IDEA, Eclipse).
-   **Frontend**: Trình duyệt web hiện đại (Chrome, Firefox).
-   **Database**: MySQL 5.7+.

#### Quy trình phát triển:

-   **Phân tích yêu cầu**: Xác định chức năng (đăng ký, quản lý căn hộ, chat).
-   **Thiết kế cơ sở dữ liệu**: Tạo ERD và script SQL cho bảng dữ liệu.
-   **Phát triển backend**: Xây dựng logic bằng Servlet, DAO, xử lý yêu cầu HTTP.
-   **Phát triển frontend**: Thiết kế giao diện JSP, tích hợp Ajax cho tính năng động.
-   **Tích hợp**: Kết nối frontend-backend qua Servlet và JSP.
-   **Kiểm thử**: Kiểm tra chức năng (đăng nhập, tìm kiếm, duyệt bài).
-   **Triển khai**: Cài đặt trên Tomcat với MySQL làm cơ sở dữ liệu.

#### Ưu tiên:

-   Đảm bảo bảo mật (mã hóa mật khẩu, xác thực OTP).
-   Tối ưu hóa tìm kiếm/lọc căn hộ và chat real-time.
-   Ưu tiên công cụ quản trị (quản lý tài khoản, bài đăng).
-   Hỗ trợ mở rộng cho số lượng người dùng và căn hộ tăng dần.

# 3. Database Design

(Phần này được up bổ sung sơ đồ ERD cụ thể.)

# 4. Use Cases

## Use-case 1: Sign Up

**Mô tả**: Cho phép người dùng tạo tài khoản mới để truy cập hệ thống.

**Input**:

-   Username
-   Password
-   Email

**Quy trình xử lý**:

1.  Kiểm tra username và email:
    -   Nếu đã tồn tại: Thông báo "Tài khoản đã tồn tại" và yêu cầu nhập lại.
    -   Nếu chưa tồn tại: Tiếp tục bước tiếp theo.
2.  Gửi email xác thực:
    -   Tạo mã OTP qua RandomStringHelper, gửi qua MailHelper.
    -   Người dùng nhập OTP tại /otp, nếu khớp thì kích hoạt tài khoản (verify = true).

**Output**:

-   Thông báo "Đăng ký thành công" và chuyển hướng đến trang đăng nhập.

----------

## Use-case 2: Sign In

**Mô tả**: Người dùng đăng nhập vào hệ thống bằng tài khoản đã đăng ký.

**Input**:

-   Username
-   Password

**Quy trình xử lý**:

1.  Kiểm tra thông tin đăng nhập:
    -   Nếu đúng: Lưu Account vào session, kiểm tra vai trò (role).
    -   Nếu sai: Hiển thị "Sai username hoặc mật khẩu", tải lại trang.
2.  Phân quyền:
    -   role = admin: Chuyển đến dashboard admin.
    -   role = user: Chuyển đến trang chủ người dùng.

**Output**:

-   Chuyển hướng đến trang tương ứng theo vai trò.

----------

## Use-case 3: Forgot Password

**Mô tả**: Hỗ trợ người dùng khôi phục mật khẩu qua email.

**Input**:

-   Email

**Quy trình xử lý**:

1.  Kiểm tra email:
    -   Nếu tồn tại: Gửi OTP qua EmailServlet.
    -   Nếu không: Hiển thị "Email không tồn tại".
2.  Xác nhận OTP:
    -   Nếu khớp: Chuyển đến trang đổi mật khẩu.
    -   Nếu sai: Hiển thị "OTP không hợp lệ".
3.  Đổi mật khẩu:
    -   Nếu "confirm password" khớp: Cập nhật qua AccountDAO, thông báo "Đổi mật khẩu thành công".
    -   Nếu không khớp: Hiển thị "Xác nhận mật khẩu không đúng".

**Output**:

-   Thông báo "Đổi mật khẩu thành công" hoặc lỗi tương ứng.

----------

## Use-case 4: Post Apartment

**Mô tả**: Người dùng đăng bài ký gửi căn hộ để bán/cho thuê.

**Input**:

-   Tiêu đề
-   Địa điểm
-   Mô tả
-   Ảnh (upload)

**Quy trình xử lý**:

1.  Kiểm tra thông tin:
    -   Nếu thiếu: Hiển thị "Vui lòng nhập đầy đủ thông tin".
    -   Nếu đủ: Lưu bài đăng vào Post với trạng thái "chờ duyệt".
2.  Upload ảnh:
    -   Sử dụng UploadFileHelper để lưu ảnh vào server.

**Output**:

-   Chuyển hướng đến trang "Bài đăng của tôi" với thông báo "Đăng bài thành công, chờ duyệt".

----------

## Use-case 5: Search/Filter Apartments

**Mô tả**: Người dùng tìm kiếm và lọc căn hộ theo tiêu chí.

**Input**:

-   Tiêu đề
-   Địa điểm
-   Loại căn hộ (hệ thống/ký gửi)

**Quy trình xử lý**:

1.  Nhập tiêu chí tìm kiếm:
    -   Gợi ý từ khóa qua AutocompleteServlet.
2.  Lọc và hiển thị:
    -   Truy vấn PostDAO hoặc SystemApartmentDAO, trả về danh sách phù hợp.

**Output**:

-   Hiển thị danh sách căn hộ theo bộ lọc.

----------

## Use-case 6: Manage Wishlist

**Mô tả**: Người dùng lưu và quản lý danh sách căn hộ yêu thích.

**Input**:

-   ID căn hộ

**Quy trình xử lý**:

1.  Thêm vào yêu thích:
    -   Nhấn nút "Thêm", lưu vào Wishlist qua WishlistApartmentServlet.
2.  Xem danh sách:
    -   Hiển thị các căn hộ đã lưu từ PostDAO.

**Output**:

-   Danh sách căn hộ yêu thích được cập nhật.

----------

## Use-case 7: Approve Post

**Mô tả**: Admin duyệt bài đăng căn hộ ký gửi từ người dùng.

**Input**:

-   Chấp nhận/Từ chối (button)

**Quy trình xử lý**:

1.  Truy cập danh sách chờ duyệt:
    -   Lấy từ PostDAO các bài có trạng thái "chờ duyệt".
2.  Quyết định:
    -   Chấp nhận: Chuyển trạng thái thành "đã duyệt".
    -   Từ chối: Xóa bài đăng, thông báo cho người dùng.

**Output**:

-   Thông báo "Đã duyệt" hoặc "Bị từ chối" gửi đến người dùng.

----------

## Use-case 8: Create Contract

**Mô tả**: Admin tạo hợp đồng mua bán căn hộ khi giao dịch thành công.

**Input**:

-   ID căn hộ
-   Người mua
-   Người bán
-   Điều khoản

**Quy trình xử lý**:

1.  Nhập thông tin:
    -   Chọn căn hộ từ SystemApartmentDAO hoặc PostDAO.
2.  Lưu hợp đồng:
    -   Gọi ContractDAO.create() để lưu vào cơ sở dữ liệu.

**Output**:

-   Thông báo "Hợp đồng đã được tạo".

----------

## Use-case 9: Chat with Admin

**Mô tả**: Người dùng trò chuyện real-time với admin.

**Input**:

-   Tin nhắn (văn bản/file)

**Quy trình xử lý**:

1.  Gửi tin nhắn:
    -   Sử dụng Websocket qua ChatDAO.
2.  Upload file:
    -   Xử lý qua UploadFileChatServlet.

**Output**:

-   Tin nhắn hiển thị real-time trên giao diện chat.

----------

## Use-case 10: Manage Services

**Mô tả**: Admin quản lý các gói dịch vụ đăng tin.

**Input**:

-   Tên dịch vụ
-   Thời hạn (duration)
-   Giá

**Quy trình xử lý**:

1.  Thêm dịch vụ:
    -   Lưu vào ServiceDAO.
2.  Cập nhật thời hạn:
    -   Sử dụng DurationAdminServlet.

**Output**:

-   Danh sách dịch vụ được cập nhật.

----------

# 5. How to Install the Project

-   **Tải mã nguồn**:
    -   git clone <git@github.com:detne/Assignment-JAVA-WEB.git>
-   **Thiết lập cơ sở dữ liệu**:
    -   Tạo database: CREATE DATABASE apartment_management;
    -   Chạy script SQL để tạo bảng và dữ liệu mẫu.
-   **Thiết lập Backend**:
    -   Mở dự án trong IDE (IntelliJ/Eclipse).
    -   Cấu hình Maven và Tomcat, cập nhật kết nối MySQL trong ConnectDB.
-   **Thiết lập Frontend**:
    -   JSP nằm trong /WEB-INF/views/, không cần cài đặt riêng.
-   **Chạy ứng dụng**:
    -   Triển khai trên Tomcat, truy cập qua http://localhost:8080.
