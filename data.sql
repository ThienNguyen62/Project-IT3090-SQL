-- DỮ LIỆU MẪU CHO SQL SERVER
-- Chạy create_table.sql thành công trước, sau đó chạy file này một lần.
-- Dữ liệu giả lập; mức phí và tiêu chuẩn chỉ phục vụ bài tập.
-- Chèn bảng cha trước, bảng con sau theo thứ tự bên dưới.

USE DangKiemXeOTo;
GO

-- 1. CHU_PHUONG_TIEN: 5 bản ghi
INSERT INTO CHU_PHUONG_TIEN
    (MaChuXe, TenChuXe, SoGiayToDinhDanh, DiaChi, SoDienThoai, LoaiChuXe)
VALUES
    (N'CX01', N'Nguyễn Văn An', N'GT000001', N'Hà Nội', N'0900000001', N'Cá nhân'),
    (N'CX02', N'Trần Thị Bình', N'GT000002', N'Hà Nội', N'0900000002', N'Cá nhân'),
    (N'CX03', N'Công ty Vận tải Minh Phát', N'DN000003', N'Bắc Ninh', N'0900000003', N'Tổ chức'),
    (N'CX04', N'Lê Văn Cường', N'GT000004', N'Hải Phòng', N'0900000004', N'Cá nhân'),
    (N'CX05', N'Phạm Thị Dung', N'GT000005', N'Hà Nội', N'0900000005', N'Cá nhân');
GO

-- 2. PHUONG_TIEN: 6 bản ghi
INSERT INTO PHUONG_TIEN
    (MaPhuongTien, BienSo, SoKhung, SoMay, NhanHieu, LoaiPhuongTien, NamSanXuat)
VALUES
    (N'XE01', N'30A-100.01', N'KHUNG001', N'MAY001', N'Toyota', N'Ô tô con', 2021),
    (N'XE02', N'30B-200.02', N'KHUNG002', N'MAY002', N'Honda', N'Ô tô con', 2020),
    (N'XE03', N'99C-300.03', N'KHUNG003', N'MAY003', N'Hyundai', N'Ô tô tải', 2019),
    (N'XE04', N'15A-400.04', N'KHUNG004', N'MAY004', N'Kia', N'Ô tô con', 2022),
    (N'XE05', N'30F-500.05', N'KHUNG005', N'MAY005', N'Ford', N'Ô tô khách', 2018),
    (N'XE06', N'30G-600.06', N'KHUNG006', N'MAY006', N'Mazda', N'Ô tô con', 2023);
GO

-- 3. TRAM_DANG_KIEM: 3 bản ghi
INSERT INTO TRAM_DANG_KIEM
    (MaTram, TenTram, DiaChi, SoDienThoai)
VALUES
    (N'TR01', N'Trạm đăng kiểm mẫu Hà Nội', N'Hà Nội', N'0240000001'),
    (N'TR02', N'Trạm đăng kiểm mẫu Bắc Ninh', N'Bắc Ninh', N'0222000001'),
    (N'TR03', N'Trạm đăng kiểm mẫu Hải Phòng', N'Hải Phòng', N'0225000001');
GO

-- 4. NHAN_VIEN: 5 bản ghi
INSERT INTO NHAN_VIEN
    (MaNhanVien, MaTram, HoTen, ChucVu, SoDienThoai, TrangThaiLamViec)
VALUES
    (N'NV01', N'TR01', N'Đỗ Văn Nam', N'Đăng kiểm viên', N'0910000001', N'Đang làm việc'),
    (N'NV02', N'TR01', N'Vũ Thị Lan', N'Đăng kiểm viên', N'0910000002', N'Đang làm việc'),
    (N'NV03', N'TR02', N'Ngô Văn Hùng', N'Đăng kiểm viên', N'0910000003', N'Đang làm việc'),
    (N'NV04', N'TR02', N'Bùi Thị Hoa', N'Thu phí', N'0910000004', N'Đang làm việc'),
    (N'NV05', N'TR03', N'Đặng Văn Sơn', N'Đăng kiểm viên', N'0910000005', N'Đang làm việc');
GO

-- 5. DAY_CHUYEN_KIEM_DINH: 4 bản ghi
INSERT INTO DAY_CHUYEN_KIEM_DINH
    (MaDayChuyen, MaTram, TenDayChuyen, TrangThaiHoatDong)
VALUES
    (N'DC01', N'TR01', N'Dây chuyền số 1', N'Hoạt động'),
    (N'DC02', N'TR01', N'Dây chuyền số 2', N'Hoạt động'),
    (N'DC03', N'TR02', N'Dây chuyền xe tải', N'Hoạt động'),
    (N'DC04', N'TR03', N'Dây chuyền số 1', N'Hoạt động');
GO

-- 6. LICH_SU_SO_HUU: 7 bản ghi
INSERT INTO LICH_SU_SO_HUU
    (MaSoHuu, MaChuXe, MaPhuongTien, TuNgay, DenNgay)
VALUES
    (N'SH01', N'CX01', N'XE01', N'2021-01-01', N'2026-06-30'),
    (N'SH02', N'CX02', N'XE01', N'2026-07-01', NULL),
    (N'SH03', N'CX02', N'XE02', N'2020-01-01', NULL),
    (N'SH04', N'CX03', N'XE03', N'2019-01-01', NULL),
    (N'SH05', N'CX04', N'XE04', N'2022-01-01', NULL),
    (N'SH06', N'CX03', N'XE05', N'2018-01-01', NULL),
    (N'SH07', N'CX05', N'XE06', N'2023-01-01', NULL);
GO

-- 7. TINH_TRANG_PHUONG_TIEN: 4 bản ghi
INSERT INTO TINH_TRANG_PHUONG_TIEN
    (MaTinhTrang, MaPhuongTien, LoaiTinhTrang, TrangThai, NgayBatDau, NgayKetThuc)
VALUES
    (N'TT01', N'XE02', N'Cảnh báo lỗi đèn', N'Đã xử lý', N'2026-09-02', N'2026-09-03'),
    (N'TT02', N'XE03', N'Cảnh báo lỗi phanh', N'Đã xử lý', N'2026-09-04', N'2026-09-06'),
    (N'TT03', N'XE05', N'Cảnh báo khí thải', N'Đang xử lý', N'2026-10-10', NULL),
    (N'TT04', N'XE01', N'Thay đổi chủ sở hữu', N'Đã xử lý', N'2026-07-01', N'2026-07-01');
GO

-- 8. LICH_HEN: 6 bản ghi
INSERT INTO LICH_HEN
    (MaLichHen, MaPhuongTien, KenhDatLich, TrangThai, TenNguoiDatLich, SoDienThoaiNguoiDatLich, ThoiDiemDatLich, ThoiDiemHen)
VALUES
    (N'LH01', N'XE01', N'Website', N'Đã thực hiện', N'Trần Thị Bình', N'0900000002', N'2026-08-30T09:00:00', N'2026-09-01T08:00:00'),
    (N'LH02', N'XE02', N'Điện thoại', N'Đã thực hiện', N'Trần Thị Bình', N'0900000002', N'2026-09-01T10:00:00', N'2026-09-02T08:00:00'),
    (N'LH03', N'XE03', N'Website', N'Đã thực hiện', N'Nguyễn Văn Tài', N'0920000003', N'2026-09-02T09:00:00', N'2026-09-04T08:00:00'),
    (N'LH04', N'XE04', N'Website', N'Đã thực hiện', N'Lê Văn Cường', N'0900000004', N'2026-10-01T10:00:00', N'2026-10-05T08:00:00'),
    (N'LH05', N'XE06', N'Điện thoại', N'Đã đặt', N'Phạm Thị Dung', N'0900000005', N'2026-10-26T10:00:00', N'2026-11-02T08:00:00'),
    (N'LH06', N'XE05', N'Website', N'Đã hủy', N'Nguyễn Văn Tài', N'0920000003', N'2026-10-01T09:00:00', N'2026-10-08T08:00:00');
GO

-- 9. HO_SO_DANG_KIEM: 6 bản ghi
INSERT INTO HO_SO_DANG_KIEM
    (MaHoSo, MaPhuongTien, MaTram, ThoiDiemTiepNhan, TrangThaiHoSo)
VALUES
    (N'HS01', N'XE01', N'TR01', N'2026-09-01T07:50:00', N'Hoàn tất'),
    (N'HS02', N'XE02', N'TR01', N'2026-09-02T07:50:00', N'Hoàn tất'),
    (N'HS03', N'XE03', N'TR02', N'2026-09-04T07:50:00', N'Hoàn tất'),
    (N'HS04', N'XE04', N'TR03', N'2026-10-05T07:50:00', N'Hoàn tất'),
    (N'HS05', N'XE05', N'TR02', N'2026-10-10T08:00:00', N'Chờ tái kiểm định'),
    (N'HS06', N'XE06', N'TR01', N'2026-10-20T08:00:00', N'Đang kiểm định');
GO

-- 10. LUOT_KIEM_DINH: 8 bản ghi
INSERT INTO LUOT_KIEM_DINH
    (MaKiemDinh, MaHoSo, MaDayChuyen, MaLichHen, LoaiKiemDinh, ThoiGianKiemDinh)
VALUES
    (N'KD01', N'HS01', N'DC01', N'LH01', N'Lần đầu', N'2026-09-01T08:00:00'),
    (N'KD02', N'HS02', N'DC02', N'LH02', N'Lần đầu', N'2026-09-02T08:00:00'),
    (N'KD03', N'HS02', N'DC02', NULL, N'Tái kiểm định', N'2026-09-03T08:00:00'),
    (N'KD04', N'HS03', N'DC03', N'LH03', N'Lần đầu', N'2026-09-04T08:00:00'),
    (N'KD05', N'HS03', N'DC03', NULL, N'Tái kiểm định', N'2026-09-06T08:00:00'),
    (N'KD06', N'HS04', N'DC04', N'LH04', N'Lần đầu', N'2026-10-05T08:00:00'),
    (N'KD07', N'HS05', N'DC03', NULL, N'Lần đầu', N'2026-10-10T08:10:00'),
    (N'KD08', N'HS06', N'DC01', NULL, N'Lần đầu', N'2026-10-20T08:10:00');
GO

-- 11. HANG_MUC_KIEM_DINH: 4 bản ghi
INSERT INTO HANG_MUC_KIEM_DINH
    (MaHangMuc, TenHangMuc, NhomHangMuc, MoTaTieuChuan)
VALUES
    (N'HM01', N'Nhận dạng phương tiện', N'Tổng quát', N'Đối chiếu biển số và nhận dạng xe; mô tả giả lập.'),
    (N'HM02', N'Hệ thống phanh', N'An toàn', N'Đánh giá hệ thống phanh; giá trị đo minh họa theo %.'),
    (N'HM03', N'Khí thải', N'Môi trường', N'Đánh giá khí thải; giá trị đo minh họa, không dùng làm ngưỡng pháp lý.'),
    (N'HM04', N'Hệ thống đèn', N'An toàn', N'Kiểm tra tình trạng hoạt động của đèn.');
GO

-- 12. CHI_TIET_KIEM_DINH: 28 bản ghi
INSERT INTO CHI_TIET_KIEM_DINH
    (MaChiTiet, MaKiemDinh, MaNhanVien, MaHangMuc, KetQua, GiaTriDo)
VALUES
    (N'CT01', N'KD01', N'NV01', N'HM01', N'Đạt', NULL),
    (N'CT02', N'KD01', N'NV01', N'HM02', N'Đạt', 70),
    (N'CT03', N'KD01', N'NV01', N'HM03', N'Đạt', 1.2),
    (N'CT04', N'KD01', N'NV01', N'HM04', N'Đạt', NULL),
    (N'CT05', N'KD02', N'NV02', N'HM01', N'Đạt', NULL),
    (N'CT06', N'KD02', N'NV02', N'HM02', N'Đạt', 70),
    (N'CT07', N'KD02', N'NV02', N'HM03', N'Không đạt', 8),
    (N'CT08', N'KD02', N'NV02', N'HM04', N'Không đạt', NULL),
    (N'CT09', N'KD03', N'NV02', N'HM01', N'Đạt', NULL),
    (N'CT10', N'KD03', N'NV02', N'HM02', N'Đạt', 70),
    (N'CT11', N'KD03', N'NV02', N'HM03', N'Đạt', 1.2),
    (N'CT12', N'KD03', N'NV02', N'HM04', N'Đạt', NULL),
    (N'CT13', N'KD04', N'NV03', N'HM01', N'Đạt', NULL),
    (N'CT14', N'KD04', N'NV03', N'HM02', N'Không đạt', 35),
    (N'CT15', N'KD04', N'NV03', N'HM03', N'Đạt', 1.2),
    (N'CT16', N'KD04', N'NV03', N'HM04', N'Đạt', NULL),
    (N'CT17', N'KD05', N'NV03', N'HM01', N'Đạt', NULL),
    (N'CT18', N'KD05', N'NV03', N'HM02', N'Đạt', 70),
    (N'CT19', N'KD05', N'NV03', N'HM03', N'Đạt', 1.2),
    (N'CT20', N'KD05', N'NV03', N'HM04', N'Đạt', NULL),
    (N'CT21', N'KD06', N'NV05', N'HM01', N'Đạt', NULL),
    (N'CT22', N'KD06', N'NV05', N'HM02', N'Đạt', 70),
    (N'CT23', N'KD06', N'NV05', N'HM03', N'Đạt', 1.2),
    (N'CT24', N'KD06', N'NV05', N'HM04', N'Đạt', NULL),
    (N'CT25', N'KD07', N'NV03', N'HM01', N'Đạt', NULL),
    (N'CT26', N'KD07', N'NV03', N'HM02', N'Đạt', 70),
    (N'CT27', N'KD07', N'NV03', N'HM03', N'Không đạt', 8),
    (N'CT28', N'KD07', N'NV03', N'HM04', N'Đạt', NULL);
GO

-- 13. THANH_TOAN: 7 bản ghi
INSERT INTO THANH_TOAN
    (MaThanhToan, LePhiKiemDinh, PhiBaoTriDuongBo, ThoiGianNopPhi, TrangThai)
VALUES
    (N'TTN01', 340000, 1560000, N'2026-09-01T09:00:00', N'Đã thanh toán'),
    (N'TTN02', 390000, 1560000, N'2026-09-03T09:00:00', N'Đã thanh toán'),
    (N'TTN03', 450000, 2160000, N'2026-09-06T09:00:00', N'Đã thanh toán'),
    (N'TTN04', 340000, 1560000, N'2026-10-05T09:00:00', N'Đã thanh toán'),
    (N'TTN05', 560000, 0, NULL, N'Chưa thanh toán'),
    (N'TTN06', 340000, 0, NULL, N'Chưa thanh toán'),
    (N'TTN07', 0, 60000, N'2026-09-01T09:05:00', N'Đã thanh toán');
GO

-- 14. THANH_TOAN_CHO: 9 bản ghi
INSERT INTO THANH_TOAN_CHO
    (MaKiemDinh, MaThanhToan)
VALUES
    (N'KD01', N'TTN01'),
    (N'KD01', N'TTN07'),
    (N'KD02', N'TTN02'),
    (N'KD03', N'TTN02'),
    (N'KD04', N'TTN03'),
    (N'KD05', N'TTN03'),
    (N'KD06', N'TTN04'),
    (N'KD07', N'TTN05'),
    (N'KD08', N'TTN06');
GO

-- 15. HOA_DON_DIEN_TU: 5 bản ghi
INSERT INTO HOA_DON_DIEN_TU
    (MaHoaDon, MaThanhToan, MaSoThueNguoiNhan, KyHieuHoaDon, MaTraCuu, TrangThaiHoaDon)
VALUES
    (N'HD01', N'TTN01', NULL, N'MAU26', N'TC00001', N'Đã phát hành'),
    (N'HD02', N'TTN02', NULL, N'MAU26', N'TC00002', N'Đã phát hành'),
    (N'HD03', N'TTN03', N'MST000003', N'MAU26', N'TC00003', N'Đã phát hành'),
    (N'HD04', N'TTN04', NULL, N'MAU26', N'TC00004', N'Đã phát hành'),
    (N'HD05', N'TTN07', NULL, N'MAU26', N'TC00005', N'Đã phát hành');
GO

-- 16. CHUNG_NHAN_KIEM_DINH: 5 bản ghi
INSERT INTO CHUNG_NHAN_KIEM_DINH
    (MaChungNhan, MaKiemDinh, MaChungNhanCu, SoChungNhan, NgayCap, NgayHetHan, TrangThai, NgayThayThe, LyDoThayThe)
VALUES
    (N'CN01', N'KD01', NULL, N'GCN00001', N'2026-09-01', N'2027-09-01', N'Đã thay thế', NULL, NULL),
    (N'CN02', N'KD03', NULL, N'GCN00002', N'2026-09-03', N'2027-09-03', N'Còn hiệu lực', NULL, NULL),
    (N'CN03', N'KD05', NULL, N'GCN00003', N'2026-09-06', N'2027-03-06', N'Còn hiệu lực', NULL, NULL),
    (N'CN04', N'KD06', NULL, N'GCN00004', N'2026-10-05', N'2027-10-05', N'Còn hiệu lực', NULL, NULL),
    (N'CN05', N'KD01', N'CN01', N'GCN00005', N'2026-09-15', N'2027-09-01', N'Còn hiệu lực', N'2026-09-15', N'Cấp lại do mất giấy');
GO

-- 17. TEM_KIEM_DINH: 5 bản ghi
INSERT INTO TEM_KIEM_DINH
    (MaTem, MaKiemDinh, MaTemCu, SoSeriTem, NgayCap, NgayHetHan, TrangThai, NgayThayThe, LyDoThayThe)
VALUES
    (N'TEM01', N'KD01', NULL, N'SERI00001', N'2026-09-01', N'2027-09-01', N'Đã thay thế', NULL, NULL),
    (N'TEM02', N'KD03', NULL, N'SERI00002', N'2026-09-03', N'2027-09-03', N'Còn hiệu lực', NULL, NULL),
    (N'TEM03', N'KD05', NULL, N'SERI00003', N'2026-09-06', N'2027-03-06', N'Còn hiệu lực', NULL, NULL),
    (N'TEM04', N'KD06', NULL, N'SERI00004', N'2026-10-05', N'2027-10-05', N'Còn hiệu lực', NULL, NULL),
    (N'TEM05', N'KD01', N'TEM01', N'SERI00005', N'2026-09-15', N'2027-09-01', N'Còn hiệu lực', N'2026-09-15', N'Thay tem bị hỏng');
GO

