# Bansach - Website bán sách trực tuyến

Project ASP.NET Web Forms (.NET Framework 4.8.1) - website bán sách với giỏ hàng đa mặt hàng.

## Chức năng chính

**Khách hàng:**
- Xem danh mục sách theo thể loại, tìm kiếm sách
- Xem chi tiết sách, thêm vào giỏ hàng
- Giỏ hàng đa mặt hàng (thay đổi số lượng, xoá)
- Thanh toán (tạo đơn hàng nhiều sản phẩm)
- Tra cứu đơn hàng theo số điện thoại
- Đăng ký / Đăng nhập / Quên mật khẩu
- Trang khách hàng (tự động theo tài khoản đăng nhập): hồ sơ + hạng thành viên, thống kê chi tiêu, lịch sử đơn hàng (lọc theo trạng thái, sắp xếp), huỷ đơn chưa xử lý, mua lại đơn cũ, cập nhật thông tin liên hệ

**Quản trị:**
- Quản lý sách (thêm/sửa/xoá, upload hình ảnh)
- Quản lý thể loại, nhà xuất bản
- Quản lý đơn hàng (cập nhật trạng thái, in hoá đơn TXT)

## Giao diện

Trang chủ | Giỏ hàng | Thanh toán
--- | --- | ---
![](capmanhinh/trangchu.jpeg) | ![](capmanhinh/giohang.jpeg) | ![](capmanhinh/thanhtoan.jpeg)

Chi tiết sách | Kết quả tìm kiếm | Tra cứu đơn hàng
--- | --- | ---
![](capmanhinh/chitiet.jpeg) | ![](capmanhinh/ketquatimkiem.jpeg) | ![](capmanhinh/tracuu.jpeg)

Đăng nhập | Đăng ký | Quên mật khẩu
--- | --- | ---
![](capmanhinh/dangnhap.jpeg) | ![](capmanhinh/dangky.jpeg) | ![](capmanhinh/quenmatkhau.jpeg)

Thông tin khách hàng | Hoá đơn | Cảm ơn
--- | --- | ---
![](capmanhinh/khachhang.jpeg) | ![](capmanhinh/thongtindonhang.jpeg) | ![](capmanhinh/camon.jpeg)

Phân loại sách | Hướng dẫn | Chính sách đổi trả
--- | --- | ---
![](capmanhinh/theloai.jpeg) | ![](capmanhinh/huongdan.jpeg) | ![](capmanhinh/chinhsachdoitra.jpeg)

Admin | Quản lý sách | Quản lý đơn hàng
--- | --- | ---
![](capmanhinh/quanlybansach.jpeg) | ![](capmanhinh/quanlysach.jpeg) | ![](capmanhinh/quanlybanhang.jpeg)

Thêm sách | Sửa sách |
--- | --- |
![](capmanhinh/editsach-themsach.jpeg) | ![](capmanhinh/editsach-suasach.jpeg)

## Công nghệ

- ASP.NET Web Forms (.NET Framework 4.8.1)
- LINQ to SQL
- Bootstrap 5, Font Awesome 6.5
- SQL Server (LocalDB)

## Cài đặt

1. Mở `bansach.slnx` trong Visual Studio
2. Tạo database `WEBBANSACH` trên `(localdb)\MSSQLLocalDB`
3. Chạy script SQL trong `dev/` để tạo bảng
4. Build và chạy (F5)
