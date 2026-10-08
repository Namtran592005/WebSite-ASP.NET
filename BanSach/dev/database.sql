-- 1. Tạo cơ sở dữ liệu
CREATE DATABASE WEBBANSACH;
GO

USE WEBBANSACH;
GO

-- 2. Các bảng danh mục
CREATE TABLE TBL_NXB(
    MANXB char(5) NOT NULL PRIMARY KEY,
    TENNXB nvarchar(30),
    DIACHI nvarchar(30),
    DIENTHOAI char(15)
);

CREATE TABLE TBL_THELOAI(
    MATL char(10) NOT NULL PRIMARY KEY,
    TENTL nvarchar(50)
);

CREATE TABLE TBL_SACH(
    MASACH char(10) NOT NULL PRIMARY KEY,
    TENSACH nvarchar(100),
    HINHANH varchar(50),
    NGAYNHAP date,
    DONGIA money,
    MANXB char(5) FOREIGN KEY REFERENCES TBL_NXB(MANXB),
    MATL char(10) FOREIGN KEY REFERENCES TBL_THELOAI(MATL),
    MOTA nvarchar(1000)
);

-- 3. Bảng Tài khoản
CREATE TABLE TBL_TAIKHOAN (
    TAIKHOAN VARCHAR(50) PRIMARY KEY,
    MATKHAU VARCHAR(100),
    HOTEN NVARCHAR(50),
    SDT VARCHAR(15),
    QUYEN BIT DEFAULT 0
);

-- 4. Bảng Đơn hàng
CREATE TABLE TBL_HOADON(
    MAHD int IDENTITY(1,1) PRIMARY KEY,
    TENKHACHHANG nvarchar(50),
    SDT char(15),
    DIACHIGIAOHANG nvarchar(100),
    NGAYDAT datetime DEFAULT GETDATE(),
    TINHTRANG nvarchar(20) DEFAULT N'Chưa xử lý'
);

-- 5. Bảng Chi tiết đơn hàng
CREATE TABLE TBL_CHITIET_HOADON(
    MAHD int NOT NULL,
    MASACH char(10) NOT NULL,
    SOLUONG int,
    DONGIA money,
    THANHTIEN AS (SOLUONG * DONGIA) PERSISTED,
    PRIMARY KEY (MAHD, MASACH),
    FOREIGN KEY (MAHD) REFERENCES TBL_HOADON(MAHD),
    FOREIGN KEY (MASACH) REFERENCES TBL_SACH(MASACH)
);

-- 5. Insert dữ liệu
INSERT INTO TBL_NXB VALUES 
('NLDXH', N'Nhà xuất bản Lao động xã hội', N'Thành phố Vinh', '977976787'),
('NXBKD', N'Nhà xuất bản Kim Đồng', N'Thanh Hóa', '909123456'),
('NXBPN', N'Nhà xuất bản Phụ Nữ', N'Quảng Trị', '909876543'),
('NXBTC', N'Nhà xuất bản Tài chính', N'Đà Nẵng', '907667889'),
('NXBTH', N'Nhà xuất bản Tổng hợp', N'Cao Bằng', '978787878'),
('NXBTK', N'Nhà xuất bản Thống kê', N'TP. Hồ Chí Minh', '809678609'),
('NXBTN', N'Nhà xuất bản Thanh Niên', N'Bảo lộc, Lâm Đồng', '906071234'),
('NXBTR', N'Nhà xuất bản trẻ', N'Hà Nội', '908070605');

INSERT INTO TBL_THELOAI VALUES 
('TLTC', N'Tâm lý, Tình cảm'),
('VHXH', N'Văn hoá, Xã hội'),
('KHCN', N'Khoa học công nghệ'),
('VHVT', N'Văn học viễn tưởng');

INSERT INTO TBL_SACH VALUES 
('DS01', N'Lập trình web cơ bản với PHP và MySQL', 'Sach1.jpg', '2024/2/12', 120000, 'NXBKD', 'KHCN', N'Ứng dụng PHP và cơ sở dữ liệu MySQL phối hợp với nhau và vận dụng chúng trong các bài toán cụ thể. Để tạo ra một quyển sách có đầy đủ các yếu tố kiến thức về lập trình web. Nắm được các vấn đề cốt lõi trên, để dễ dàng mở rộng các kỹ năng PHP và MySQL. Cuốn sách bao gồm các kỹ năng chuyên nghiệp là những yếu tố rất cần cho công việc thực tế'),
('DS02', N'Lập trình web nâng cao với PHP và MySQL', 'Sach2.jpg', '2024/2/15', 140000, 'NLDXH', 'KHCN', N'Nếu như sách PHP và MySQL cơ bản chưa thật sự đủ đô với bạn. Thì hãy thử ngay bộ sách hướng dẫn lập trình web nâng cao nhé. Kỹ năng nâng cao liên quan tới cách xây dựng và bảo trì các website sử dụng PHP và MySQL. Nó sẽ bổ sung các kiến thức cao và rộng hơn. Nếu bạn đang muốn nâng cao trình độ bản thân thì đây là sự chọn hoàn hảo.'),
('DS03', N'Thiết Kế Web Với Dreamweaver', 'Sach3.jpg', '2024/3/17', 130000, 'NLDXH', 'KHCN', N'Dreamweaver bao gồm 13 bài học từ dễ đến nâng cao để mọi người dễ dàng lựa chọn. Sách lập trình web của nhà Dreamweaver đã được Adobe công nhận. Nó hướng dẫn những kỹ năng Dreamweaver thiết yếu.'),
('DS04', N'Bí quyết nuôi dạy con trai thành công', 'Sach4.jpg', '2024/3/19', 150000, 'NXBPN', 'TLTC', N'Trong mỗi vấn đề, các chuyên gia giáo dục đều phân tích nguyên nhân các hành vi của con trai, đồng thời giới thiệu những biện pháp giáo dục thích hợp.'),
('DS05', N'Bí quyết nuôi dạy con gái thành công', 'Sach5.jpg', '2024/4/1', 150000, 'NXBPN', 'TLTC', N'Trong mỗi vấn đề, các chuyên gia giáo dục đều phân tích nguyên nhân các hành vi của con gái, đồng thời giới thiệu những biện pháp giáo dục thích hợp.'),
('DS06', N'Học tập đúng cách', 'Sach6.jpg', '2024/4/1', 45000, 'NXBKD', 'VHXH', N'Hẳn ai cũng từng được nghe câu: "Học là bể khổ", muốn đạt được kết quả tốt cần phải chăm chỉ khổ luyện, cần cù bù thông minh, như vậy mới là phương pháp học tập đúng đắn'),
('DS07', N'Đất rừng phương Nam', 'Sach7.jpg', '2024/4/17', 50000, 'NXBKD', 'VHXH', N'Cuộc đời lưu lạc của chú bé An qua những miền đất rừng phương Nam thời kì đầu cuộc kháng chiến chống Pháp.'),
('DS08', N'Bán hàng cảm xúc', 'Sach8.jpg', '2024/2/20', 145000, 'NXBTN', 'TLTC', N'Cung cấp 12 chương với nhiều tuyệt chiêu và bí quyết để vượt qua rào cản của khách hàng, xây dựng niềm tin và tạo nhu cầu không thể từ chối.'),
('DS09', N'Cân bằng cảm xúc cả lúc bão giông', 'Sach9.jpg', '2024/5/30', 155000, 'NXBTN', 'TLTC', N'Cân bằng cảm xúc cả lúc bão giông là cuốn sách cực kì đáng để đọc, dành cho mọi lứa tuổi. Trong cuốn sách này, tác giả kể lại những câu chuyện'),
('DS10', N'Khí chất bao nhiêu hạnh phúc bấy nhiêu', 'Sach10.jpg', '2024/5/25', 135000, 'NXBTN', 'TLTC', N'Có ai đó từng nói: "Hãy sống như một trái dứa: Đầu đội vương miện, dáng đứng hiên ngang – Bên ngoài gai góc, bên trong ngọt ngào."'),
('DS11', N'Người máy có mơ về cừu điện không?', 'Sach11.jpg', '2024/5/22', 103000, 'NXBKD', 'VHVT', N'Người Máy Có Mơ Về Cừu Điện Không" là một cuốn sách nhất định phải đọc của một bậc thầy khoa học viễn tưởng ở thế kỉ 20 - Philip K.Dick. Cuốn tiểu thuyết bao gồm 22 chương nói về một thế giới sau Chiến tranh thế giới thứ 3 với nhiều biến đổi về khoa học, chính trị và xã hội. Nhân vật chính trong tác phẩm - Rick Deckard - người mang sứ mệnh tìm kiếm những người máy trốn thoát từ Sao Hỏa và đang ẩn náu tại Trái Đất. Từ đó, cuốn sách cất lên những vấn đề triết học đang cần lời giải thích: điều gì đã tạo nên yếu tố con người, người máy có cảm xúc không và con người nên nhìn nhận chúng như thế nào. Đây là một cuốn sách viễn tưởng mang hơi hướng triết học nhưng không hề khô khan mà ngược lại còn rất hấp dẫn và lôi cuốn.'),
('DS12', N'80 ngày vòng quanh thế giới', 'Sach12.jpg', '2024/4/18', 60000, 'NXBKD', 'VHVT', N'80 Ngày Vòng Quanh Thế Giới là một trong những tác phẩm tiêu biểu của Jules Verne. Đây là một cuốn tiểu thuyết khoa học viễn tưởng. "Viễn tưởng" ở chỗ nó đi trước thời gian, nó thực hiện một điều chưa thực hiện được vào thời điểm bấy giờ. Qua tác phẩm này, Jules Verne khẳng định sức mạnh của ý chí, tinh thần khoa học và những phẩm chất cao quý khác của con người, nuôi dưỡng trong chúng ta niềm tin ở khả năng con người làm chủ thiên nhiên.');

-- Thêm tài khoản admin (quyền 1)
INSERT INTO TBL_TAIKHOAN (TAIKHOAN, MATKHAU, HOTEN, SDT, QUYEN)
VALUES ('admin', 'admin', N'Quản trị viên', '0123456789', 1);

-- Thêm tài khoản user (quyền 0)
INSERT INTO TBL_TAIKHOAN (TAIKHOAN, MATKHAU, HOTEN, SDT, QUYEN)
VALUES ('user', 'user', N'Người dùng', '0987654321', 0);