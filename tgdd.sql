-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 26, 2020 lúc 07:36 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tgdd`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accounts_member`
--

CREATE TABLE `accounts_member` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `staff` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `gender` varchar(6) COLLATE utf8_unicode_ci,
  `fullname` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `accounts_member`
--

INSERT INTO `accounts_member` (`id`, `password`, `last_login`, `email`, `active`, `staff`, `admin`, `avatar`, `created_at`, `updated_at`, `gender`, `fullname`) VALUES
(1, 'pbkdf2_sha256$150000$ManAC12cks6F$LBOc5lHeSBQ6W/LGH4J2IP2NWre4rtUIyCxXo96RWCw=', '2020-03-25 17:47:42.223024', 'admin@gmail.com', 1, 1, 1, '', '2019-09-23 12:10:49.324718', '2019-09-23 12:10:50.281060', 'male', '1'),
(4, 'pbkdf2_sha256$150000$TIiGazXsm13N$sKl7FxvI/QezAMrTyuHhXIVuxSXmPPJXoFZvhmocNCo=', NULL, 'tien@gmail.com', 1, 0, 0, 'https://image.plo.vn/w653/Uploaded/2019/ohpoplb/2019_09_04/nu-du-khac-duoc-tra-lai-tai-san_mssk.jpg', '2019-09-27 10:07:31.680449', '2019-10-27 19:48:59.618147', 'female', '1'),
(5, 'pbkdf2_sha256$150000$DpLeYa32p6SL$/Js3zhNFvQR5LZId8tuaHl+Qjk88sJ1qlkrWkK9wTTE=', NULL, 'trieu@gmail.com', 1, 0, 0, '', '2019-09-27 10:37:41.390384', '2019-09-27 10:37:41.390384', 'male', '1'),
(6, 'pbkdf2_sha256$150000$uOXbKL2x7MO6$eiZjHbjl5op8CBsW8uEjWXqTJmecHaAMApoDK5XvupQ=', NULL, 'sang@gmail.com', 1, 0, 0, 'https://cdn.futura-sciences.com/buildsv6/images/mediumoriginal/e/c/9/ec9c4627da_105701_12-1202.jpg', '2019-09-27 10:44:32.494200', '2019-11-13 09:35:21.428169', 'male', 'Phan Phước Sang'),
(7, 'pbkdf2_sha256$150000$fan7qxUS2CuQ$bBmds19FjowaRJLGPp40/WZ5/tUij+GmqEhQjD3oQ38=', NULL, 'ngan@gmail.com', 0, 0, 0, 'https://znews-photo.zadn.vn/w1024/Uploaded/bpivpjbp/2018_07_09/29513250_595830057426746_6138543117098794662_n.jpg', '2019-09-27 11:04:52.895661', '2019-09-27 12:01:39.407478', 'male', '1'),
(8, 'pbkdf2_sha256$150000$wfgUft80Etrh$to78JsqBvlAUOFrhT9nPlps8epYzBGuoJwIBeUgG59E=', NULL, 'phuc@gmail.com', 1, 0, 0, '', '2019-09-27 11:06:22.696783', '2019-09-27 11:06:23.913578', 'male', '1'),
(9, '!EIpAvLIzs44rpPlfmgoEQYatofLD93BCB9MmFCNM', NULL, 'loc@gmail.com', 0, 0, 0, 'https://www.dhresource.com/0x0s/f2-albu-g8-M01-03-15-rBVaV10mDd-AEUOHAAIUaUSeR7U492.jpg/sexy-women-t-shirt-babe-you-got-this-hot.jpg', '2019-09-27 11:11:01.181638', '2019-11-19 11:17:26.730928', 'male', '1'),
(10, 'pbkdf2_sha256$150000$2N0OeG89u58X$zqqUupXMu93DCtk1Gft2mp9JXBJ/d+sI5nDBAuZqZ/U=', NULL, 'quyen@gmail.com', 1, 0, 0, '', '2019-09-27 11:11:58.471837', '2019-09-27 11:11:59.521234', 'male', '1'),
(11, 'pbkdf2_sha256$150000$e4hibq3KHuT6$Q4bY8xxxRIiUbYQ2oBZtb1LpDVUUkVJpHaS2JiTM+XI=', NULL, 'nghia@gmail.com', 1, 0, 0, 'https://www.dhresource.com/0x0s/f2-albu-g8-M01-03-15-rBVaV10mDd-AEUOHAAIUaUSeR7U492.jpg/sexy-women-t-shirt-babe-you-got-this-hot.jpg', '2019-09-27 11:15:20.227739', '2019-09-27 16:10:14.582259', 'male', '1'),
(12, '!0vVcMiWZf9I0IHXDtbYWBNXXymIgUQPGWwcL66ax', NULL, 'vang@gmail.com', 0, 0, 0, '', '2019-10-05 14:28:58.468502', '2019-11-13 12:49:33.569025', 'male', '1'),
(13, '!bQz4uhv4xx5CHQKbyQ7gsGzaiqaEzQQWUNtr0UqH', NULL, 'vu@gmail.com', 0, 0, 0, '', '2019-10-18 09:31:21.139757', '2019-11-13 12:49:25.272587', 'male', '1'),
(14, '!fMJVncPPT6UTJUUEdRb2RVEUBFqHxj6fxaJbWpzH', NULL, 'user@gmail.com', 1, 0, 0, '', '2019-10-18 09:57:55.303482', '2019-11-19 11:15:42.313137', 'male', '1'),
(15, '!fumzWzNjHmScjxFpXttbYislaBtDckyKsXSXgtSH', NULL, 'trang@gmail.com', 0, 0, 0, '', '2019-10-27 20:06:20.412348', '2019-11-13 12:49:19.521300', 'female', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address_address`
--

CREATE TABLE `address_address` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `address_address`
--

INSERT INTO `address_address` (`id`, `fullname`, `address`, `phone`, `member_id`) VALUES
(1, 'Phan Phước Sang', '123/45 Mỹ Khánh, Phong Điền, TP Cần Thơ', '07103733333', 6),
(2, 'Nguyễn Minh Thiên Triệu', 'Long Huê, Long Thới, Chợ Lách, Bến Tre', '0964271221', 5),
(3, 'Hà Diễm Trang', 'Đại học y dược Cần Thơ', '0987654321', 5),
(4, 'ファン　ふこ　サン', '日本', '01234567890', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add member', 6, 'add_member'),
(22, 'Can change member', 6, 'change_member'),
(23, 'Can delete member', 6, 'delete_member'),
(24, 'Can view member', 6, 'view_member'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add product', 8, 'add_product'),
(30, 'Can change product', 8, 'change_product'),
(31, 'Can delete product', 8, 'delete_product'),
(32, 'Can view product', 8, 'view_product'),
(33, 'Can add brand', 9, 'add_brand'),
(34, 'Can change brand', 9, 'change_brand'),
(35, 'Can delete brand', 9, 'delete_brand'),
(36, 'Can view brand', 9, 'view_brand'),
(37, 'Can add Token', 10, 'add_token'),
(38, 'Can change Token', 10, 'change_token'),
(39, 'Can delete Token', 10, 'delete_token'),
(40, 'Can view Token', 10, 'view_token'),
(41, 'Can add promotion', 11, 'add_promotion'),
(42, 'Can change promotion', 11, 'change_promotion'),
(43, 'Can delete promotion', 11, 'delete_promotion'),
(44, 'Can view promotion', 11, 'view_promotion'),
(45, 'Can add cart', 12, 'add_cart'),
(46, 'Can change cart', 12, 'change_cart'),
(47, 'Can delete cart', 12, 'delete_cart'),
(48, 'Can view cart', 12, 'view_cart'),
(49, 'Can add cart item', 13, 'add_cartitem'),
(50, 'Can change cart item', 13, 'change_cartitem'),
(51, 'Can delete cart item', 13, 'delete_cartitem'),
(52, 'Can view cart item', 13, 'view_cartitem'),
(53, 'Can add address', 14, 'add_address'),
(54, 'Can change address', 14, 'change_address'),
(55, 'Can delete address', 14, 'delete_address'),
(56, 'Can view address', 14, 'view_address'),
(57, 'Can add order', 15, 'add_order'),
(58, 'Can change order', 15, 'change_order'),
(59, 'Can delete order', 15, 'delete_order'),
(60, 'Can view order', 15, 'view_order');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands_brand`
--

CREATE TABLE `brands_brand` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `logo` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands_brand`
--

INSERT INTO `brands_brand` (`id`, `name`, `country`, `is_active`, `created_at`, `updated_at`, `logo`) VALUES
(1, 'Apple', 'Hoa Kỳ', 1, '2019-09-24 09:28:13.732999', '2019-10-23 12:36:25.018058', 'https://res.cloudinary.com/dyjkyzllt/image/upload/v1571834182/qr3nrvhr1dr7a1rknrwu.png'),
(2, 'Samsung', 'Hàn Quốc', 1, '2019-09-24 09:29:50.081599', '2019-10-23 12:35:28.865013', 'https://res.cloudinary.com/dyjkyzllt/image/upload/v1571834125/z4mfo7ofszigxy2ujnqa.png'),
(3, 'Oppo', 'Trung Quốc', 1, '2019-09-24 09:31:20.613572', '2019-10-23 12:32:58.539855', 'https://res.cloudinary.com/dyjkyzllt/image/upload/v1571833975/tlcxrstwewevgdkc6s3e.png'),
(4, 'Realme', 'Trung Quốc', 1, '2019-09-24 09:31:40.935227', '2019-10-23 12:32:16.741157', 'https://res.cloudinary.com/dyjkyzllt/image/upload/v1571833933/vvrvwfp0mecqdeyduqvs.png'),
(5, 'Xiaomi', 'Trung Quốc', 1, '2019-09-26 07:26:07.121672', '2019-10-23 12:31:16.463979', 'https://res.cloudinary.com/dyjkyzllt/image/upload/v1571833872/xlwn2byyz1x29lkiuale.png'),
(6, 'MSI', '', 1, '2019-09-28 13:38:48.438208', '2019-10-23 12:26:44.577819', 'https://res.cloudinary.com/dyjkyzllt/image/upload/v1571833599/caehq3z8yovdlgfu1sri.png'),
(7, 'Lenovo', '', 0, '2019-10-23 11:58:03.296148', '2019-10-26 19:58:17.535371', 'https://res.cloudinary.com/dyjkyzllt/image/upload/v1571831871/zl0mxcf3whugjfd8uoww.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_cart`
--

CREATE TABLE `cart_cart` (
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_cart`
--

INSERT INTO `cart_cart` (`customer_id`) VALUES
(5),
(6),
(7),
(15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_cartitem`
--

CREATE TABLE `cart_cartitem` (
  `id` int(11) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `final_price` double DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `in_cart` tinyint(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_cartitem`
--

INSERT INTO `cart_cartitem` (`id`, `quantity`, `product_id`, `cart_id`, `final_price`, `paid`, `order_id`, `in_cart`) VALUES
(1, 2, 1, 5, 0, 1, NULL, 0),
(2, 2, 2, 5, 0, 1, NULL, 0),
(3, 1, 3, 6, 0, 1, NULL, 0),
(5, 7, 7, 7, 0, 0, NULL, 0),
(6, 2, 8, 5, 19071000, 1, NULL, 0),
(7, 1, 6, 5, 0, 1, NULL, 0),
(8, 2, 8, 6, 38142000, 1, NULL, 0),
(10, 2, 8, 5, 38142000, 1, NULL, 0),
(11, 3, 8, 5, 57213000, 1, NULL, 0),
(12, 2, 6, 5, 0, 0, 9, 0),
(13, 1, 2, 6, 6490000, 0, NULL, 0),
(14, 2, 8, 6, 38142000, 0, NULL, 0),
(15, 1, 3, 6, 26990000, 0, NULL, 0),
(16, 2, 3, 15, 51281000, 0, NULL, 0),
(17, 3, 4, 6, 99721500, 0, 10, 0),
(18, 1, 5, 5, 18990500, 1, 11, 0),
(19, 1, 8, 6, 21190000, 1, 13, 0),
(20, 1, 8, 5, 21190000, 0, 12, 0),
(21, 1, 7, 5, 17990000, 1, 14, 0),
(22, 1, 5, 6, 18990500, 0, NULL, 1),
(23, 1, 5, 5, 19990000, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories_category`
--

CREATE TABLE `categories_category` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories_category`
--

INSERT INTO `categories_category` (`id`, `title`, `is_active`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Điện thoại', 1, '2019-09-23 12:21:09.588049', '2019-10-23 11:27:29.268069', 'https://res.cloudinary.com/dyjkyzllt/image/upload/v1571824048/jfapk2nsw39h7bgqzsce.png'),
(2, 'Laptop', 0, '2019-09-26 07:15:55.072270', '2019-09-26 07:22:58.835930', ''),
(3, 'Máy tính bảng', 1, '2019-09-28 13:18:52.470917', '2019-10-23 09:48:02.994195', 'https://res.cloudinary.com/dyjkyzllt/image/upload/v1571824080/zbddzfvtvgqtiudntxq2.png'),
(4, 'Phụ kiện', 1, '2019-09-28 13:24:11.640483', '2019-10-23 09:53:20.694679', 'https://res.cloudinary.com/dyjkyzllt/image/upload/v1571824391/tdhqbi4y224wigxrinup.png'),
(6, 'the new345', 0, '2019-10-22 17:51:43.074190', '2019-10-23 08:22:17.689016', 'https://res.cloudinary.com/dyjkyzllt/image/upload/v1571766685/bttcxwh8o8lq0zi52bwm.jpg'),
(7, 'the new of new', 0, '2019-10-23 10:11:42.421151', '2019-10-23 10:11:42.421151', 'https://res.cloudinary.com/dyjkyzllt/image/upload/v1571825483/thojb7wkg1zunxlxod2p.jpg'),
(8, 'the new of the new', 0, '2019-10-23 10:15:01.686359', '2019-10-23 10:24:36.049372', 'https://res.cloudinary.com/dyjkyzllt/image/upload/v1571825715/aou4oe3agknpknlmpxj7.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-09-27 10:07:31.782491', '4', 'tien@gmail.com', 1, '[{\"added\": {}}]', 6, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'accounts', 'member'),
(14, 'address', 'address'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(10, 'authtoken', 'token'),
(9, 'brands', 'brand'),
(12, 'cart', 'cart'),
(13, 'cart', 'cartitem'),
(7, 'categories', 'category'),
(4, 'contenttypes', 'contenttype'),
(15, 'order', 'order'),
(8, 'products', 'product'),
(11, 'promotion', 'promotion'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'accounts', '0001_initial', '2019-09-23 12:06:17.770660'),
(2, 'accounts', '0002_auto_20190923_1906', '2019-09-23 12:06:18.948567'),
(3, 'contenttypes', '0001_initial', '2019-09-23 12:06:19.329817'),
(4, 'admin', '0001_initial', '2019-09-23 12:06:19.658794'),
(5, 'admin', '0002_logentry_remove_auto_add', '2019-09-23 12:06:21.397151'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2019-09-23 12:06:21.443563'),
(7, 'admin', '0004_auto_20190913_1745', '2019-09-23 12:06:22.070099'),
(8, 'admin', '0005_auto_20190923_1859', '2019-09-23 12:06:22.790288'),
(9, 'contenttypes', '0002_remove_content_type_name', '2019-09-23 12:06:23.440791'),
(10, 'auth', '0001_initial', '2019-09-23 12:06:24.157886'),
(11, 'auth', '0002_alter_permission_name_max_length', '2019-09-23 12:06:27.317522'),
(12, 'auth', '0003_alter_user_email_max_length', '2019-09-23 12:06:27.385893'),
(13, 'auth', '0004_alter_user_username_opts', '2019-09-23 12:06:27.423722'),
(14, 'auth', '0005_alter_user_last_login_null', '2019-09-23 12:06:27.454707'),
(15, 'auth', '0006_require_contenttypes_0002', '2019-09-23 12:06:27.643281'),
(16, 'auth', '0007_alter_validators_add_error_messages', '2019-09-23 12:06:27.734439'),
(17, 'auth', '0008_alter_user_username_max_length', '2019-09-23 12:06:27.790580'),
(18, 'auth', '0009_alter_user_last_name_max_length', '2019-09-23 12:06:27.821055'),
(19, 'auth', '0010_alter_group_name_max_length', '2019-09-23 12:06:28.333073'),
(20, 'auth', '0011_update_proxy_permissions', '2019-09-23 12:06:28.376564'),
(21, 'categories', '0001_initial', '2019-09-23 12:06:29.160296'),
(22, 'products', '0001_initial', '2019-09-23 12:06:29.475104'),
(23, 'sessions', '0001_initial', '2019-09-23 12:06:30.941354'),
(24, 'accounts', '0003_auto_20190923_1910', '2019-09-23 12:10:50.543074'),
(25, 'products', '0002_product_images', '2019-09-23 18:10:24.855185'),
(26, 'products', '0003_auto_20190924_0152', '2019-09-23 18:52:41.896219'),
(27, 'products', '0004_auto_20190924_0156', '2019-09-23 18:56:17.533902'),
(28, 'products', '0005_auto_20190924_1546', '2019-09-24 08:47:02.217562'),
(29, 'products', '0006_auto_20190924_1548', '2019-09-24 08:48:45.999254'),
(30, 'products', '0007_delete_product', '2019-09-24 09:00:17.576906'),
(31, 'brands', '0001_initial', '2019-09-24 09:19:25.851521'),
(32, 'products', '0008_product', '2019-09-24 10:08:30.775365'),
(33, 'products', '0009_auto_20190926_1105', '2019-09-26 04:05:48.839124'),
(34, 'accounts', '0004_member_fullname', '2019-09-26 04:14:05.505304'),
(35, 'categories', '0002_category_img', '2019-09-26 10:10:16.778375'),
(36, 'brands', '0002_brand_logo', '2019-09-26 10:11:09.123305'),
(37, 'authtoken', '0001_initial', '2019-09-26 15:48:22.304135'),
(38, 'authtoken', '0002_auto_20160226_1747', '2019-09-26 15:48:23.535887'),
(39, 'products', '0010_remove_product_sku', '2019-09-27 19:12:11.138757'),
(40, 'categories', '0003_auto_20190928_0245', '2019-09-27 19:45:41.626789'),
(41, 'promotion', '0001_initial', '2019-09-27 19:45:41.980401'),
(42, 'products', '0011_auto_20190928_0340', '2019-09-27 20:40:30.709052'),
(43, 'promotion', '0002_auto_20190928_0340', '2019-09-27 20:40:30.744209'),
(44, 'brands', '0003_auto_20190928_2008', '2019-09-28 13:08:20.227179'),
(45, 'categories', '0004_auto_20190928_2008', '2019-09-28 13:08:20.428667'),
(46, 'products', '0012_auto_20190928_2008', '2019-09-28 13:08:21.351718'),
(47, 'promotion', '0003_auto_20190928_2008', '2019-09-28 13:08:21.990724'),
(48, 'categories', '0005_auto_20190928_2023', '2019-09-28 13:23:40.323611'),
(49, 'brands', '0004_auto_20190928_2028', '2019-09-28 13:28:08.444149'),
(50, 'categories', '0006_auto_20190928_2028', '2019-09-28 13:28:08.971899'),
(51, 'products', '0013_auto_20190928_2028', '2019-09-28 13:28:09.411873'),
(52, 'promotion', '0004_auto_20190928_2028', '2019-09-28 13:28:10.025659'),
(53, 'cart', '0001_initial', '2019-09-30 07:01:01.949896'),
(54, 'cart', '0002_cartitem', '2019-09-30 07:17:15.412807'),
(55, 'cart', '0003_cartitem_cart', '2019-09-30 07:19:45.432082'),
(56, 'accounts', '0005_remove_member_postcode', '2019-10-03 09:30:07.862983'),
(57, 'cart', '0004_auto_20191003_1629', '2019-10-03 09:30:08.721125'),
(58, 'cart', '0005_auto_20191003_1715', '2019-10-03 10:15:45.035697'),
(59, 'accounts', '0006_auto_20191005_1808', '2019-10-05 11:11:05.876571'),
(60, 'address', '0001_initial', '2019-10-05 11:11:06.152081'),
(61, 'cart', '0006_auto_20191005_1808', '2019-10-05 11:11:06.770840'),
(62, 'accounts', '0007_auto_20191006_1550', '2019-10-06 08:51:02.762767'),
(63, 'order', '0001_initial', '2019-10-06 08:51:03.866357'),
(64, 'order', '0002_auto_20191006_1553', '2019-10-06 08:53:35.235634'),
(65, 'cart', '0007_cartitem_order', '2019-10-06 10:04:41.702161'),
(66, 'order', '0003_auto_20191013_1527', '2019-10-13 08:27:15.847925'),
(67, 'order', '0004_auto_20191013_1529', '2019-10-13 08:29:45.593069'),
(68, 'accounts', '0008_member_gender', '2019-10-24 10:52:55.790989'),
(69, 'order', '0005_order_bill_address', '2019-10-24 10:52:56.194644'),
(70, 'accounts', '0009_member_fullname', '2019-10-28 08:31:34.703239'),
(71, 'promotion', '0005_auto_20191029_1729', '2019-10-29 10:29:54.679124'),
(72, 'order', '0006_auto_20191030_2144', '2019-10-30 17:03:40.664388'),
(73, 'address', '0002_auto_20191031_1711', '2019-10-31 10:11:35.816238'),
(74, 'order', '0007_auto_20191031_1711', '2019-10-31 10:11:35.852037'),
(75, 'order', '0008_auto_20191107_1344', '2019-11-07 06:45:33.832720'),
(76, 'order', '0009_auto_20191107_1345', '2019-11-07 06:45:35.098858'),
(77, 'promotion', '0006_auto_20191107_1344', '2019-11-07 06:45:36.917124'),
(78, 'order', '0010_auto_20191107_1410', '2019-11-07 07:10:30.149104'),
(79, 'cart', '0008_cartitem_in_cart', '2019-11-12 11:30:21.505430'),
(80, 'cart', '0009_auto_20191112_1904', '2019-11-12 12:04:32.129387');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('beesv1geybehyoz3gs3tmcgoqgu0ywd2', 'Njc4ZWJhMDNkYThhYzRiNzRiOGUxNzkzZjNiZGNhZWVhZTIyNGIxNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzJkOWU0YTdiMTA0NGRkNzlhODMzZjRhNzJhMDM4NDc3MzU0OThlIn0=', '2019-10-11 10:06:59.984191'),
('iy4dwkx0rgwg8np7hbcrmxvywabk1d29', 'Njc4ZWJhMDNkYThhYzRiNzRiOGUxNzkzZjNiZGNhZWVhZTIyNGIxNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzJkOWU0YTdiMTA0NGRkNzlhODMzZjRhNzJhMDM4NDc3MzU0OThlIn0=', '2020-04-08 17:47:42.315555');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_order`
--

CREATE TABLE `order_order` (
  `id` int(11) NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` longtext COLLATE utf8_unicode_ci,
  `ordered_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `bill_address_id` int(11) NOT NULL,
  `shipping_address_id` int(11) NOT NULL,
  `receipt_url` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_order`
--

INSERT INTO `order_order` (`id`, `status`, `total_price`, `description`, `token`, `ordered_at`, `updated_at`, `buyer_id`, `bill_address_id`, `shipping_address_id`, `receipt_url`) VALUES
(3, 'waiting', 10000000, NULL, NULL, '2019-10-31 07:00:39.177458', '2019-10-31 07:00:39.177458', 6, 1, 1, NULL),
(4, 'waiting', 20000000, 'khach hang Tiền Hợi', 'ch_1FZYE1KhjUhmyybqL69Fdark', '2019-10-31 07:37:44.460719', '2019-10-31 07:37:44.460719', 4, 3, 2, NULL),
(5, 'waiting', 19071000, 'Đơn hàng đầu tiên', 'ch_1Fc4wLKhjUhmyybqMMoD794t', '2019-11-07 06:57:58.378526', '2019-11-07 06:57:58.378526', 5, 2, 1, NULL),
(6, 'waiting', 65132000, 'Đơn hàng thứ 2', 'ch_1Fc66OKhjUhmyybq2Vg2CyWB', '2019-11-07 08:12:26.220840', '2019-11-07 08:12:26.220840', 6, 2, 1, 'https://pay.stripe.com/receipts/acct_1FV2AZKhjUhmyybq/ch_1Fc66OKhjUhmyybq2Vg2CyWB/rcpt_G8MqOgCuLvMsXZZUHyWjBwpdXsrRMDL'),
(7, 'waiting', 38142000, 'Đơn hàng thứ 3', 'ch_1FcUKRKhjUhmyybqX6rUbLwW', '2019-11-08 10:04:31.702769', '2019-11-08 10:04:31.702769', 5, 2, 3, 'https://pay.stripe.com/receipts/acct_1FV2AZKhjUhmyybq/ch_1FcUKRKhjUhmyybqX6rUbLwW/rcpt_G8ls3VJb8AwpyMiv6MxTwQFx1ahcKYQ'),
(8, 'waiting', 57213000, 'Đơn hàng thứ 3', '', '2019-11-08 10:17:36.308951', '2019-11-08 10:17:36.308951', 5, 2, 3, NULL),
(9, 'canceled', 28990000, 'Đơn hàng thứ 5', '', '2019-11-08 10:25:51.958429', '2019-11-13 08:48:00.765365', 5, 2, 3, NULL),
(10, 'waiting', 99721500, NULL, '', '2019-11-12 18:15:05.714377', '2019-11-12 18:15:05.714377', 6, 1, 1, NULL),
(11, 'waiting', 18990500, NULL, '', '2019-11-13 08:38:17.925208', '2019-11-13 08:38:17.925208', 5, 2, 2, NULL),
(12, 'canceled', 21190000, '', 'ch_1FeHsGKhjUhmyybqgzaZf6sw', '2019-11-13 09:10:50.836826', '2019-11-13 09:19:11.440484', 5, 3, 3, 'https://pay.stripe.com/receipts/acct_1FV2AZKhjUhmyybq/ch_1FeHsGKhjUhmyybqgzaZf6sw/rcpt_GAd87nzsFvNajpbQWIkJD7VutghuelN'),
(13, 'success', 21190000, '', '', '2019-11-13 09:41:59.647724', '2019-11-13 09:59:35.458743', 6, 3, 3, NULL),
(14, 'shipping', 17990000, 'Xin giao hàng vào giờ hành chính!', 'ch_1FeKdcKhjUhmyybqWULc9wnb', '2019-11-13 12:07:56.098305', '2019-11-13 12:27:31.023538', 5, 2, 3, 'https://pay.stripe.com/receipts/acct_1FV2AZKhjUhmyybq/ch_1FeKdcKhjUhmyybqWULc9wnb/rcpt_GAfzgWW08lNTSayIR1CN5IvmMwsQyHx');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_product`
--

CREATE TABLE `products_product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `images` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `specifications` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products_product`
--

INSERT INTO `products_product` (`id`, `name`, `description`, `images`, `price`, `quantity`, `is_active`, `specifications`, `created_at`, `updated_at`, `brand_id`, `category_id`) VALUES
(1, 'Điện thoại Oppo K3', 'Thiết kế cho trải nghiệm sống động', 'https://cdn.tgdd.vn/2019/08/campaign/trang-min-640x818.png,https://cdn.tgdd.vn/2019/08/campaign/Untitled-2-467x437.png,https://cdn.tgdd.vn/2019/08/campaign/1Y1A2853-copy-800x450-(1).png', 6990000, 47, 1, '{\"M\\u00e0n h\\u00ecnh\":\"AMOLED, 6.5 inches, Full HD+\",\"CPU\":\"Snapdragon 710 8 nh\\u00e2n 64-bit\",\"RAM\":\"6 GB\",\"B\\u1ed9 nh\\u1edb trong\":\"64 GB\",\"Dung l\\u01b0\\u1ee3ng pin\":\"3765 mAh, c\\u00f3 s\\u1ea1c nhanh\"}', '2019-09-24 10:34:23.080908', '2019-11-07 06:57:58.167327', 3, 1),
(2, 'Điện thoại Realme 3 Pro', '', 'https://cdn.tgdd.vn/Products/Images/42/194955/realme-3-pro-blue-400x460.png,https://cdn.tgdd.vn/Products/Images/42/194955/realme-3-pro3.jpg,https://cdn.tgdd.vn/Products/Images/42/194955/realme-3-pro4.jpg', 6490000, 96, 1, '\"\"', '2019-09-25 10:48:50.855803', '2019-11-07 06:57:58.233396', 4, 1),
(3, 'Điện thoại Samsung Galaxy Note 10+', '<h2>rông ngoại hình khá giống nhau, tuy nhiên <a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-note-10-plus\">Samsung Galaxy Note 10+</a> sở hữu khá nhiều điểm khác biệt so với <a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-note-10\">Galaxy Note 10</a> và đây được xem là một trong những chiếc máy đáng mua nhất trong năm 2019, đặc biệt dành cho những người thích một chiếc máy màn hình lớn, camera chất lượng hàng đầu.</h2><h3>Camera đứng đầu thế giới</h3><p>DxOMark là chuyên trang đánh giá camera uy tín thế giới mới đây đã khẳng định, Galaxy Note 10+ là chiếc smartphone có camera tốt nhất hiện nay.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-26.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Giao diện camera sau\"></figure><p>Galaxy Note 10+ có camera chính 12 MP với khẩu độ có thể thay đổi từ F/1.5 – F/2.4, hỗ trợ <a href=\"https://www.thegioididong.com/hoi-dap/che-do-chong-rung-quang-hoc-ois-chup-anh-tren-sm-906416\">chống rung quang học OIS</a> và tự động lấy nét dual-pixel.</p><p>&nbsp;</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-34.jpg\"></figure><p>Ảnh chụp góc siêu rộng 0.5x trên Note 10</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-33.jpg\"></figure><p>Ảnh chụp góc rộng 1x trên Note 10</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-35.jpg\"></figure><p>Ảnh chụp góc thường 2x trên Note 10</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Tiếp theo là cảm biến camera góc siêu rộng 16 MP khẩu độ F/2.2 cùng ống kính tele 12 MP khẩu độ F/2.1 và nó cũng có thêm 1 cảm biến 3D ToF, điều mà Samsung Galaxy Note 10 không được trang bị.</p><p>Samsung đã cải thiện các thuật toán xử lý bên trong phần mềm giúp máy có khả năng phơi sáng tốt, nhất quán và chính xác cho dù trong điều kiện ánh sáng thế nào.</p><p>Galaxy Note 10+ cũng hỗ trợ zoom quang 2x, nó có thể chụp hình ảnh với màu sắc sống động, độ chi tiết cao và độ nhiễu thấp.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-31.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Ảnh chụp ban đêm\"></figure><p>Galaxy Note 10+ cũng có một tính năng mới là Live Focus Video cho phép áp dụng hiệu ứng bokeh vào các video quay được cũng như hình ảnh, cùng các hiệu ứng khác như thay đổi màu phông nền.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-32.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Ảnh chụp ban đêm\"></figure><p>Galaxy Note 10+ vẫn còn những tính năng mới khác như chế độ AR cho phép vẽ lên các video gọi là AR Doodle, tính năng phóng to mic để thu âm thanh rõ hơn ở từng phần cụ thể của cảnh khi đang quay video.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-30.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Ảnh chụp thiếu sáng\"></figure><p>Camera selfie 10 MP ở mặt trước với tính năng làm đẹp được tích hợp sẵn hứa hẹn sẽ không làm người dùng phải thất vọng với chất lượng ảnh mang lại.</p><h3>Công nghệ sạc nhanh&nbsp;Superfast Charge 45W</h3><p>Samsung Galaxy Note 10+ chính là <a href=\"https://www.thegioididong.com/dtdd\">smartphone</a> duy nhất tại thời điểm hiện tại hỗ trợ sạc nhanh lên tới 45W của Samsung.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-23.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Khả năng sạc nhanh trên Type-C\"></figure><p>Công nghệ sạc nhanh Superfast Charge mới này cung cấp nhiều năng lượng hơn so với chuẩn sạc xuất hiện trên các flagship <a href=\"https://www.thegioididong.com/dtdd-samsung\">Samsung</a> trước đây.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-21.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Khả năng sạc nhanh\"></figure><p>Nhanh gấp ba lần Adaptive Fast Charge và nhanh hơn 6 lần so với sạc qua cổng USB tiêu chuẩn.</p><p>Công nghệ sạc siêu nhanh này giúp bạn có thể sạc đầy viên pin có dung lượng 4300 mAh của máy chỉ trong chưa đầy một giờ đồng hồ.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-12.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Khả năng sạc nhanh\"></figure><p>Khi mà dung lượng pin đang tụt lại phía sau so với những cải tiến về camera hay cấu hình thì việc hỗ trợ công nghệ <a href=\"https://www.thegioididong.com/dtdd?f=sac-pin-nhanh\">sạc nhanh</a> đến như vậy cũng sẽ giúp người dùng Samsung phần nào bớt được thời gian chờ đợi nạp năng lượng cho máy.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-10.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Khả năng sạc nhanh\"></figure><p>Bạn cũng cần lưu ý là máy chỉ đi kèm với cục sạc 25W và để sử dụng công nghệ sạc nhanh tối đa này thì bạn phải mua thêm củ sạc 45W bên ngoài nhưng dù sao hỗ trợ sạc nhanh tới 45W đã là điểm cộng quá lớn so với những chiếc máy đầu bảng khác.</p><h3>Màn hình lớn thoải mái sử dụng</h3><p>Samsung Galaxy Note 10+ là một chiếc điện thoại rất lớn, rất có thể là chiếc điện thoại lớn nhất bạn từng sử dụng, với màn hình AMOLED Infinity-O 6.8 inch có độ phân giải 3.040 x 1.440 pixels (498 ppi).</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-7.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Thiết kế màn hình lớn\"></figure><p>Công nghệ màn hình <a href=\"https://www.thegioididong.com/hoi-dap/cong-nghe-ma-hinh-dynamic-amoled-co-gi-noi-bat-1151123\">Dynamic AMOLED</a> tiên tiến này còn cho ra màn hình ít ánh sáng xanh hơn nhằm giúp mắt thoải mái.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-14.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Màn hình phủ lớp HDR10+\"></figure><p>Màn hình hỗ trợ cả nội dung HDR10+ vì thế các chương trình phim ảnh, game và các nội dung khác được hiển thị rất đẹp.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-20.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Màn hình\"></figure><p>Với thiết kế những cạnh tròn ở mặt sau khiến điện thoại rất thoải mái khi cầm, trong trường hợp bạn có bàn tay đủ lớn để cầm và giữ nó.</p><p>Mặt sau của Note 10+ được làm bằng kính, còn khung thì được làm bằng kim loại, mang đến sự tinh tế và sang trọng cho điện thoại.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-24.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Màn hình\"></figure><p>Galaxy Note 10+ có hỗ trợ chuẩn chống nước, chống bụi IP68 vì thế có thể sử dụng ở bãi biển mà không sợ bắn nước hay các xâm nhập vào các cổng kết nối.</p><h3>Bút S Pen ngày càng nhiều tính năng</h3><p>S Pen chính là một trong những yếu tố cốt lõi khiến dòng Galaxy Note trở nên đặc biệt và hấp dẫn.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-29.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ |Trải nghiệm Bút S-Pen\"></figure><p>Bút S Pen có nhiều tính năng hơn bút cảm ứng stylus thông thường, từ ghi chú nhanh bằng cách viết trên màn hình khóa, đến chụp ảnh từ xa với S Pen.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-28.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Khe cắm bút S-Pen\"></figure><p>Giờ đây bút S Pen trên Note 10+ đã được nâng cấp, và hiện tại đã hỗ trợ điều khiển bằng cử chỉ.</p><p>Tính năng này cho phép người dùng điều khiển một số ứng dụng của Samsung như camera,… từ xa mà không cần chạm vào điện thoại.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-17.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Bút S-Pen\"></figure><p>Ví dụ ứng dụng camera trên máy hỗ trợ kết nối với S Pen, cho phép bạn biến bút S Pen thành công cụ giúp bạn điều chỉnh ống kính camera, thay đổi màu sắc, zoom,...giống như đang thao tác bằng tay.</p><h3>Nhiều trang bị cao cấp khác nữa</h3><p>Samsung Galaxy Note 10+ vẫn sở hữu cho mình cảm biến vân tay siêu âm bên dưới màn hình với tốc độ cải tiến rõ rệt.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-27.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Cảm biến vân tay\"></figure><p>Bạn sẽ không phải hi sinh bất cứ bộ phận nào trên thiết kế của máy mà vẫn có thể trải nghiệm cảm biến vân tay ở mặt trước rất thuận tiện và dễ dàng.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-22.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Thời lượng pin\"></figure><p>Tính năng sạc ngược không dây vẫn xuất hiện trên Galaxy Note 10+ giúp bạn có thể biến chiếc máy thành một cục sạc không dây di động bất cứ lúc nào.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-16.jpg\" alt=\"Điện thoại Samsung Galaxy Note 10+ | Cấu hình\"></figure><p>Cấu hình của máy cũng thuộc top đầu bảng hiện nay với con chip&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/tim-hieu-chip-exynos-9825-1187140\">Exynos 9825 8 nhân 64-bit</a>&nbsp;kết hợp với 12 GB RAM và 256 GB bộ nhớ trong.</p><figure class=\"image\"><img src=\"https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-.jpg\" alt=\"Điểm Antutu trên Samsung Note 10 Plus\"></figure><p>Dung lượng pin 4300 mAh thoải mái cho bạn sử dụng cả ngày mà không cần phải bận tâm máy sẽ hết pin giữa chừng.</p><figure class=\"media\"><oembed url=\"https://youtu.be/KwwKiepF11s\"></oembed></figure>', 'https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-white-400x460.png,https://www.thegioididong.com/images/42/206176/samsung-galaxy-note-10-plus-tgdd-21.jpg,https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-23.jpg,https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-tgdd-10.jpg', 26990000, 199, 1, '{\"M\\u00e0n h\\u00ecnh\":\"Dynamic AMOLED, 6.8 inch, Quad HD+ (2K+)\",\"H\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh\":\"Android 9.0 (Pie)\",\"Camera sau\":\"Ch\\u00ednh 12 MP & Ph\\u1ee5 12 MP, 16 MP, TOF 3D\",\"Camera tr\\u01b0\\u1edbc\":\"10 MP\",\"CPU\":\"Exynos 9825 8 nh\\u00e2n 64-bit\",\"RAM\":\"12 GB\",\"B\\u1ed9 nh\\u1edb trong\":\"256 GB\",\"Th\\u1ebb nh\\u1edb\":\"MicroSD, h\\u1ed7 tr\\u1ee3 t\\u1ed1i \\u0111a 1 TB\",\"Dung l\\u01b0\\u1ee3ng pin\":\"4300 mAh, c\\u00f3 s\\u1ea1c nhanh\"}', '2019-09-25 15:21:37.857203', '2019-11-07 08:12:26.090806', 2, 1),
(4, 'Điện thoại iPhone Xs Max 256GB', 'iPhone Xs Max được Apple trang bị cho con chip mới toanh hàng đầu của hãng mang tên Apple A12. Chip A12 Bionic được xây dựng trên tiến trình 7nm đầu tiên mà hãng sản xuất với 6 nhân đáp ứng vượt trội trong việc xử lý các tác vụ và khả năng tiết kiệm năng lượng tối ưu.', 'https://cdn.tgdd.vn/Products/Images/42/190322/iphone-xs-max-256gb-white-400x460.png,https://cdn.tgdd.vn/Products/Images/42/190322/iphone-xs-max-256gb-gold-12.jpg,https://www.thegioididong.com/images/42/190322/iphone-xs-max-256gb-gold-5.jpg', 34990000, 197, 1, '{\"M\\u00e0n h\\u00ecnh\":\"OLED, 6.5 inches, Super Retina\",\"H\\u1ec7 \\u0111i\\u1ec1u h\\u00e0nh\":\"iOS 12\",\"Camera sau\":\"Ch\\u00ednh 12 MP & Ph\\u1ee5 12 MP\",\"Camera tr\\u01b0\\u1edbc\":\"7 MP\",\"CPU\":\"Apple A12 Bionic 6 nh\\u00e2n\",\"RAM\":\"4 GB\",\"B\\u1ed9 nh\\u1edb trong\":\"256 GB\",\"Dung l\\u01b0\\u1ee3ng pin\":\"3174 mAh, c\\u00f3 s\\u1ea1c nhanh\"}', '2019-09-26 03:50:07.596224', '2019-11-12 18:15:06.260569', 1, 1),
(5, 'Điện thoại iPhone Xr 128GB', '<p>Được xem là phiên bản iPhone giá rẻ đầy hoàn hảo, iPhone Xr 128GB khiến người dùng có nhiều sự lựa chọn hơn về màu sắc đa dạng nhưng vẫn sở hữu cấu hình mạnh mẽ và thiết kế sang trọng.</p>', 'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-400x460.png', 19990000, 99, 1, '{\"M\\u00e0n h\\u00ecnh\":\"IPS LCD, 6.1 inches Liquid Retina\"}', '2019-09-26 04:18:21.269908', '2019-11-13 08:38:18.225024', 1, 1),
(6, 'Điện thoại Samsung Galaxy S10+ (512GB)', 'Samsung Galaxy S10+ (512GB) - phiên bản kỷ niệm 10 năm chiếc Galaxy S đầu tiên ra mắt, là một chiếc smartphone hội tủ đủ các yếu tố mà bạn cần ở một chiếc máy cao cấp trong năm 2019.', 'https://cdn.tgdd.vn/Products/Images/42/198986/samsung-galaxy-s10-plus-512gb-ceramic-black-400x460.png,https://cdn.tgdd.vn/Products/Images/42/198986/samsung-galaxy-s10-plus-512gb-white-1.jpg,https://cdn.tgdd.vn/Products/Images/42/198986/samsung-galaxy-s10-plus-512gb-white-2.jpg', 28990000, 199, 1, '{\"M\\u00e0n h\\u00ecnh\":\"Dynamic AMOLED, 6.4 inches, Quad HD+ (2K+)\",\"CPU\":\"Exynos 9820 8 nh\\u00e2n 64-bit\"}', '2019-09-26 04:35:58.148470', '2019-11-13 08:48:00.690412', 2, 1),
(7, 'Điện thoại OPPO Reno 10x Zoom Edition', '<p>Những chiếc flagship trong năm 2019 không chỉ có một camera chụp ảnh đẹp, chụp xóa phông ảo diệu mà còn phải \'chụp thật xa\' và với chiếc OPPO Reno 10x Zoom Edition chính thức gia nhập thị trường \'smartphone có camera siêu zoom\'.</p>', 'https://cdn.tgdd.vn/Products/Images/42/201235/oppo-reno-10x-zoom-edition-black-400x460.png,https://cdn.tgdd.vn/Products/Images/42/201235/oppo-reno-10x-zoom-edition9.jpg,https://cdn.tgdd.vn/Products/Images/42/201235/oppo-reno-10x-zoom-edition5.jpg', 17990000, 49, 0, '{\"M\\u00e0n h\\u00ecnh\":\"AMOLED, 6.6 inches, Full HD+\",\"CPU\":\"Snapdragon 855 8 nh\\u00e2n 64-bit\",\"RAM\":\"8 GB\"}', '2019-09-26 06:54:57.544354', '2019-11-13 12:07:56.474072', 3, 3),
(8, 'Laptop MSI GF63 9RCX i5 9300H/8GB/512GB/4GB GTX1050Ti/Win10 (646VN)', '', 'https://cdn.tgdd.vn/Products/Images/44/209425/msi-gf63-9rcx-i5-9300h-8gb-512gb-4gb-gtx1050ti-win-1-600x600.jpg,https://cdn.tgdd.vn/Products/Images/44/209425/msi-gf63-9rcx-i5-9300h-8gb-512gb-4gb-gtx1050ti-win7.jpg,https://cdn.tgdd.vn/Products/Images/44/209425/msi-gf63-9rcx-i5-9300h-8gb-512gb-4gb-gtx1050ti-win10.jpg,https://cdn.tgdd.vn/Products/Images/44/209425/msi-gf63-9rcx-i5-9300h-8gb-512gb-4gb-gtx1050ti-win16.jpg', 21190000, 20, 1, '\"\"', '2019-09-28 13:43:46.752067', '2019-11-13 09:41:59.978521', 6, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotion_promotion`
--

CREATE TABLE `promotion_promotion` (
  `id` int(11) NOT NULL,
  `percent` int(10) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `image` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `promotion_promotion`
--

INSERT INTO `promotion_promotion` (`id`, `percent`, `start_date`, `end_date`, `image`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 5, '2019-08-29', '2019-09-05', 'https://vietsensetravel.com/view-350x250/at_tour-29--khuyen-mai-lon_c91941b03729ac83a0e42a0ebf876fb2.jpg', '2019-09-27 20:10:55.515335', '2019-09-27 20:27:50.821498', 1),
(2, 10, '2019-10-28', '2019-11-10', 'http://s3.amazonaws.com/uploads.shareist.com/piscifun_237893_o.jpg', '2019-11-02 14:23:03.212499', '2019-11-06 10:34:10.112094', 2),
(3, 5, '2019-11-09', '2019-11-15', 'https://static.digit.in/default/2d0b3af7c98fc2a9fd6646c87f753bc42ece2037.jpeg', '2019-11-09 08:23:03.869917', '2019-11-09 08:23:03.869917', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accounts_member`
--
ALTER TABLE `accounts_member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `address_address`
--
ALTER TABLE `address_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_address_member_id_54303fe3_fk_accounts_member_id` (`member_id`);

--
-- Chỉ mục cho bảng `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `brands_brand`
--
ALTER TABLE `brands_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_brand_name_5759061b_uniq` (`name`);

--
-- Chỉ mục cho bảng `cart_cart`
--
ALTER TABLE `cart_cart`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `cart_cartitem`
--
ALTER TABLE `cart_cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_cartitem_product_id_b24e265a_fk_products_product_id` (`product_id`),
  ADD KEY `cart_cartitem_cart_id_370ad265_fk_cart_cart_customer_id` (`cart_id`),
  ADD KEY `cart_cartitem_order_id_28c1fa95_fk_order_order_id` (`order_id`);

--
-- Chỉ mục cho bảng `categories_category`
--
ALTER TABLE `categories_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_category_title_7f88da35_uniq` (`title`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_member_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `order_order`
--
ALTER TABLE `order_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_order_buyer_id_dadf595a_fk_accounts_member_id` (`buyer_id`),
  ADD KEY `order_order_bill_address_id_91d4b58e` (`bill_address_id`),
  ADD KEY `order_order_shipping_address_id_57e64931_fk_address_address_id` (`shipping_address_id`);

--
-- Chỉ mục cho bảng `products_product`
--
ALTER TABLE `products_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_product_name_fa23bcd2_uniq` (`name`),
  ADD KEY `products_product_brand_id_3e2e8fd1_fk_brands_brand_id` (`brand_id`),
  ADD KEY `products_product_category_id_9b594869_fk_categories_category_id` (`category_id`);

--
-- Chỉ mục cho bảng `promotion_promotion`
--
ALTER TABLE `promotion_promotion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promotion_promotion_category_id_11d421e3_fk_categorie` (`category_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accounts_member`
--
ALTER TABLE `accounts_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `address_address`
--
ALTER TABLE `address_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `brands_brand`
--
ALTER TABLE `brands_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `cart_cartitem`
--
ALTER TABLE `cart_cartitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `categories_category`
--
ALTER TABLE `categories_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `order_order`
--
ALTER TABLE `order_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `products_product`
--
ALTER TABLE `products_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `promotion_promotion`
--
ALTER TABLE `promotion_promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `address_address`
--
ALTER TABLE `address_address`
  ADD CONSTRAINT `address_address_member_id_54303fe3_fk_accounts_member_id` FOREIGN KEY (`member_id`) REFERENCES `accounts_member` (`id`);

--
-- Các ràng buộc cho bảng `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_accounts_member_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_member` (`id`);

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `cart_cart`
--
ALTER TABLE `cart_cart`
  ADD CONSTRAINT `cart_cart_customer_id_bbe4c408_fk_accounts_member_id` FOREIGN KEY (`customer_id`) REFERENCES `accounts_member` (`id`);

--
-- Các ràng buộc cho bảng `cart_cartitem`
--
ALTER TABLE `cart_cartitem`
  ADD CONSTRAINT `cart_cartitem_cart_id_370ad265_fk_cart_cart_customer_id` FOREIGN KEY (`cart_id`) REFERENCES `cart_cart` (`customer_id`),
  ADD CONSTRAINT `cart_cartitem_order_id_28c1fa95_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  ADD CONSTRAINT `cart_cartitem_product_id_b24e265a_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_member_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_member` (`id`);

--
-- Các ràng buộc cho bảng `order_order`
--
ALTER TABLE `order_order`
  ADD CONSTRAINT `order_order_bill_address_id_91d4b58e_fk_address_address_id` FOREIGN KEY (`bill_address_id`) REFERENCES `address_address` (`id`),
  ADD CONSTRAINT `order_order_buyer_id_dadf595a_fk_accounts_member_id` FOREIGN KEY (`buyer_id`) REFERENCES `accounts_member` (`id`),
  ADD CONSTRAINT `order_order_shipping_address_id_57e64931_fk_address_address_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `address_address` (`id`);

--
-- Các ràng buộc cho bảng `products_product`
--
ALTER TABLE `products_product`
  ADD CONSTRAINT `products_product_brand_id_3e2e8fd1_fk_brands_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands_brand` (`id`),
  ADD CONSTRAINT `products_product_category_id_9b594869_fk_categories_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories_category` (`id`);

--
-- Các ràng buộc cho bảng `promotion_promotion`
--
ALTER TABLE `promotion_promotion`
  ADD CONSTRAINT `promotion_promotion_category_id_11d421e3_fk_categorie` FOREIGN KEY (`category_id`) REFERENCES `categories_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
