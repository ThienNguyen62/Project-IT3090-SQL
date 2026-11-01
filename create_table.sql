-- TẠO BẢNG CHO SQL SERVER
-- Tạo database DangKiemXeOTo theo tutorial.txt trước khi chạy file này.
-- Chỉ chạy một lần trên database chưa có các bảng bên dưới.
CREATE DangKiemCeOTO;
USE DangKiemXeOTo;
GO

-- 1. CHU_PHUONG_TIEN
CREATE TABLE CHU_PHUONG_TIEN (
    MaChuXe varchar(10) NOT NULL,
    TenChuXe nvarchar(150) NOT NULL,
    SoGiayToDinhDanh varchar(30) NOT NULL,
    DiaChi nvarchar(250) NOT NULL,
    SoDienThoai varchar(20) NOT NULL,
    LoaiChuXe nvarchar(20) NOT NULL,
    CONSTRAINT PK_CHU_PHUONG_TIEN PRIMARY KEY (MaChuXe),
    CONSTRAINT UQ_CHU_PHUONG_TIEN_SoGiayToDinhDanh UNIQUE (SoGiayToDinhDanh),
    CONSTRAINT CK_CHU_PHUONG_TIEN_LoaiChuXe CHECK (LoaiChuXe IN (N'Cá nhân', N'Tổ chức'))
);
GO

-- 2. PHUONG_TIEN
CREATE TABLE PHUONG_TIEN (
    MaPhuongTien varchar(10) NOT NULL,
    BienSo varchar(20) NOT NULL,
    SoKhung varchar(30) NOT NULL,
    SoMay varchar(30) NOT NULL,
    NhanHieu nvarchar(50) NOT NULL,
    LoaiPhuongTien nvarchar(50) NOT NULL,
    NamSanXuat smallint NOT NULL,
    CONSTRAINT PK_PHUONG_TIEN PRIMARY KEY (MaPhuongTien),
    CONSTRAINT UQ_PHUONG_TIEN_BienSo UNIQUE (BienSo),
    CONSTRAINT UQ_PHUONG_TIEN_SoKhung UNIQUE (SoKhung),
    CONSTRAINT UQ_PHUONG_TIEN_SoMay UNIQUE (SoMay),
    CONSTRAINT CK_PHUONG_TIEN_NamSanXuat CHECK (NamSanXuat BETWEEN 1886 AND 2100)
);
GO

-- 3. TRAM_DANG_KIEM
CREATE TABLE TRAM_DANG_KIEM (
    MaTram varchar(10) NOT NULL,
    TenTram nvarchar(150) NOT NULL,
    DiaChi nvarchar(250) NOT NULL,
    SoDienThoai varchar(20) NOT NULL,
    CONSTRAINT PK_TRAM_DANG_KIEM PRIMARY KEY (MaTram)
);
GO

-- 4. NHAN_VIEN
CREATE TABLE NHAN_VIEN (
    MaNhanVien varchar(10) NOT NULL,
    MaTram varchar(10) NOT NULL,
    HoTen nvarchar(100) NOT NULL,
    ChucVu nvarchar(50) NOT NULL,
    SoDienThoai varchar(20) NOT NULL,
    TrangThaiLamViec nvarchar(30) NOT NULL,
    CONSTRAINT PK_NHAN_VIEN PRIMARY KEY (MaNhanVien),
    CONSTRAINT FK_NHAN_VIEN_MaTram
        FOREIGN KEY (MaTram) REFERENCES TRAM_DANG_KIEM (MaTram)
);
GO

-- 5. DAY_CHUYEN_KIEM_DINH
CREATE TABLE DAY_CHUYEN_KIEM_DINH (
    MaDayChuyen varchar(10) NOT NULL,
    MaTram varchar(10) NOT NULL,
    TenDayChuyen nvarchar(100) NOT NULL,
    TrangThaiHoatDong nvarchar(30) NOT NULL,
    CONSTRAINT PK_DAY_CHUYEN_KIEM_DINH PRIMARY KEY (MaDayChuyen),
    CONSTRAINT FK_DAY_CHUYEN_KIEM_DINH_MaTram
        FOREIGN KEY (MaTram) REFERENCES TRAM_DANG_KIEM (MaTram)
);
GO

-- 6. LICH_SU_SO_HUU
CREATE TABLE LICH_SU_SO_HUU (
    MaSoHuu varchar(10) NOT NULL,
    MaChuXe varchar(10) NOT NULL,
    MaPhuongTien varchar(10) NOT NULL,
    TuNgay date NOT NULL,
    DenNgay date NULL,
    CONSTRAINT PK_LICH_SU_SO_HUU PRIMARY KEY (MaSoHuu),
    CONSTRAINT CK_LICH_SU_SO_HUU_ThoiGian CHECK (DenNgay IS NULL OR DenNgay >= TuNgay),
    CONSTRAINT FK_LICH_SU_SO_HUU_MaChuXe
        FOREIGN KEY (MaChuXe) REFERENCES CHU_PHUONG_TIEN (MaChuXe),
    CONSTRAINT FK_LICH_SU_SO_HUU_MaPhuongTien
        FOREIGN KEY (MaPhuongTien) REFERENCES PHUONG_TIEN (MaPhuongTien)
);
GO

-- 7. TINH_TRANG_PHUONG_TIEN
CREATE TABLE TINH_TRANG_PHUONG_TIEN (
    MaTinhTrang varchar(10) NOT NULL,
    MaPhuongTien varchar(10) NOT NULL,
    LoaiTinhTrang nvarchar(100) NOT NULL,
    TrangThai nvarchar(30) NOT NULL,
    NgayBatDau date NOT NULL,
    NgayKetThuc date NULL,
    CONSTRAINT PK_TINH_TRANG_PHUONG_TIEN PRIMARY KEY (MaTinhTrang),
    CONSTRAINT CK_TINH_TRANG_PHUONG_TIEN_ThoiGian CHECK (NgayKetThuc IS NULL OR NgayKetThuc >= NgayBatDau),
    CONSTRAINT FK_TINH_TRANG_PHUONG_TIEN_MaPhuongTien
        FOREIGN KEY (MaPhuongTien) REFERENCES PHUONG_TIEN (MaPhuongTien)
);
GO

-- 8. LICH_HEN
CREATE TABLE LICH_HEN (
    MaLichHen varchar(10) NOT NULL,
    MaPhuongTien varchar(10) NOT NULL,
    KenhDatLich nvarchar(30) NOT NULL,
    TrangThai nvarchar(30) NOT NULL,
    TenNguoiDatLich nvarchar(100) NOT NULL,
    SoDienThoaiNguoiDatLich varchar(20) NOT NULL,
    ThoiDiemDatLich datetime2(0) NOT NULL,
    ThoiDiemHen datetime2(0) NOT NULL,
    CONSTRAINT PK_LICH_HEN PRIMARY KEY (MaLichHen),
    CONSTRAINT CK_LICH_HEN_ThoiGian CHECK (ThoiDiemHen >= ThoiDiemDatLich),
    CONSTRAINT FK_LICH_HEN_MaPhuongTien
        FOREIGN KEY (MaPhuongTien) REFERENCES PHUONG_TIEN (MaPhuongTien)
);
GO

-- 9. HO_SO_DANG_KIEM
CREATE TABLE HO_SO_DANG_KIEM (
    MaHoSo varchar(10) NOT NULL,
    MaPhuongTien varchar(10) NOT NULL,
    MaTram varchar(10) NOT NULL,
    ThoiDiemTiepNhan datetime2(0) NOT NULL,
    TrangThaiHoSo nvarchar(30) NOT NULL,
    CONSTRAINT PK_HO_SO_DANG_KIEM PRIMARY KEY (MaHoSo),
    CONSTRAINT FK_HO_SO_DANG_KIEM_MaPhuongTien
        FOREIGN KEY (MaPhuongTien) REFERENCES PHUONG_TIEN (MaPhuongTien),
    CONSTRAINT FK_HO_SO_DANG_KIEM_MaTram
        FOREIGN KEY (MaTram) REFERENCES TRAM_DANG_KIEM (MaTram)
);
GO

-- 10. LUOT_KIEM_DINH
CREATE TABLE LUOT_KIEM_DINH (
    MaKiemDinh varchar(10) NOT NULL,
    MaHoSo varchar(10) NOT NULL,
    MaDayChuyen varchar(10) NOT NULL,
    MaLichHen varchar(10) NULL,
    LoaiKiemDinh nvarchar(30) NOT NULL,
    ThoiGianKiemDinh datetime2(0) NOT NULL,
    CONSTRAINT PK_LUOT_KIEM_DINH PRIMARY KEY (MaKiemDinh),
    CONSTRAINT FK_LUOT_KIEM_DINH_MaHoSo
        FOREIGN KEY (MaHoSo) REFERENCES HO_SO_DANG_KIEM (MaHoSo),
    CONSTRAINT FK_LUOT_KIEM_DINH_MaDayChuyen
        FOREIGN KEY (MaDayChuyen) REFERENCES DAY_CHUYEN_KIEM_DINH (MaDayChuyen),
    CONSTRAINT FK_LUOT_KIEM_DINH_MaLichHen
        FOREIGN KEY (MaLichHen) REFERENCES LICH_HEN (MaLichHen)
);
GO

-- 11. HANG_MUC_KIEM_DINH
CREATE TABLE HANG_MUC_KIEM_DINH (
    MaHangMuc varchar(10) NOT NULL,
    TenHangMuc nvarchar(100) NOT NULL,
    NhomHangMuc nvarchar(100) NOT NULL,
    MoTaTieuChuan nvarchar(500) NOT NULL,
    CONSTRAINT PK_HANG_MUC_KIEM_DINH PRIMARY KEY (MaHangMuc)
);
GO

-- 12. CHI_TIET_KIEM_DINH
CREATE TABLE CHI_TIET_KIEM_DINH (
    MaChiTiet varchar(10) NOT NULL,
    MaKiemDinh varchar(10) NOT NULL,
    MaNhanVien varchar(10) NOT NULL,
    MaHangMuc varchar(10) NOT NULL,
    KetQua nvarchar(20) NOT NULL,
    GiaTriDo decimal(12,3) NULL,
    CONSTRAINT PK_CHI_TIET_KIEM_DINH PRIMARY KEY (MaChiTiet),
    CONSTRAINT UQ_CHI_TIET_KIEM_DINH_MaKiemDinh_MaHangMuc UNIQUE (MaKiemDinh, MaHangMuc),
    CONSTRAINT CK_CHI_TIET_KIEM_DINH_KetQua CHECK (KetQua IN (N'Đạt', N'Không đạt')),
    CONSTRAINT FK_CHI_TIET_KIEM_DINH_MaKiemDinh
        FOREIGN KEY (MaKiemDinh) REFERENCES LUOT_KIEM_DINH (MaKiemDinh),
    CONSTRAINT FK_CHI_TIET_KIEM_DINH_MaNhanVien
        FOREIGN KEY (MaNhanVien) REFERENCES NHAN_VIEN (MaNhanVien),
    CONSTRAINT FK_CHI_TIET_KIEM_DINH_MaHangMuc
        FOREIGN KEY (MaHangMuc) REFERENCES HANG_MUC_KIEM_DINH (MaHangMuc)
);
GO

-- 13. THANH_TOAN
CREATE TABLE THANH_TOAN (
    MaThanhToan varchar(10) NOT NULL,
    LePhiKiemDinh decimal(18,2) NOT NULL,
    PhiBaoTriDuongBo decimal(18,2) NOT NULL,
    ThoiGianNopPhi datetime2(0) NULL,
    TrangThai nvarchar(30) NOT NULL,
    CONSTRAINT PK_THANH_TOAN PRIMARY KEY (MaThanhToan),
    CONSTRAINT CK_THANH_TOAN_SoTien CHECK (LePhiKiemDinh >= 0 AND PhiBaoTriDuongBo >= 0),
    CONSTRAINT CK_THANH_TOAN_TrangThai CHECK (TrangThai IN (N'Đã thanh toán', N'Chưa thanh toán', N'Đã hủy')),
    CONSTRAINT CK_THANH_TOAN_NgayNop CHECK (TrangThai <> N'Đã thanh toán' OR ThoiGianNopPhi IS NOT NULL)
);
GO

-- 14. THANH_TOAN_CHO
CREATE TABLE THANH_TOAN_CHO (
    MaKiemDinh varchar(10) NOT NULL,
    MaThanhToan varchar(10) NOT NULL,
    CONSTRAINT PK_THANH_TOAN_CHO PRIMARY KEY (MaKiemDinh, MaThanhToan),
    CONSTRAINT FK_THANH_TOAN_CHO_MaKiemDinh
        FOREIGN KEY (MaKiemDinh) REFERENCES LUOT_KIEM_DINH (MaKiemDinh),
    CONSTRAINT FK_THANH_TOAN_CHO_MaThanhToan
        FOREIGN KEY (MaThanhToan) REFERENCES THANH_TOAN (MaThanhToan)
);
GO

-- 15. HOA_DON_DIEN_TU
CREATE TABLE HOA_DON_DIEN_TU (
    MaHoaDon varchar(10) NOT NULL,
    MaThanhToan varchar(10) NOT NULL,
    MaSoThueNguoiNhan varchar(20) NULL,
    KyHieuHoaDon varchar(20) NOT NULL,
    MaTraCuu varchar(50) NOT NULL,
    TrangThaiHoaDon nvarchar(30) NOT NULL,
    CONSTRAINT PK_HOA_DON_DIEN_TU PRIMARY KEY (MaHoaDon),
    CONSTRAINT UQ_HOA_DON_DIEN_TU_MaThanhToan UNIQUE (MaThanhToan),
    CONSTRAINT UQ_HOA_DON_DIEN_TU_MaTraCuu UNIQUE (MaTraCuu),
    CONSTRAINT FK_HOA_DON_DIEN_TU_MaThanhToan
        FOREIGN KEY (MaThanhToan) REFERENCES THANH_TOAN (MaThanhToan)
);
GO

-- 16. CHUNG_NHAN_KIEM_DINH
CREATE TABLE CHUNG_NHAN_KIEM_DINH (
    MaChungNhan varchar(10) NOT NULL,
    MaKiemDinh varchar(10) NOT NULL,
    MaChungNhanCu varchar(10) NULL,
    SoChungNhan varchar(30) NOT NULL,
    NgayCap date NOT NULL,
    NgayHetHan date NOT NULL,
    TrangThai nvarchar(30) NOT NULL,
    NgayThayThe date NULL,
    LyDoThayThe nvarchar(250) NULL,
    CONSTRAINT PK_CHUNG_NHAN_KIEM_DINH PRIMARY KEY (MaChungNhan),
    CONSTRAINT UQ_CHUNG_NHAN_KIEM_DINH_SoChungNhan UNIQUE (SoChungNhan),
    CONSTRAINT CK_CHUNG_NHAN_KIEM_DINH_HieuLuc CHECK (NgayHetHan >= NgayCap),
    CONSTRAINT CK_CHUNG_NHAN_KIEM_DINH_KhongTuThayThe CHECK (MaChungNhanCu IS NULL OR MaChungNhanCu <> MaChungNhan),
    CONSTRAINT FK_CHUNG_NHAN_KIEM_DINH_MaKiemDinh
        FOREIGN KEY (MaKiemDinh) REFERENCES LUOT_KIEM_DINH (MaKiemDinh),
    CONSTRAINT FK_CHUNG_NHAN_KIEM_DINH_MaChungNhanCu
        FOREIGN KEY (MaChungNhanCu) REFERENCES CHUNG_NHAN_KIEM_DINH (MaChungNhan)
);
GO

-- 17. TEM_KIEM_DINH
CREATE TABLE TEM_KIEM_DINH (
    MaTem varchar(10) NOT NULL,
    MaKiemDinh varchar(10) NOT NULL,
    MaTemCu varchar(10) NULL,
    SoSeriTem varchar(30) NOT NULL,
    NgayCap date NOT NULL,
    NgayHetHan date NOT NULL,
    TrangThai nvarchar(30) NOT NULL,
    NgayThayThe date NULL,
    LyDoThayThe nvarchar(250) NULL,
    CONSTRAINT PK_TEM_KIEM_DINH PRIMARY KEY (MaTem),
    CONSTRAINT UQ_TEM_KIEM_DINH_SoSeriTem UNIQUE (SoSeriTem),
    CONSTRAINT CK_TEM_KIEM_DINH_HieuLuc CHECK (NgayHetHan >= NgayCap),
    CONSTRAINT CK_TEM_KIEM_DINH_KhongTuThayThe CHECK (MaTemCu IS NULL OR MaTemCu <> MaTem),
    CONSTRAINT FK_TEM_KIEM_DINH_MaKiemDinh
        FOREIGN KEY (MaKiemDinh) REFERENCES LUOT_KIEM_DINH (MaKiemDinh),
    CONSTRAINT FK_TEM_KIEM_DINH_MaTemCu
        FOREIGN KEY (MaTemCu) REFERENCES TEM_KIEM_DINH (MaTem)
);
GO

-- Duy nhất cho quan hệ 1-1 tùy chọn: nhiều dòng được NULL,
-- nhưng mỗi mã khác NULL chỉ được tham chiếu một lần.
-- SQL Server cần chỉ mục UNIQUE có điều kiện cho trường hợp này.
-- Tất cả FOREIGN KEY đã được khai báo trong CREATE TABLE ở trên.
CREATE UNIQUE INDEX UX_LUOT_LichHen
    ON LUOT_KIEM_DINH (MaLichHen)
    WHERE MaLichHen IS NOT NULL;

CREATE UNIQUE INDEX UX_CHUNG_NHAN_BanCu
    ON CHUNG_NHAN_KIEM_DINH (MaChungNhanCu)
    WHERE MaChungNhanCu IS NOT NULL;

CREATE UNIQUE INDEX UX_TEM_BanCu
    ON TEM_KIEM_DINH (MaTemCu)
    WHERE MaTemCu IS NOT NULL;
GO

-- KetLuan là thuộc tính suy diễn trong báo cáo, tính từ kết quả chi tiết.
-- Đọc kết luận bằng view V_KET_LUAN_KIEM_DINH.
CREATE VIEW V_KET_LUAN_KIEM_DINH
AS
SELECT kd.MaKiemDinh,
       CASE
           WHEN COUNT(ct.MaChiTiet) = 0 THEN N'Chưa có kết quả'
           WHEN SUM(CASE WHEN ct.KetQua = N'Không đạt' THEN 1 ELSE 0 END) > 0
               THEN N'Không đạt'
           ELSE N'Đạt'
       END AS KetLuan
FROM LUOT_KIEM_DINH AS kd
LEFT JOIN CHI_TIET_KIEM_DINH AS ct ON ct.MaKiemDinh = kd.MaKiemDinh
GROUP BY kd.MaKiemDinh;
GO
