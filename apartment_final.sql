-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 24, 2025 lúc 07:29 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ap`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `created` date NOT NULL,
  `verify` tinyint(1) NOT NULL,
  `securitycode` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `role` int(11) NOT NULL,
  `gmailid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `email`, `created`, `verify`, `securitycode`, `status`, `role`, `gmailid`) VALUES
(1, 'nguoidung1', '$2a$10$EGz5UXiizIxOG0fvJz2mM.0u4rcfA6KVBZx897NkzfNrRB/p/fRLa', 'nguoidung1@gmail.com', '2023-11-20', 1, '123456', 1, 1, NULL),
(2, 'acc1', '$2a$10$EGz5UXiizIxOG0fvJz2mM.0u4rcfA6KVBZx897NkzfNrRB/p/fRLa', 'acc1@gmail.com', '2023-11-20', 1, '123456', 1, 1, NULL),
(29, 'admin', '$2a$10$EGz5UXiizIxOG0fvJz2mM.0u4rcfA6KVBZx897NkzfNrRB/p/fRLa', 'admin@gmail.com', '2024-01-08', 1, '123456', 1, 0, NULL),
(38, 'superadmin', '$2a$10$EGz5UXiizIxOG0fvJz2mM.0u4rcfA6KVBZx897NkzfNrRB/p/fRLa', 'superadmin@gmail.com', '2024-06-17', 1, '123456', 1, 2, NULL),
(68, 'xuagiahuy', '$2a$10$u0TPD2Lyo7F2X5Bvq7X5teHxin2AcRaysLJQ5OmxzbNXRqDnSnkri', 'huydao@gmail.com', '2025-03-22', 1, '910871', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accountdetails`
--

CREATE TABLE `accountdetails` (
  `id` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(250) NOT NULL,
  `phonenumber` varchar(250) NOT NULL,
  `avatar` varchar(250) NOT NULL,
  `updatedate` date NOT NULL,
  `balance` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `accountdetails`
--

INSERT INTO `accountdetails` (`id`, `accountid`, `name`, `birthday`, `address`, `phonenumber`, `avatar`, `updatedate`, `balance`) VALUES
(30, 68, 'gia huy', '2003-04-03', 'việt nam', '0355105133', '7d0ca41e8053413ea4facc485a9a3eb3.png', '2025-03-24', 1000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accountgmail`
--

CREATE TABLE `accountgmail` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account_service`
--

CREATE TABLE `account_service` (
  `id` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `serviceID` int(11) NOT NULL,
  `durationID` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `created` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `endService` timestamp NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL,
  `saleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account_service`
--

INSERT INTO `account_service` (`id`, `accountID`, `serviceID`, `durationID`, `description`, `created`, `endService`, `status`, `saleID`) VALUES
(50, 68, 2, 12, 'Đăng kí gói: Bạc / 1 tháng', '2025-03-24 07:33:57', '2025-04-24 07:33:57', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `adminID` int(11) NOT NULL,
  `message` text NOT NULL,
  `role` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chat`
--

INSERT INTO `chat` (`id`, `userID`, `adminID`, `message`, `role`, `time`) VALUES
(359, 68, 29, 'aaaa', 1, '2025-03-24 12:57:46'),
(360, 68, 29, 'aaaa', 1, '2025-03-24 12:57:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `name` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `created` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contract`
--

CREATE TABLE `contract` (
  `id` int(11) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `systemapartmentid` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created` date NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `duration`
--

CREATE TABLE `duration` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `duration`
--

INSERT INTO `duration` (`id`, `status`, `name`) VALUES
(12, 1, '1 tháng'),
(13, 1, '6 tháng'),
(14, 1, '12 tháng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `duration_language`
--

CREATE TABLE `duration_language` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `durationID` int(11) NOT NULL,
  `languageID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `duration_language`
--

INSERT INTO `duration_language` (`id`, `name`, `durationID`, `languageID`) VALUES
(1, '1 tháng', 12, 1),
(2, '1 month', 12, 2),
(3, '6 tháng', 13, 1),
(4, '6 months', 13, 2),
(5, '12 tháng', 14, 1),
(6, '12 months', 14, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `serviceID` int(11) NOT NULL,
  `durationID` int(11) NOT NULL,
  `description` varchar(250) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `key`
--

CREATE TABLE `key` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `publicKey` text NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `endTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `key`
--

INSERT INTO `key` (`id`, `userID`, `publicKey`, `startTime`, `endTime`) VALUES
(6, 1, 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzRsZNMe1G2lU4wPS+KxviMqZnQ1XrUkftSL5bOcYzzh19MfZflOd9ffGD3XVzyPW3e2Vx1KzFVm1yHp8ax7XHtpuTDAW1LDIQXeUaNWzfdWvLALDUiv1DNrOkTriCBMGPUeRKiTdfTHSY0tZ+xHVOKeM3hI//sLtA4UTBD4d3FX0ALA6cB5L7q2CeTM4QoGMwKP3Hw03rKZq60lhdYCcE7c0NyVWil76rtJcnuZE7TRLuvoTwxLFFvJkZFwfQHuJtnAazfadNz8ENMmyervHqxgq9UIjQpNDWbBcdz87I3/j8ckVg61WcwDjfgcPiKBifkRcK0oDHtH+Xs6pq0SZJwIDAQAB', '2024-12-10 11:25:42', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `languageid` varchar(250) NOT NULL,
  `countryid` varchar(250) NOT NULL,
  `countryname` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `language`
--

INSERT INTO `language` (`id`, `languageid`, `countryid`, `countryname`) VALUES
(1, 'vi', 'VN', 'Việt Nam'),
(2, 'en', 'US', 'USA');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `ip` varchar(250) NOT NULL,
  `level` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `national` varchar(250) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `beforevalue` text DEFAULT NULL,
  `aftervalue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `log`
--

INSERT INTO `log` (`id`, `ip`, `level`, `description`, `national`, `time`, `beforevalue`, `aftervalue`) VALUES
(575, '14.186.250.177', 'info', 'AccountID: 2 Đăng nhập', 'Viet Nam', '2025-03-10 15:15:07', NULL, NULL),
(576, '14.186.250.177', 'info', 'AccountID: 65 Đăng nhập', 'Viet Nam', '2025-03-10 15:26:23', NULL, NULL),
(577, '14.186.250.177', 'info', 'AccountID: 2 Đăng nhập', 'Viet Nam', '2025-03-10 15:28:36', NULL, NULL),
(578, '14.186.250.177', 'info', 'AccountID: 2 Đăng nhập', 'Viet Nam', '2025-03-10 15:31:14', NULL, NULL),
(579, '14.186.250.177', 'info', 'AccountID: 65 Đăng nhập', 'Viet Nam', '2025-03-10 15:31:49', NULL, NULL),
(580, '14.186.250.177', 'info', 'AccountID: 65 Đăng nhập', 'Viet Nam', '2025-03-10 15:33:45', NULL, NULL),
(581, '14.186.250.177', 'info', 'AccountID: 29 Đăng nhập', 'Viet Nam', '2025-03-10 15:35:47', NULL, NULL),
(582, '14.186.250.177', 'danger', 'Đăng nhập admin khi chưa có quyền', 'Viet Nam', '2025-03-10 15:35:55', NULL, NULL),
(583, '14.186.250.177', 'danger', 'Đăng nhập admin khi chưa có quyền', 'Viet Nam', '2025-03-10 15:35:58', NULL, NULL),
(584, '14.186.250.177', 'info', 'AccountID: 2 Đăng nhập', 'Viet Nam', '2025-03-10 15:36:04', NULL, NULL),
(585, '14.186.250.177', 'danger', 'Đăng nhập admin khi chưa có quyền', 'Viet Nam', '2025-03-10 15:36:09', NULL, NULL),
(586, '14.186.250.177', 'info', 'AccountID: 38 Đăng nhập', 'Viet Nam', '2025-03-10 15:36:26', NULL, NULL),
(587, '14.186.250.177', 'info', 'AccountID: 29 Đăng nhập', 'Viet Nam', '2025-03-10 15:36:55', NULL, NULL),
(588, '14.186.250.177', 'info', 'AccountID: 2 Đăng nhập', 'Viet Nam', '2025-03-10 15:38:03', NULL, NULL),
(589, '14.186.250.177', 'info', 'AccountID: 66 - Đăng nhập bằng Gmail', 'Viet Nam', '2025-03-10 15:38:13', NULL, NULL),
(590, '14.186.250.177', 'info', ' Đăng nhập thất bại', 'Viet Nam', '2025-03-10 15:50:32', NULL, NULL),
(591, '14.186.250.177', 'info', 'AccountID: 29 Đăng nhập', 'Viet Nam', '2025-03-10 15:50:35', NULL, NULL),
(592, '14.186.250.177', 'info', 'AccountID: 38 Đăng nhập', 'Viet Nam', '2025-03-10 15:50:47', NULL, NULL),
(593, '14.186.250.177', 'info', 'AccountID: 66 - Đăng nhập bằng Gmail', 'Viet Nam', '2025-03-10 15:52:49', NULL, NULL),
(594, '14.186.250.177', 'alert', 'AccountID: 66 nạp tiền vào tài khoản bằng VNPay', 'Viet Nam', '2025-03-10 15:54:26', 'Số tiền trước khi nạp: 0.0', 'Số tiền sau khi nạp: 500000.0'),
(595, '14.186.250.177', 'alert', 'AccountID: 66 - đã mua gói dịch vụ', 'Viet Nam', '2025-03-10 15:55:03', NULL, 'Gói dịch vụ đã mua là: Đồng / 1 tháng'),
(596, '14.186.250.177', 'alert', 'AccountID: 66 - đã đăng bài bán căn hộ.', 'Viet Nam', '2025-03-10 15:56:00', NULL, NULL),
(597, '14.186.250.177', 'danger', 'Đăng nhập admin khi chưa có quyền', 'Viet Nam', '2025-03-10 15:56:24', NULL, NULL),
(598, '14.186.250.177', 'info', 'AccountID: 38 Đăng nhập', 'Viet Nam', '2025-03-10 15:56:27', NULL, NULL),
(599, '14.186.250.177', 'info', 'AccountID: 38 Đăng nhập', 'Viet Nam', '2025-03-10 15:56:45', NULL, NULL),
(600, '14.186.250.177', 'info', 'AccountID: 29 Đăng nhập', 'Viet Nam', '2025-03-10 15:57:03', NULL, NULL),
(601, '14.186.250.177', 'info', 'AccountID: 66 - Đăng nhập bằng Gmail', 'Viet Nam', '2025-03-10 16:00:42', NULL, NULL),
(602, '14.186.250.177', 'info', 'AccountID: 66 - Đăng nhập bằng Gmail', 'Viet Nam', '2025-03-10 16:01:41', NULL, NULL),
(603, '14.186.250.177', 'alert', 'AccountID: 66 - đã mua gói dịch vụ', 'Viet Nam', '2025-03-10 16:02:43', NULL, 'Gói dịch vụ đã mua là: Đồng / 1 tháng'),
(604, '14.186.250.177', 'alert', 'AccountID: 66 - đã đăng bài bán căn hộ.', 'Viet Nam', '2025-03-10 16:03:01', NULL, NULL),
(605, '14.186.250.177', 'info', 'AccountID: 38 Đăng nhập', 'Viet Nam', '2025-03-10 16:04:55', NULL, NULL),
(606, '14.186.250.177', 'info', 'AccountID: 2 Đăng nhập', 'Viet Nam', '2025-03-10 16:05:13', NULL, NULL),
(607, '14.186.250.177', 'info', 'AccountID: 66 - Đăng nhập bằng Gmail', 'Viet Nam', '2025-03-10 16:06:50', NULL, NULL),
(608, '14.186.250.177', 'info', 'AccountID: 29 Đăng nhập', 'Viet Nam', '2025-03-10 16:18:03', NULL, NULL),
(609, '14.186.250.177', 'info', 'AccountID: 29 Đăng nhập', 'Viet Nam', '2025-03-10 16:18:19', NULL, NULL),
(610, '14.186.250.177', 'danger', 'Đăng nhập admin khi chưa có quyền', 'Viet Nam', '2025-03-10 16:18:33', NULL, NULL),
(611, '14.186.250.177', 'info', 'AccountID: 29 Đăng nhập', 'Viet Nam', '2025-03-10 16:18:38', NULL, NULL),
(612, '14.186.250.177', 'info', 'AccountID: 38 Đăng nhập', 'Viet Nam', '2025-03-10 16:18:59', NULL, NULL),
(613, '14.186.250.177', 'info', 'AccountID: 29 Đăng nhập', 'Viet Nam', '2025-03-10 16:20:03', NULL, NULL),
(614, '14.186.250.177', 'info', 'AccountID: 38 Đăng nhập', 'Viet Nam', '2025-03-10 16:20:34', NULL, NULL),
(615, '14.186.250.177', 'alert', 'letu36592@gmail.com - liên hệ', 'Viet Nam', '2025-03-10 16:20:54', NULL, NULL),
(616, '14.186.250.177', 'alert', 'AccountID: 66 - đã để lại 1 ý kiến', 'Viet Nam', '2025-03-10 16:21:35', NULL, NULL),
(617, '14.186.250.177', 'warning', 'AdminId: 38 đã xóa bài đăng có id là: 41 ra khỏi hệ thống', 'Viet Nam', '2025-03-10 16:22:09', 'Số bài đăng trước khi xóa: 1', 'Số bài đăng sau khi xóa: 0'),
(618, '14.186.250.177', 'alert', 'AccountID: 66 - đã đăng bài bán căn hộ.', 'Viet Nam', '2025-03-10 16:23:08', NULL, NULL),
(619, '14.186.250.177', 'alert', 'AccountID: 66 - đã thêm bài đăng có id là 42 vào whislist', 'Viet Nam', '2025-03-10 16:23:39', NULL, NULL),
(620, '14.186.250.177', 'alert', 'AccountID: 66 - đã xóa bài đăng có id là 0 ra khỏi whislist', 'Viet Nam', '2025-03-10 16:23:55', NULL, NULL),
(621, '14.186.250.177', 'alert', 'AccountID: 67 nạp tiền vào tài khoản bằng VNPay', 'Viet Nam', '2025-03-10 16:28:53', 'Số tiền trước khi nạp: 0.0', 'Số tiền sau khi nạp: 600000.0'),
(622, '14.186.250.177', 'alert', 'AccountID: 67 - đã mua gói dịch vụ', 'Viet Nam', '2025-03-10 16:29:52', NULL, 'Gói dịch vụ đã mua là: Đồng / 1 tháng'),
(623, '14.186.250.177', 'alert', 'AccountID: 67 - đã đăng bài bán căn hộ.', 'Viet Nam', '2025-03-10 16:30:24', NULL, NULL),
(624, '14.186.250.177', 'alert', 'AccountID: 67 - đã thêm bài đăng có id là 43 vào whislist', 'Viet Nam', '2025-03-10 16:30:32', NULL, NULL),
(625, '14.186.250.177', 'alert', 'AccountID: 67 - đã xóa bài đăng có id là 0 ra khỏi whislist', 'Viet Nam', '2025-03-10 16:30:36', NULL, NULL),
(626, '14.186.250.177', 'info', 'AccountID: 38 Đăng nhập', 'Viet Nam', '2025-03-10 16:30:52', NULL, NULL),
(627, '14.186.250.177', 'danger', 'Đăng nhập admin khi chưa có quyền', 'Viet Nam', '2025-03-10 16:32:22', NULL, NULL),
(628, '14.186.250.177', 'info', 'AccountID: 2 Đăng nhập', 'Viet Nam', '2025-03-10 16:32:25', NULL, NULL),
(629, '171.225.184.66', 'info', 'AccountID: 68 Đăng nhập', 'Viet Nam', '2025-03-22 14:31:12', NULL, NULL),
(630, '118.69.34.155', 'info', 'AccountID: 68 Đăng nhập', 'Viet Nam', '2025-03-24 07:28:54', NULL, NULL),
(631, '118.69.34.155', 'alert', 'AccountID: 68 nạp tiền vào tài khoản bằng VNPay', 'Viet Nam', '2025-03-24 07:30:33', 'Số tiền trước khi nạp: 0.0', 'Số tiền sau khi nạp: 500000.0'),
(632, '118.69.34.155', 'alert', 'AccountID: 68 nạp tiền vào tài khoản bằng VNPay', 'Viet Nam', '2025-03-24 07:31:31', 'Số tiền trước khi nạp: 500000.0', 'Số tiền sau khi nạp: 1000000.0'),
(633, '42.115.115.250', 'info', ' Đăng nhập thất bại', 'Viet Nam', '2025-03-24 07:32:03', NULL, NULL),
(634, '42.115.115.250', 'info', 'AccountID: 68 Đăng nhập', 'Viet Nam', '2025-03-24 07:32:13', NULL, NULL),
(635, '42.115.115.250', 'alert', 'AccountID: 68 nạp tiền vào tài khoản bằng VNPay', 'Viet Nam', '2025-03-24 07:33:44', 'Số tiền trước khi nạp: 1000000.0', 'Số tiền sau khi nạp: 1500000.0'),
(636, '42.115.115.250', 'alert', 'AccountID: 68 - đã mua gói dịch vụ', 'Viet Nam', '2025-03-24 07:33:57', NULL, 'Gói dịch vụ đã mua là: Bạc / 1 tháng'),
(637, '42.115.115.250', 'info', 'AccountID: 29 Đăng nhập', 'Viet Nam', '2025-03-24 07:47:12', NULL, NULL),
(638, '117.3.0.140', 'info', 'AccountID: 68 Đăng nhập', 'Viet Nam', '2025-03-24 12:44:24', NULL, NULL),
(639, '117.3.0.140', 'info', 'AccountID: 29 Đăng nhập', 'Viet Nam', '2025-03-24 12:45:48', NULL, NULL),
(640, '117.3.0.140', 'info', 'AccountID: 38 Đăng nhập', 'Viet Nam', '2025-03-24 12:46:25', NULL, NULL),
(641, '117.3.0.140', 'alert', 'AccountID: 68 - đã đăng bài bán căn hộ.', 'Viet Nam', '2025-03-24 12:52:46', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `owner`
--

CREATE TABLE `owner` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `birthday` date NOT NULL,
  `phone` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `identifynumber` varchar(250) NOT NULL,
  `created` date NOT NULL,
  `avatar` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `owner`
--

INSERT INTO `owner` (`id`, `name`, `birthday`, `phone`, `address`, `identifynumber`, `created`, `avatar`) VALUES
(7, 'Gia Huy', '2024-01-21', '0846066219', 'Hội An', '254654987748', '2024-01-21', '038ffb3662de44cb9a83c7146f1c0dd4.jpg'),
(8, 'Thanh Huy', '2024-01-15', '0705317777', 'Điện Bàn', '4587488878787', '2024-01-21', 'b50f45612c3e41ca80f76cdfc96f21de.jpg'),
(9, 'Ngọc Quyên', '2024-01-21', '0935508198', 'Campuchia', '8789798450', '2024-01-21', '16add4e3ae3143e3b968ccd1e666d6af.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `accountid` int(11) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `postdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bedroom` int(11) NOT NULL,
  `bathroom` int(11) NOT NULL,
  `price` double NOT NULL,
  `deposit` double NOT NULL,
  `area` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `address` varchar(250) NOT NULL,
  `avatar` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `post`
--

INSERT INTO `post` (`id`, `accountid`, `subject`, `postdate`, `bedroom`, `bathroom`, `price`, `deposit`, `area`, `description`, `address`, `avatar`, `status`) VALUES
(44, 68, '1', '2025-03-23 17:00:00', 1, 1, 129, 1, '1.0', '11', '1', '2b13f00441e14e3290e5e83b5e597a3c.png', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `postimage`
--

CREATE TABLE `postimage` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `created` date NOT NULL,
  `postid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sale`
--

CREATE TABLE `sale` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `saleNumber` double NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sale`
--

INSERT INTO `sale` (`id`, `name`, `saleNumber`, `status`) VALUES
(1, 'aaa', 20000, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `introduction` varchar(500) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(250) NOT NULL,
  `postNumber` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `service`
--

INSERT INTO `service` (`id`, `name`, `introduction`, `price`, `description`, `postNumber`, `status`, `created`) VALUES
(1, 'Đồng', 'Cho người dùng trải nghiệm', 250000, 'Chỉ được phép đăng 1 bài đăng duy nhất', 1, 1, '2024-04-28'),
(2, 'Bạc', 'Đăng tin bán căn hộ với gói Bạc!', 500000, 'Được phép đăng 5 bài.', 5, 1, '2024-04-28'),
(3, 'Vàng', 'Nâng cao hiệu quả quảng cáo với gói Vàng!', 1000000, 'Được phép đăng 10 bài.', 10, 1, '2024-04-28'),
(4, 'Kim cương', 'Đẳng cấp và hiệu quả với gói Kim Cương!', 2000000, 'Được phép đăng 0 giới hạn', -1, 1, '2024-04-28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service_language`
--

CREATE TABLE `service_language` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `introduction` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `languageID` int(11) NOT NULL,
  `serviceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `service_language`
--

INSERT INTO `service_language` (`id`, `name`, `introduction`, `description`, `languageID`, `serviceID`) VALUES
(1, 'Đồng', 'Cho người dùng trải nghiệm', 'Chỉ được phép đăng 1 bài đăng duy nhất', 1, 1),
(2, 'Bronze', 'Give users experience', 'Only 1 post is allowed', 2, 1),
(3, 'Bạc', 'Đăng tin bán căn hộ với gói Bạc!', 'Được phép đăng 5 bài.', 1, 2),
(4, 'Silver', 'Advertise apartment for sale with Silver package!', 'Up to 5 posts are allowed.', 2, 2),
(5, 'Vàng', 'Nâng cao hiệu quả quảng cáo với gói Vàng!', 'Được phép đăng 10 bài.', 1, 3),
(6, 'Gold', 'Improve advertising effectiveness with the Gold package!', 'Up to 10 posts are allowed.', 2, 3),
(7, 'Kim cương', 'Đẳng cấp và hiệu quả với gói Kim Cương!', 'Được phép đăng không giới hạn', 1, 4),
(9, 'Diamond', 'Classy and efficient with the Diamond package!', 'Allowed to post 0 limit', 2, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `price` double NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `accountID` int(11) NOT NULL,
  `orderinfo` varchar(250) NOT NULL,
  `paymenttype` varchar(250) NOT NULL,
  `transactionno` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `transaction`
--

INSERT INTO `transaction` (`id`, `type`, `price`, `date`, `accountID`, `orderinfo`, `paymenttype`, `transactionno`) VALUES
(34, 1, 500000, '2025-03-24 07:30:32', 68, 'Nap vao 500000  tai khoan', 'ATM', '14864617'),
(35, 1, 500000, '2025-03-24 07:31:30', 68, 'Nap vao 500000  tai khoan', 'ATM', '14864617'),
(36, 1, 500000, '2025-03-24 07:33:44', 68, 'Nap vao 500000  tai khoan', 'ATM', '14864634');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `gmail` (`gmailid`);

--
-- Chỉ mục cho bảng `accountdetails`
--
ALTER TABLE `accountdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountid` (`accountid`);

--
-- Chỉ mục cho bảng `accountgmail`
--
ALTER TABLE `accountgmail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `account_service`
--
ALTER TABLE `account_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountID` (`accountID`),
  ADD KEY `durationID` (`durationID`),
  ADD KEY `serviceID` (`serviceID`);

--
-- Chỉ mục cho bảng `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `adminID` (`adminID`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ownerid` (`ownerid`),
  ADD KEY `systemapartmentid` (`systemapartmentid`);

--
-- Chỉ mục cho bảng `duration`
--
ALTER TABLE `duration`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `duration_language`
--
ALTER TABLE `duration_language`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountid` (`accountid`);

--
-- Chỉ mục cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `key`
--
ALTER TABLE `key`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userID` (`userID`);

--
-- Chỉ mục cho bảng `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountid` (`accountid`);

--
-- Chỉ mục cho bảng `postimage`
--
ALTER TABLE `postimage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postid` (`postid`);

--
-- Chỉ mục cho bảng `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `service_language`
--
ALTER TABLE `service_language`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountID` (`accountID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `accountdetails`
--
ALTER TABLE `accountdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `accountgmail`
--
ALTER TABLE `accountgmail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `account_service`
--
ALTER TABLE `account_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `contract`
--
ALTER TABLE `contract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `duration`
--
ALTER TABLE `duration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `duration_language`
--
ALTER TABLE `duration_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `key`
--
ALTER TABLE `key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=642;

--
-- AUTO_INCREMENT cho bảng `owner`
--
ALTER TABLE `owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `postimage`
--
ALTER TABLE `postimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `service_language`
--
ALTER TABLE `service_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `gmail` FOREIGN KEY (`gmailid`) REFERENCES `accountgmail` (`id`);

--
-- Các ràng buộc cho bảng `accountdetails`
--
ALTER TABLE `accountdetails`
  ADD CONSTRAINT `accountdetails_ibfk_1` FOREIGN KEY (`accountid`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `account_service`
--
ALTER TABLE `account_service`
  ADD CONSTRAINT `account_service_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `account_service_ibfk_2` FOREIGN KEY (`durationID`) REFERENCES `duration` (`id`),
  ADD CONSTRAINT `account_service_ibfk_3` FOREIGN KEY (`serviceID`) REFERENCES `service` (`id`);

--
-- Các ràng buộc cho bảng `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`adminID`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`accountid`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `key`
--
ALTER TABLE `key`
  ADD CONSTRAINT `key_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`accountid`) REFERENCES `account` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
