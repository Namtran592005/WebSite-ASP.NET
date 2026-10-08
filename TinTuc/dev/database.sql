-- =============================================
-- Database: TinTuc | Project: bantin (WebForms)
-- Server: (localdb)\MSSQLLocalDB
-- Chay: sqlcmd -S "(localdb)\MSSQLLocalDB" -i dev\database.sql
-- =============================================

IF DB_ID(N'TinTuc') IS NULL
    CREATE DATABASE TinTuc;
GO

USE TinTuc;
GO

IF OBJECT_ID(N'dbo.BanTin', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.BanTin (
        MaBanTin     CHAR(10)      NOT NULL PRIMARY KEY,
        TieuDe       NVARCHAR(255) NULL,
        NDTomTat     NVARCHAR(500) NULL,
        NoiDung      NVARCHAR(MAX) NULL,
        NgayDangTin  DATE          NULL,
        HinhAnh      VARCHAR(50)   NULL,
        ChuThichHinh NVARCHAR(100) NULL,
        MaLinhVuc    CHAR(10)      NULL  -- KT: Kinh te | TT: The thao | XH: Xa hoi
    );
END
GO

DELETE FROM dbo.BanTin;
GO

-- ============ KINH TE (KT) ============
INSERT INTO dbo.BanTin (MaBanTin, TieuDe, NDTomTat, NoiDung, NgayDangTin, HinhAnh, ChuThichHinh, MaLinhVuc) VALUES
('KT01', N'Giá vàng nhẫn lập đỉnh mới, vượt 128 triệu đồng mỗi lượng',
N'Lực cầu trú ẩn tăng mạnh khi USD suy yếu và giá vàng thế giới vượt 3.400 USD/ounce đã đẩy giá vàng nhẫn trong nước lên kỷ lục mới.',
N'Thị trường vàng trong nước sáng nay chứng kiến một phiên giao dịch đầy sôi động khi giá vàng nhẫn 9999 đồng loạt được các doanh nghiệp lớn điều chỉnh tăng từ 800.000 đến 1,2 triệu đồng mỗi lượng, chính thức vượt mốc 128 triệu đồng ở chiều bán ra. Đây là mức cao nhất trong lịch sử niêm yết.

Theo ghi nhận, giá vàng thế giới quy đổi hiện ở khoảng 105 triệu đồng mỗi lượng, thấp hơn giá trong nước gần 23 triệu đồng. Chênh lệch này nới rộng so với mức 18-19 triệu đồng của tháng trước, cho thấy yếu tố cung cầu nội địa đang chi phối mạnh hơn là giá quốc tế.

Đại diện một công ty vàng lớn tại TP.HCM cho biết, lực mua từ nhóm khách hàng cá nhân tăng đột biến trong 2 tuần qua, đặc biệt sau khi Ngân hàng Nhà nước phát tín hiệu tiếp tục giữ mặt bằng lãi suất thấp để hỗ trợ tăng trưởng. Nhiều nhà đầu tư chuyển một phần tiền gửi tiết kiệm sang vàng để phòng ngừa lạm phát.

Ở góc độ vĩ mô, chuyên gia kinh tế cho rằng đà tăng của vàng còn được hỗ trợ bởi xu hướng các ngân hàng trung ương trên thế giới tăng mua ròng vàng quý thứ 5 liên tiếp, cùng với bất ổn địa chính trị tại Trung Đông và châu Âu chưa hạ nhiệt. Dự báo trong ngắn hạn, giá vàng có thể còn rung lắc mạnh quanh vùng đỉnh, nhà đầu tư lướt sóng cần đặc biệt thận trọng vì chênh lệch mua bán đang bị nới lên 2,5-3 triệu đồng mỗi lượng.

Ngân hàng Nhà nước tiếp tục khuyến cáo người dân cân nhắc kỹ trước khi mua bán, tránh chạy theo tâm lý đám đông trong giai đoạn biến động mạnh.',
'2026-08-28', 'kt1.jpg', N'Khách hàng giao dịch vàng nhẫn tại cửa hàng', 'KT'),
('KT02', N'Xuất khẩu rau quả thu về hơn 5 tỷ USD sau 8 tháng, sầu riêng chiếm gần 40%',
N'Sầu riêng, thanh long và chuối tiếp tục là 3 mặt hàng chủ lực đưa kim ngạch rau quả Việt Nam tăng 22% so với cùng kỳ năm ngoái.',
N'Số liệu từ Bộ Nông nghiệp và Môi trường cho thấy, 8 tháng đầu năm 2026, kim ngạch xuất khẩu rau quả ước đạt 5,2 tỷ USD, tăng 22% so với cùng kỳ. Trong đó, sầu riêng đóng góp lớn nhất với gần 2 tỷ USD, tiếp theo là thanh long, chuối, xoài và mít.

Trung Quốc vẫn là thị trường lớn nhất, chiếm hơn 62% tổng kim ngạch. Đáng chú ý, xuất khẩu chính ngạch sầu riêng đông lạnh sang thị trường này tăng gấp 3 lần sau khi nghị định thư được ký bổ sung cuối năm 2025, mở ra dư địa rất lớn cho các vùng trồng Tây Nguyên và Đồng bằng sông Cửu Long.

Tuy nhiên, đi cùng với tăng trưởng là áp lực về kiểm dịch và mã số vùng trồng. Chỉ trong tháng 7, cơ quan chức năng đã cảnh báo 42 lô hàng bị trả về do dư lượng thuốc bảo vệ thực vật và truy xuất nguồn gốc không đạt. Hiệp hội Rau quả Việt Nam cho rằng, nếu không siết chặt quản lý từ khâu trồng đến đóng gói, uy tín của trái cây Việt sẽ bị ảnh hưởng nghiêm trọng.

Để giữ đà tăng trưởng bền vững, Bộ đặt mục tiêu cả năm đạt 8 tỷ USD, đồng thời đẩy mạnh đàm phán mở cửa thêm thị trường Mỹ cho chanh leo, bưởi da xanh và xúc tiến hệ thống kho lạnh, logistics tại Lạng Sơn, Lào Cai để giảm ùn tắc vào vụ cao điểm cuối năm.',
'2026-08-25', 'kt2.jpg', N'Sơ chế sầu riêng xuất khẩu tại Đắk Lắk', 'KT'),
('KT03', N'Chứng khoán vượt 1.700 điểm, thanh khoản bùng nổ gần 40.000 tỷ đồng',
N'Dòng tiền nội quay lại mạnh mẽ cùng với lực mua ròng của khối ngoại giúp VN-Index xác lập đỉnh lịch sử mới.',
N'Phiên giao dịch hôm nay khép lại với một cột mốc lịch sử khi VN-Index tăng gần 25 điểm, chính thức vượt 1.700 điểm lần đầu tiên. Thanh khoản trên HoSE bùng nổ với giá trị khớp lệnh đạt gần 40.000 tỷ đồng, cao nhất trong vòng 2 năm qua.

Động lực chính đến từ nhóm ngân hàng, chứng khoán và bất động sản. Hàng loạt mã vốn hóa lớn như VCB, BID, SSI, VND, DIG, PDR đều tăng trần hoặc cận trần với dư mua lớn. Khối ngoại cũng có phiên mua ròng thứ 7 liên tiếp với giá trị hơn 1.500 tỷ đồng, tập trung vào thép và bán lẻ.

Giới phân tích cho rằng, kỳ vọng nâng hạng thị trường từ cận biên lên mới nổi của FTSE vào tháng 9 tới, cộng với mặt bằng lãi suất thấp và lợi nhuận doanh nghiệp quý 2 tăng 18% toàn thị trường, đang tạo ra một chu kỳ tiền rẻ - lợi nhuận tốt hiếm có.

Tuy vậy, nhiều công ty chứng khoán cũng cảnh báo rủi ro điều chỉnh ngắn hạn khi chỉ số RSI đã vào vùng quá mua và margin toàn thị trường ở mức cao kỷ lục. Nhà đầu tư được khuyến nghị tránh mua đuổi giá xanh tím, ưu tiên cổ phiếu có nền tảng cơ bản tốt và giữ tỷ trọng tiền mặt hợp lý để đón những nhịp rung lắc.',
'2026-08-20', 'kt3.jpg', N'Bảng giá chứng khoán tăng mạnh trong phiên', 'KT');
GO

-- ============ THE THAO (TT) ============
INSERT INTO dbo.BanTin (MaBanTin, TieuDe, NDTomTat, NoiDung, NgayDangTin, HinhAnh, ChuThichHinh, MaLinhVuc) VALUES
('TT01', N'U23 Việt Nam ngược dòng nghẹt thở vào chung kết U23 Đông Nam Á',
N'Bị dẫn trước từ phút 12 nhưng thầy trò HLV Kim Sang-sik ghi 2 bàn trong hiệp 2 để thắng 2-1 đầy cảm xúc.',
N'Tối qua trên sân vận động Gelora, U23 Việt Nam đã có một trong những trận đấu cảm xúc nhất năm khi lội ngược dòng thắng 2-1 trước U23 Indonesia ở bán kết giải U23 Đông Nam Á.

Bị thủng lưới sớm từ phút 12 sau tình huống đá phạt góc, các cầu thủ trẻ Việt Nam gặp rất nhiều khó khăn trước lối chơi áp sát quyết liệt của đối thủ. Phải đến phút 58, từ đường chuyền xé cánh của Văn Khang, Quốc Việt băng vào đánh đầu gỡ hòa 1-1, thắp lại hy vọng.

Bàn thắng quyết định đến ở phút 84. Sau pha phối hợp trung lộ đẹp mắt, Văn Trường tung cú sút xa hiểm hóc ngoài vòng cấm, bóng đi găm vào góc cao khiến thủ môn đối phương chỉ biết đứng nhìn. Những phút cuối, thủ môn Trung Kiên có 2 pha cứu thua xuất sắc để bảo toàn chiến thắng.

Phát biểu sau trận, HLV Kim Sang-sik khen ngợi tinh thần không bỏ cuộc của học trò: Các cầu thủ đã chiến đấu như những chiến binh. Chúng tôi đến đây để vô địch. Đối thủ ở chung kết sẽ là U23 Thái Lan, trận đấu diễn ra vào 20h ngày 29/8 tới.',
'2026-08-27', 'tt1.jpg', N'Niềm vui của U23 Việt Nam sau bàn thắng', 'TT'),
('TT02', N'Ngoại hạng Anh: Arsenal thắng kịch tính ở phút 90+7 để giữ đỉnh bảng',
N'Bàn thắng muộn của Saka giúp Pháo thủ vượt qua Chelsea 3-2 trong trận derby London nghẹt thở.',
N'Rạng sáng nay, Emirates đã bùng nổ khi Arsenal đánh bại Chelsea 3-2 bằng bàn thắng ở phút 90+7 của Bukayo Saka, qua đó tiếp tục giữ vững ngôi đầu Ngoại hạng Anh sau vòng 3.

Trận đấu diễn ra với tốc độ chóng mặt. Arsenal vươn lên dẫn 2-0 chỉ sau 30 phút nhờ công của Havertz và Odegaard. Nhưng Chelsea cho thấy bản lĩnh khi Palmer lập cú đúp trong hiệp 2 để gỡ hòa 2-2 ở phút 78.

Khi tất cả nghĩ về một trận hòa, phút bù giờ thứ 7, từ pha phản công nhanh, Martinelli căng ngang để Saka đệm bóng cận thành ấn định 3-2. Cả cầu trường như nổ tung, HLV Arteta chạy dọc đường biên ăn mừng cuồng nhiệt.

Chiến thắng này giúp Arsenal có 9 điểm tuyệt đối, hơn Man City 2 điểm. Cuối tuần tới, Pháo thủ sẽ làm khách trên sân của Tottenham trong trận derby Bắc London được chờ đợi nhất mùa giải.',
'2026-08-24', 'tt2.jpg', N'Saka ăn mừng bàn thắng quyết định', 'TT'),
('TT03', N'Pickleball bùng nổ ở Việt Nam: Giải phong trào hút 2.000 vận động viên',
N'Từ môn thể thao mới lạ, pickleball đã trở thành trào lưu fitness số một tại Hà Nội và TP.HCM chỉ sau một năm.',
N'Cuối tuần qua tại cụm sân quận 2, TP.HCM, giải pickleball phong trào mở rộng đã thu hút hơn 2.000 vận động viên nghiệp dư từ 30 tỉnh thành, con số kỷ lục cho một môn thể thao mới du nhập vào Việt Nam chưa đầy 2 năm.

Pickleball ghi điểm nhờ luật chơi đơn giản, dụng cụ rẻ, sân nhỏ và phù hợp với mọi lứa tuổi, từ học sinh đến người trung niên. Chỉ cần 2 cây vợt và 1 quả bóng nhựa, nhóm 4 người đã có thể chơi trong 30 phút, tiêu hao năng lượng tương đương một set tennis.

Theo thống kê chưa đầy đủ, hiện cả nước có hơn 800 cụm sân pickleball, tăng gấp 5 lần so với đầu năm 2025. Giá thuê sân dao động 100.000-200.000 đồng/giờ, luôn kín lịch vào buổi tối và cuối tuần.

Cùng với phong trào, các giải chuyên nghiệp đầu tiên với tiền thưởng lên tới 500 triệu đồng cũng bắt đầu xuất hiện, hứa hẹn đưa pickleball Việt Nam sớm hòa nhập với đấu trường khu vực. Liên đoàn Cầu lông - Pickleball đang xây dựng hệ thống huấn luyện viên chuẩn quốc tế để phát triển bền vững.',
'2026-08-22', 'tt3.jpg', N'Vận động viên thi đấu pickleball phong trào', 'TT'),
('TT04', N'Chuyển nhượng: Tiền đạo 18 tuổi Việt kiều ký hợp đồng với CLB Bundesliga',
N'Thương vụ gây chấn động khi tài năng trẻ gốc Việt được đôn lên đội một và có điều khoản giải phóng 10 triệu euro.',
N'Thị trường chuyển nhượng châu Âu vừa ghi nhận một cột mốc lịch sử cho bóng đá Việt Nam khi tiền đạo 18 tuổi mang hai dòng máu Việt - Đức, Nguyễn Alexander, chính thức ký hợp đồng chuyên nghiệp 4 năm với một CLB đang chơi ở Bundesliga.

Alexander cao 1m86, thuận chân trái, nổi bật với tốc độ và khả năng dứt điểm đa dạng. Mùa trước trong màu áo U19, anh ghi 21 bàn sau 26 trận, lọt vào đội hình tiêu biểu của giải trẻ Đức. Điều khoản giải phóng của cầu thủ này được tiết lộ ở mức 10 triệu euro, cho thấy niềm tin rất lớn của đội bóng.

Chia sẻ với báo chí, Alexander cho biết luôn theo dõi đội tuyển Việt Nam và mơ một ngày được khoác áo quê hương của mẹ: Gia đình tôi rất tự hào. Nếu có cơ hội, tôi muốn cống hiến cho Việt Nam. Liên đoàn Bóng đá Việt Nam cũng xác nhận đang xúc tiến các thủ tục để cầu thủ này có quốc tịch Việt Nam trong thời gian sớm nhất, kịp dự SEA Games tới.',
'2026-08-18', 'tt4.jpg', N'Alexander trong buổi lễ ký hợp đồng', 'TT'),
('TT05', N'Marathon Hà Nội 2026 lập kỷ lục 15.000 runner, VĐV Kenya về nhất',
N'Dù thời tiết oi bức, giải chạy lớn nhất Thủ đô vẫn diễn ra thành công với cung đường mới qua Hồ Gươm - Hồ Tây.',
N'Sáng sớm hôm qua, 15.000 vận động viên đã đồng loạt xuất phát tại Quảng trường Đông Kinh Nghĩa Thục, khởi tranh giải Marathon Hà Nội mở rộng 2026. Đây là số lượng runner đông nhất trong lịch sử các giải chạy tại miền Bắc.

Ở cự ly 42km nam, VĐV Kiprop đến từ Kenya về nhất với thành tích 2 giờ 18 phút, bỏ xa người về nhì gần 3 phút. Ở nội dung nữ, tuyển thủ quốc gia Hoàng Thị Ngọc Hoa xuất sắc cán đích đầu tiên với thời gian 2 giờ 42 phút, khẳng định vị thế số một Đông Nam Á.

Ban tổ chức năm nay gây ấn tượng khi thiết kế cung đường mới khép kín qua 3 hồ lớn, đóng hoàn toàn 12 tuyến phố trung tâm và bố trí 15 trạm tiếp nước, y tế. Lực lượng tình nguyện viên lên tới 2.000 người.

Ngoài ý nghĩa thể thao, giải đấu còn quyên góp được hơn 3 tỷ đồng cho quỹ Vì người nghèo và trồng 10.000 cây xanh quanh Hồ Tây. Ban tổ chức đặt mục tiêu năm 2027 sẽ đón 20.000 runner và mời thêm các chân chạy elite châu Phi, Nhật Bản để nâng chuẩn quốc tế.',
'2026-08-15', 'tt5.jpg', N'Hàng nghìn VĐV xuất phát lúc rạng sáng', 'TT'),
('TT06', N'Nguyễn Thùy Linh vào tứ kết giải cầu lông vô địch thế giới',
N'Tay vợt số một Việt Nam thắng ngược hạt giống số 6 người Nhật Bản sau 3 set đầy bản lĩnh.',
N'Tối qua, cầu lông Việt Nam đón tin vui khi Nguyễn Thùy Linh xuất sắc đánh bại hạt giống số 6 Aya Ohori của Nhật Bản với tỷ số 2-1 (19-21, 21-16, 21-18) để lần đầu tiên trong sự nghiệp lọt vào tứ kết giải vô địch thế giới.

Set 1, Thùy Linh nhập cuộc hơi căng cứng và để đối thủ dẫn xa. Nhưng từ set 2, cô thay đổi chiến thuật, liên tục điều cầu sâu về cuối sân rồi bất ngờ bỏ nhỏ, khiến đối thủ hơn mình 5 bậc trên bảng xếp hạng hoàn toàn bị động. Set quyết định chứng kiến màn rượt đuổi nghẹt thở đến điểm 18-18, trước khi tay vợt Phú Thọ ghi 3 điểm liên tiếp bằng những pha đập cầu đầy uy lực.

Chiến thắng này giúp Thùy Linh chắc chắn lọt vào top 15 thế giới ở bảng xếp hạng tuần tới, vị trí cao nhất sự nghiệp. Đối thủ của cô ở tứ kết sẽ là hạt giống số 2 An Se-young người Hàn Quốc, thử thách cực đại nhưng cũng là cơ hội để tạo nên lịch sử.

Thùy Linh chia sẻ: Tôi không còn gì để mất, sẽ chơi hết mình vì màu cờ sắc áo. Trận tứ kết diễn ra vào 18h hôm nay và được trực tiếp trên các nền tảng thể thao.',
'2026-08-12', 'tt6.jpg', N'Thùy Linh ăn mừng chiến thắng lịch sử', 'TT');
GO

-- ============ XA HOI (XH) ============
INSERT INTO dbo.BanTin (MaBanTin, TieuDe, NDTomTat, NoiDung, NgayDangTin, HinhAnh, ChuThichHinh, MaLinhVuc) VALUES
('XH01', N'Tuyển sinh đại học 2026: Điểm chuẩn nhiều ngành hot giảm mạnh',
N'Phương thức xét điểm thi tốt nghiệp THPT có biến động lớn, ngành Sư phạm và Công nghệ thông tin vẫn dẫn đầu.',
N'Tối qua, hàng loạt trường đại học lớn trên cả nước đã công bố điểm chuẩn trúng tuyển đợt 1 theo phương thức xét điểm thi tốt nghiệp THPT năm 2026. Đúng như dự báo, phổ điểm năm nay có nhiều biến động khiến điểm chuẩn nhiều ngành giảm từ 1 đến 3 điểm so với năm ngoái.

Tại Đại học Bách khoa Hà Nội, ngành Khoa học máy tính vẫn cao nhất với 28,1 điểm, giảm 0,4 điểm. Trong khi đó, các ngành Kinh tế, Marketing của Đại học Kinh tế Quốc dân giảm mạnh 1,5-2 điểm, phổ biến ở mức 26-27 điểm. Ngược lại, nhóm ngành Sư phạm tiếp tục nóng lên nhờ chính sách miễn học phí và đảm bảo việc làm, Đại học Sư phạm Hà Nội lấy 29,3 điểm cho ngành Sư phạm Lịch sử, cao nhất cả nước.

Năm nay, tổng số thí sinh đăng ký xét tuyển đại học đạt hơn 730.000 em, nhưng chỉ tiêu chỉ khoảng 550.000. Bộ Giáo dục và Đào tạo lưu ý thí sinh trúng tuyển phải xác nhận nhập học trực tuyến trước 17h ngày 5/9, nếu không sẽ bị hủy kết quả. Thí sinh không trúng tuyển đợt 1 vẫn còn cơ hội xét tuyển bổ sung từ ngày 10/9 với hơn 100.000 chỉ tiêu, chủ yếu ở các trường ngoài công lập và ngành kỹ thuật, nông nghiệp.

Các chuyên gia tuyển sinh khuyên phụ huynh và thí sinh cần cân nhắc kỹ năng lực, sở thích và nhu cầu thị trường lao động, tránh chạy theo ngành hot một cách mù quáng dẫn đến thất nghiệp sau tốt nghiệp.',
'2026-08-26', 'xh1.jpg', N'Thí sinh xem điểm chuẩn tại trường', 'XH'),
('XH02', N'Cao tốc Bắc - Nam thông xe toàn tuyến, đi TP.HCM - Nha Trang chỉ còn 5 giờ',
N'Đoạn Quảng Ngãi - Bình Định cuối cùng được khánh thành giúp rút ngắn hành trình xuyên Việt xuống còn chưa đầy 30 giờ.',
N'Sáng nay, đoạn cao tốc Quảng Ngãi - Hoài Nhơn dài 88km, mảnh ghép cuối cùng của tuyến cao tốc Bắc - Nam phía Đông, đã chính thức thông xe. Như vậy sau hơn 6 năm thi công, toàn tuyến cao tốc dài 2.063km từ Lạng Sơn đến Cà Mau đã liền một dải.

Phát biểu tại lễ khánh thành, Thủ tướng nhấn mạnh đây là kỳ tích của ngành giao thông, giúp năng lực vận tải Bắc - Nam tăng gấp 3 lần, chi phí logistics giảm khoảng 15%. Cụ thể, hành trình TP.HCM - Nha Trang từ 8-9 giờ nay chỉ còn khoảng 5 giờ, Hà Nội - Vinh còn 3,5 giờ, xe khách xuyên Việt Hà Nội - TP.HCM rút xuống dưới 30 giờ thay vì 40 giờ như trước.

Dọc tuyến có 28 trạm dừng nghỉ, 15 trạm sạc xe điện và hệ thống thu phí không dừng ETC đồng bộ. Bộ Giao thông vận tải cho biết tốc độ tối đa giai đoạn đầu là 90km/h, sẽ nâng lên 120km/h sau khi hoàn thiện mở rộng lên 6 làn xe vào năm 2028.

Tuy nhiên, cơ quan chức năng cũng cảnh báo tình trạng xe dừng đỗ khẩn cấp sai quy định, chạy quá tốc độ trong những ngày đầu thông xe. Lực lượng CSGT sẽ tăng cường phạt nguội qua camera AI lắp dày đặc mỗi 5km để đảm bảo an toàn.',
'2026-08-21', 'xh2.jpg', N'Cao tốc Bắc - Nam ngày thông xe', 'XH'),
('XH03', N'Hà Nội chi hơn 1.000 tỷ đồng cải tạo Hồ Tây thành công viên văn hóa',
N'Dự án bao gồm đường đi bộ ven hồ 17km, quảng trường nhạc nước và hệ thống xử lý nước thải triệt để.',
N'UBND TP. Hà Nội vừa phê duyệt đồ án cải tạo toàn diện khu vực Hồ Tây với tổng vốn đầu tư hơn 1.000 tỷ đồng, biến nơi đây thành công viên văn hóa - sinh thái lớn nhất Thủ đô, dự kiến hoàn thành vào cuối năm 2027.

Điểm nhấn của dự án là tuyến đường đi bộ - xe đạp dài 17km ôm trọn mặt hồ, được lát đá tự nhiên, trồng thêm 5.000 cây xanh và lắp hệ thống chiếu sáng thông minh. Khu vực bán đảo Quảng An sẽ xây quảng trường nhạc nước sức chứa 10.000 người, trở thành điểm đến văn hóa về đêm mới.

Về môi trường, thành phố sẽ đầu tư 8 cống thu gom nước thải xung quanh hồ, dẫn về nhà máy xử lý Yên Xá, chấm dứt tình trạng xả thải trực tiếp gây ô nhiễm và cá chết hàng loạt như các năm trước. Chất lượng nước Hồ Tây được cam kết đạt chuẩn bơi lội sau năm 2027.

Người dân Thủ đô bày tỏ sự đồng tình cao, kỳ vọng Hồ Tây sẽ trở thành lá phổi xanh đúng nghĩa, tương tự như Hồ Gươm. Trong thời gian thi công, một số đoạn đường Trích Sài, Thanh Niên sẽ phân luồng vào cuối tuần để giảm ùn tắc.',
'2026-08-17', 'xh3.jpg', N'Phối cảnh Hồ Tây sau cải tạo', 'XH');
GO

SELECT MaBanTin, TieuDe, MaLinhVuc, NgayDangTin FROM dbo.BanTin ORDER BY NgayDangTin DESC;
GO
