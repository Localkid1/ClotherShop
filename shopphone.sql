-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 29, 2024 lúc 05:37 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopphone`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `Id` int(11) NOT NULL,
  `HinhAnh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`Id`, `HinhAnh`) VALUES
(13, 'img/banners/slider_1.webp'),
(14, 'img/banners/slider_3.webp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `MaHD` int(11) NOT NULL,
  `MaSP` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `DonGia` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`MaHD`, `MaSP`, `SoLuong`, `DonGia`) VALUES
(22, 62, 1, 1899000),
(22, 63, 1, 499000),
(22, 65, 1, 1699000),
(22, 64, 1, 699000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `MaDM` int(11) NOT NULL,
  `TenDM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`MaDM`, `TenDM`) VALUES
(1, 'Đầm '),
(4, 'Chân Váy'),
(5, 'Áo dài');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHD` int(11) NOT NULL,
  `MaND` int(11) NOT NULL,
  `NgayLap` datetime NOT NULL,
  `NguoiNhan` varchar(50) NOT NULL,
  `SDT` varchar(20) NOT NULL,
  `DiaChi` varchar(100) NOT NULL,
  `PhuongThucTT` varchar(20) NOT NULL,
  `TongTien` float NOT NULL,
  `TrangThai` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MaHD`, `MaND`, `NgayLap`, `NguoiNhan`, `SDT`, `DiaChi`, `PhuongThucTT`, `TongTien`, `TrangThai`) VALUES
(22, 14, '2024-02-21 00:26:27', 'admin admin', '23423', 'nui thanh', '', 4796000, '0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khuyenmai`
--

CREATE TABLE `khuyenmai` (
  `MaKM` int(11) NOT NULL,
  `TenKM` varchar(100) NOT NULL,
  `LoaiKM` varchar(20) NOT NULL,
  `GiaTriKM` float(11,0) NOT NULL,
  `NgayBD` datetime NOT NULL,
  `TrangThai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `khuyenmai`
--

INSERT INTO `khuyenmai` (`MaKM`, `TenKM`, `LoaiKM`, `GiaTriKM`, `NgayBD`, `TrangThai`) VALUES
(1, 'Không khuyến mãi', 'Nothing', 0, '2023-10-14 00:00:00', 1),
(2, 'Giảm giá', 'GiamGia', 500000, '2023-10-14 14:30:48', 1),
(3, 'Giá rẻ online', 'GiaReOnline', 650000, '2023-10-14 14:30:52', 1),
(4, 'Trả góp', 'TraGop', 0, '2023-10-14 14:30:54', 1),
(5, 'Mới ra mắt', 'MoiRaMat', 0, '2023-10-14 14:31:01', 1),
(13, 'Thích thì khuyến mãi', 'Khuyến mãi Ok', 100, '2023-10-14 14:31:04', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MaLSP` int(11) NOT NULL,
  `TenLSP` varchar(70) NOT NULL,
  `HinhAnh` varchar(200) NOT NULL,
  `Mota` varchar(200) NOT NULL,
  `MaDM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLSP`, `TenLSP`, `HinhAnh`, `Mota`, `MaDM`) VALUES
(44, 'Chanel', 'logo.png', 'Chanel', 1),
(45, 'Louis Vuitton', '4_763b3e3d2c6142d69db0a685e2ddf9c5_master.png', 'Louis Vuitton', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `MaND` int(11) NOT NULL,
  `Ho` varchar(20) NOT NULL,
  `Ten` varchar(20) NOT NULL,
  `GioiTinh` varchar(10) NOT NULL,
  `SDT` varchar(20) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `DiaChi` varchar(200) NOT NULL,
  `TaiKhoan` varchar(100) NOT NULL,
  `MatKhau` varchar(100) NOT NULL,
  `MaQuyen` int(11) NOT NULL,
  `TrangThai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`MaND`, `Ho`, `Ten`, `GioiTinh`, `SDT`, `Email`, `DiaChi`, `TaiKhoan`, `MatKhau`, `MaQuyen`, `TrangThai`) VALUES
(14, 'admin', 'admin', 'Nam', '0563650708', 'admin@gmail.com', 'Thai Binh', 'admin', 'c3284d0f94606de1fd2af172aba15bf3', 2, 1),
(17, 'admin', 'admin', 'Nam', 'admin', 'admin@gmail.com', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phanquyen`
--

CREATE TABLE `phanquyen` (
  `MaQuyen` int(11) NOT NULL,
  `TenQuyen` varchar(20) NOT NULL,
  `ChiTietQuyen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `phanquyen`
--

INSERT INTO `phanquyen` (`MaQuyen`, `TenQuyen`, `ChiTietQuyen`) VALUES
(1, 'Customer', 'Khách hàng có tài khoản'),
(2, 'Admin', 'Quản trị viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int(11) NOT NULL,
  `MaLSP` int(11) NOT NULL,
  `MaDM` int(11) NOT NULL,
  `TenSP` varchar(70) NOT NULL,
  `DonGia` int(11) NOT NULL,
  `SoLuong` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `HinhAnh1` varchar(200) NOT NULL,
  `HinhAnh2` varchar(255) DEFAULT NULL,
  `HinhAnh3` varchar(255) DEFAULT NULL,
  `MaKM` int(11) NOT NULL,
  `ManHinh` varchar(50) DEFAULT NULL,
  `HDH` varchar(50) DEFAULT NULL,
  `CamSau` varchar(50) DEFAULT NULL,
  `CamTruoc` varchar(50) DEFAULT NULL,
  `CPU` varchar(50) DEFAULT NULL,
  `Ram` varchar(50) DEFAULT NULL,
  `Rom` varchar(50) DEFAULT NULL,
  `SDCard` varchar(50) DEFAULT NULL,
  `Pin` varchar(50) DEFAULT NULL,
  `SoSao` int(11) NOT NULL,
  `SoDanhGia` int(11) NOT NULL,
  `TrangThai` int(11) NOT NULL,
  `MoTa` text NOT NULL,
  `ThoiGian` datetime DEFAULT NULL,
  `KichThuoc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MauSac` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `MaLSP`, `MaDM`, `TenSP`, `DonGia`, `SoLuong`, `HinhAnh1`, `HinhAnh2`, `HinhAnh3`, `MaKM`, `ManHinh`, `HDH`, `CamSau`, `CamTruoc`, `CPU`, `Ram`, `Rom`, `SDCard`, `Pin`, `SoSao`, `SoDanhGia`, `TrangThai`, `MoTa`, `ThoiGian`, `KichThuoc`, `MauSac`) VALUES
(62, 44, 1, 'ĐẦM LIỀN TRẮNG D12922', 1899000, 100, 'img/products/4_763b3e3d2c6142d69db0a685e2ddf9c5_master.png', '/img/products/d129221432364030258p1899dt_2__0781f82978fe4ba48d929398940d990a_master.png', '/img/products/d129221432364030258p1899dt_3__879a1d0678b549f2b8d56b652cc16d2c_master.png', 1, 'vải tweed ', 'đầm thiết kế dáng chữ A dài qua gối, cổ bẻ,tone mà', 'mặc sản phẩm size 2', 'Over', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '<div class=\"pro-brand\" style=\"display: inline-block; width: 359.984px; font-size: 14px; line-height: 21px; color: rgb(7, 7, 7); font-family: gmv_din_pro;\"><span class=\"title\">Thương hiệu:</span>&nbsp;<a href=\"https://nemshop.vn/collections/vendors?q=nem&amp;view=vendor-alt\" style=\"color: rgb(7, 7, 7); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; transition: all 0.3s ease 0s; position: relative; display: inline-block;\">NEM</a></div><p><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><br></p><div class=\"pro-sku ProductSku\" style=\"display: inline-block; color: rgb(7, 7, 7); width: 359.984px; font-size: 14px; line-height: 21px; font-family: gmv_din_pro;\"><span class=\"title\">Mã SP:</span>&nbsp;<span class=\"sku-number\">129221432364030258</span></div>', '2024-02-20 16:50:00', 'Size 2', 'Trắng'),
(63, 45, 4, 'CHÂN VÁY MIDI HOA Z42042', 499000, 100, 'img/products/5_4af088e56bac434d9e5acb02e4e65155_master.png', '/img/products/sm411921232333030674p399dt_z420421542451400257p499dt_3__4bc47b7962774d369765e19afc7395cf_master.png', '/img/products/sm411921232333030674p399dt_z420421542451400257p499dt_d34e86f7f1f7473994e74641957fa84e_master.png', 2, 'vải tơ', 'chân váy thiết kế dáng chữ A dài qua gối, kết hợp ', ' áo SM41192', ' cao 1m60, nặng 50kg, số đo 84 - 64 - 90 mặc sản p', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '<div class=\"pro-brand\" style=\"display: inline-block; width: 359.984px; font-size: 14px; line-height: 21px; color: rgb(7, 7, 7); font-family: gmv_din_pro;\"><span class=\"title\" style=\"\">Thương hiệu:</span>&nbsp;OverGod</div><p><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><span class=\"title\" style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">Mã SP:</span><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><span class=\"sku-number\" style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">420421542451400257</span></p>', '2024-02-20 16:57:27', 'Size 3', 'Hồng'),
(64, 45, 1, 'ĐẦM HOA TAY BỒNG D42012', 699000, 100, 'img/products/6_64e2213b1d564b028066696836214bc9_master.png', '/img/products/d420121432461400457p699dt_4__f913b0027a15441abd8fd156a3023d75_master.png', '/img/products/d420121432461400457p699dt_c3f9687fa145412cba1e8ac115fb6d01_master.png', 2, 'vải tơ', ' đầm thiết kế dáng chữ A dài qua gối, kết hợp họa ', 'mặc sản phẩm size 2', '1m65cm, nặng 50kg', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '<div class=\"pro-brand\" style=\"display: inline-block; width: 359.984px; font-size: 14px; line-height: 21px; color: rgb(7, 7, 7); font-family: gmv_din_pro;\"><span class=\"title\">Thương hiệu:</span>&nbsp;Overgad</div><p><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><span class=\"title\" style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">Mã SP:</span><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><span class=\"sku-number\" style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">420121432461400257</span></p>', '2024-02-20 17:05:56', 'Size 2', 'Hồng'),
(65, 45, 5, 'ÁO DÀI HOA ĐỎ AD14052', 1699000, 100, 'img/products/4_91aeb457d72041eaa2e5d027f4d769aa_master.png', '/img/products/ad140521582411020201p1699dt_q140621782451020257p1699dt_3__0700b70bbcc543818d17e12fa64cb8c8_master.png', '/img/products/ad140521582411020201p1699dt_q140621782451020257p1699dt_9f569bcba98e43e69b084a43f996e221_master.png', 2, ' vải tổng hợp cao cấp ', ' áo dài thiết kế dài tay, tone nền màu đỏ kết hợp ', 'quần Q14062', ' mặc sản phẩm size 2', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '<div class=\"pro-brand\" style=\"display: inline-block; width: 359.984px; font-size: 14px; line-height: 21px; color: rgb(7, 7, 7); font-family: gmv_din_pro;\"><span class=\"title\">Thương hiệu:</span>&nbsp;OverGod</div><p><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><span class=\"title\" style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">Mã SP:</span><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><span class=\"sku-number\" style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">140521582411020201</span></p>', '2024-02-20 17:33:14', 'Size 2', 'Đỏ'),
(66, 45, 1, 'ĐẦM SUÔNG HOA TAY VOAN D15852', 1599000, 100, 'img/products/d158521422461000601p1599dt_1__b8886937df924e019c4e4615b559e20b_master.jpg', '/img/products/d158521422461000601p1599dt_638a8fd4856843979d4f803e72f10df8_master.webp', '/img/products/5_dd846431ed5e4af690bc379da4c88deb_master.png', 2, ' vải tổng hợp cao cấp ', 'đầm thiết kế dáng chữ A dài qua gối, cổ bẻ,tone mà', 'quần Q14062', ' cao 1m60, nặng 50kg, số đo 84 - 64 - 90 mặc sản p', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '<div class=\"pro-brand\" style=\"display: inline-block; width: 359.984px; font-size: 14px; line-height: 21px; color: rgb(7, 7, 7); font-family: gmv_din_pro;\"><span class=\"title\">Thương hiệu:</span>&nbsp;Overgad</div><p><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><br></p><div class=\"pro-sku ProductSku\" style=\"display: inline-block; color: rgb(7, 7, 7); width: 359.984px; font-size: 14px; line-height: 21px; font-family: gmv_din_pro;\"><span class=\"title\">Mã SP:</span>&nbsp;<span class=\"sku-number\">158521422461000601</span></div>', '2024-02-20 22:50:43', 'Size 2', 'Trắng'),
(67, 45, 1, 'ĐẦM GẤM HOA D15822', 1899000, 100, 'img/products/15_55c428a8bd6b4219ad302e1338b566a5_master.webp', '/img/products/d158221412431000205p1899dt_3__9ba894fd27e64a7a8c2c296f31afc2a6_master.webp', '/img/products/d158221412431000205p1899dt_4__b775a2d4388e48d3af7fded7dfd73964_master.jpg', 1, '', '', '', '', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '<div class=\"pro-brand\" style=\"display: inline-block; width: 359.984px; font-size: 14px; line-height: 21px; color: rgb(7, 7, 7); font-family: gmv_din_pro;\"><span class=\"title\">Thương hiệu:</span> Overgod</div><p><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\"> </span><br></p><div class=\"pro-sku ProductSku\" style=\"display: inline-block; color: rgb(7, 7, 7); width: 359.984px; font-size: 14px; line-height: 21px; font-family: gmv_din_pro;\"><span class=\"title\">Mã SP:</span> <span class=\"sku-number\">158221412431000</span></div>', '2024-02-20 22:53:44', '', ''),
(68, 45, 4, 'CHÂN VÁY BÚT CHÌ NHÚN HÔNG Z14672', 999000, 100, 'img/products/5_cf5b4852e97045348d50e761ffa3962a_master.webp', '/img/products/sm158421232431000457p899dt_z146721542411120218p999dt_2__copy_d3d4009a288545baafdc818ce54c8978_master.jpg', '/img/products/sm158421232431000457p899dt_z146721542411120218p999dt_2__copy_d3d4009a288545baafdc818ce54c8978_master.jpg', 1, ' vải thô', ' ​chân váy thiết kế dáng bút chì, tone màu đỏ đậm', ' áo SM15842', 'cao 1m60, nặng 50kg, số đo 84 - 64 - 90 mặc sản ph', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '<div class=\"pro-brand\" style=\"display: inline-block; width: 359.984px; font-size: 14px; line-height: 21px; color: rgb(7, 7, 7); font-family: gmv_din_pro;\"><span class=\"title\">Thương hiệu:</span>&nbsp;Overgod</div><p><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><br></p><div class=\"pro-sku ProductSku\" style=\"display: inline-block; color: rgb(7, 7, 7); width: 359.984px; font-size: 14px; line-height: 21px; font-family: gmv_din_pro;\"><span class=\"title\">Mã SP:</span>&nbsp;<span class=\"sku-number\">146721542411120418</span></div>', '2024-02-20 22:56:50', 'Size 2', 'Hồng'),
(69, 44, 4, 'CHÂN VÁY MIDI Z14462', 899000, 100, 'img/products/2_a515098af03542c6988d605e65329c9d_master.webp', '/img/products/sm056621222333430258p999dt_z144621542431040201p899dt_copy_a7511ce7f85a47e7982e918b18560328_master.webp', '/img/products/sm056621222333430258p999dt_z144621542431040201p899dt_2__copy_fc0b69da0d844b87be3161b7ec8e734f_master.jpg', 5, 'vải thô', ' ​chân váy thiết kế dáng chữ A, tone màu nâu trơn', 'áo SM05662', 'cao 1m60, nặng 50kg, số đo 84 - 64 - 90 mặc sản ph', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '<div class=\"pro-brand\" style=\"display: inline-block; width: 359.984px; font-size: 14px; line-height: 21px; color: rgb(7, 7, 7); font-family: gmv_din_pro;\"><span class=\"title\">Thương hiệu:</span>&nbsp;Overgod</div><p><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><br></p><div class=\"pro-sku ProductSku\" style=\"display: inline-block; color: rgb(7, 7, 7); width: 359.984px; font-size: 14px; line-height: 21px; font-family: gmv_din_pro;\"><span class=\"title\">Mã SP:</span>&nbsp;<span class=\"sku-number\">144621542431040201</span></div>', '2024-02-20 22:59:17', 'Size 2', 'Hồng'),
(70, 45, 4, 'CHÂN VÁY MIDI Z13182', 990000, 100, 'img/products/13_b43fff07df8a409e8139becb7c3077bf_master.webp', '/img/products/ak131721332384060401p1299dt_z131821542384160401p999dt_4__1f24100608a54f629de79a6e0704131f_master.webp', '/img/products/ak131721332384060401p1299dt_z131821542384160401p999dt_6__d85fe272b6614bf8884c366bcb632168_master.webp', 2, 'vải tơ', 'đầm thiết kế dáng chữ A dài qua gối, cổ bẻ,tone mà', 'mặc sản phẩm size 2', 'cao 1m60, nặng 50kg, số đo 84 - 64 - 90 mặc sản ph', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '<div class=\"pro-brand\" style=\"display: inline-block; width: 359.984px; font-size: 14px; line-height: 21px; color: rgb(7, 7, 7); font-family: gmv_din_pro;\"><span class=\"title\">Thương hiệu:</span> Overgad</div><p><span class=\"title\" style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">Mã SP:</span><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\"> </span><span class=\"sku-number\" style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">131821542384160401</span><br></p>', '2024-02-20 23:04:26', 'Size 2', 'Hồng'),
(71, 45, 5, 'ÁO DÀI HOA TRẮNG AD39721', 1699000, 100, 'img/products/2_25aa1c7d1f8743f5986aedc6b1c41e5b_master.webp', '/img/products/ad139721582421030218p1699dt_q139821782321030218p699dt_3__8c16fff6fd354973a151c47594617d67_master.webp', '/img/products/ad139721582421030218p1699dt_q139821782321030218p699dt_7d8d8ee37d254e33bbe548ccb8157d40_master.webp', 2, 'vải tơ', 'áo dài thiết kế tay lỡ, tone màu trắng ', 'quần Q14062', 'cao 1m60, nặng 50kg, số đo 84 - 64 - 90 mặc sản ph', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '<div class=\"pro-brand\" style=\"display: inline-block; width: 359.984px; font-size: 14px; line-height: 21px; color: rgb(7, 7, 7); font-family: gmv_din_pro;\"><span class=\"title\">Thương hiệu:</span>&nbsp;<a href=\"https://nemshop.vn/collections/vendors?q=nem&amp;view=vendor-alt\" style=\"color: rgb(7, 7, 7); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; transition: all 0.3s ease 0s; position: relative; display: inline-block;\">NEM</a></div><p><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><br></p><div class=\"pro-sku ProductSku\" style=\"display: inline-block; color: rgb(7, 7, 7); width: 359.984px; font-size: 14px; line-height: 21px; font-family: gmv_din_pro;\"><span class=\"title\">Mã SP:</span>&nbsp;<span class=\"sku-number\">139721582421030218</span></div>', '2024-02-20 23:06:30', 'Size 3', 'Trắng'),
(72, 45, 5, 'ÁO DÀI ĐÍNH HOA 3D D13992', 1499000, 100, 'img/products/13_1ab099fdcdba4a28b0bb21b2d6510a66_master.webp', '/img/products/ad139921582311060458p1499dt_q140021782351060258p699dt_2__ddd9ac23646a4a22b644b4a5d06f0b79_master.webp', '/img/products/ad139921582311060458p1499dt_q140021782351060258p699dt_d6a0999fc3564088a4bb9971756f29ae_master.webp', 3, 'vải tơ', 'áo dài thiết kế cổ tròn, tay lỡ, đính hoa 3D bản t', 'quần Q14062', 'cao 1m60, nặng 50kg, số đo 84 - 64 - 90 mặc sản ph', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '<div class=\"pro-brand\" style=\"display: inline-block; width: 359.984px; font-size: 14px; line-height: 21px; color: rgb(7, 7, 7); font-family: gmv_din_pro;\"><span class=\"title\">Thương hiệu:</span>&nbsp;Overgod</div><p><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><span class=\"title\" style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">Mã SP:</span><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><span class=\"sku-number\" style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">139921582311060258</span></p>', '2024-02-20 23:08:29', 'Size 2', 'Xanh'),
(73, 45, 5, 'ÁO DÀI HOA TAY BỒNG AD14302', 1899000, 100, 'img/products/3_0eb43492167a476290870e132505ea7f_master.webp', '/img/products/ad143021582311000401p1599dt_q143121782311020401p699dt_2__11bc358d71714d02a08ea9dad072153c_master.webp', '/img/products/ad143021582311000401p1599dt_q143121782311020401p699dt_88e723cbfaa3487f84431bea4439e0a8_master.webp', 3, 'Vải tơ', ' áo dài thiết kế dài tay, tone nền màu đỏ kết hợp ', 'quần Q14062', 'cao 1m60, nặng 50kg, số đo 84 - 64 - 90 mặc sản ph', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '<div class=\"pro-brand\" style=\"display: inline-block; width: 359.984px; font-size: 14px; line-height: 21px; color: rgb(7, 7, 7); font-family: gmv_din_pro;\"><span class=\"title\">Thương hiệu:</span>&nbsp;Overgoad</div><p><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><span class=\"title\" style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">Mã SP:</span><span style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">&nbsp;</span><span class=\"sku-number\" style=\"color: rgb(7, 7, 7); font-family: gmv_din_pro; font-size: 14px;\">139721582421030218</span></p>', '2024-02-20 23:10:29', 'Size 2', 'Hồng');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`Id`) USING BTREE;

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD KEY `MaHD` (`MaHD`) USING BTREE,
  ADD KEY `MaSP` (`MaSP`) USING BTREE;

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`MaDM`) USING BTREE;

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MaHD`) USING BTREE,
  ADD KEY `MaKH` (`MaND`) USING BTREE;

--
-- Chỉ mục cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  ADD PRIMARY KEY (`MaKM`) USING BTREE;

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MaLSP`) USING BTREE,
  ADD KEY `MaDM` (`MaDM`) USING BTREE,
  ADD KEY `MaLSP` (`MaLSP`,`MaDM`) USING BTREE,
  ADD KEY `MaLSP_2` (`MaLSP`) USING BTREE;

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`MaND`) USING BTREE,
  ADD KEY `MaQuyen` (`MaQuyen`) USING BTREE;

--
-- Chỉ mục cho bảng `phanquyen`
--
ALTER TABLE `phanquyen`
  ADD PRIMARY KEY (`MaQuyen`) USING BTREE;

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`) USING BTREE,
  ADD KEY `LoaiSP` (`MaLSP`) USING BTREE,
  ADD KEY `MaKM` (`MaKM`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `MaHD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  MODIFY `MaKM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `MaLSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `MaND` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `phanquyen`
--
ALTER TABLE `phanquyen`
  MODIFY `MaQuyen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`MaHD`) REFERENCES `hoadon` (`MaHD`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`MaND`) REFERENCES `nguoidung` (`MaND`);

--
-- Các ràng buộc cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD CONSTRAINT `MaDM` FOREIGN KEY (`MaDM`) REFERENCES `danhmuc` (`MaDM`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD CONSTRAINT `nguoidung_ibfk_1` FOREIGN KEY (`MaQuyen`) REFERENCES `phanquyen` (`MaQuyen`);

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_2` FOREIGN KEY (`MaKM`) REFERENCES `khuyenmai` (`MaKM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sanpham_ibfk_3` FOREIGN KEY (`MaLSP`) REFERENCES `loaisanpham` (`MaLSP`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
