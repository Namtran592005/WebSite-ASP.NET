<div align="center">

# BanSach — Website bán sách trực tuyến

**Bài tập ASP.NET Web Forms** — website bán sách một cửa hàng với giỏ hàng, thanh toán và trang quản trị.

[![ASP.NET Web Forms](https://img.shields.io/badge/ASP.NET-Web%20Forms-512BD4?logo=dotnet&logoColor=white)](../)
[![.NET Framework](https://img.shields.io/badge/.NET%20Framework-4.8.1-512BD4?logo=dotnet&logoColor=white)](#)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-LocalDB-CC2927?logo=microsoftsqlserver&logoColor=white)](#)

[English](README.md) · **Tiếng Việt** · [← Tổng quan repo](../README.vi.md)

</div>

---

## Chức năng

**Khách hàng**

- Xem danh mục sách theo thể loại, tìm kiếm sách theo tên
- Xem chi tiết sách, thêm vào giỏ hàng
- Giỏ hàng: thay đổi số lượng, xóa sản phẩm
- Thanh toán, tạo đơn hàng gồm nhiều sản phẩm
- Tra cứu đơn hàng theo số điện thoại
- Đăng ký / Đăng nhập / Quên mật khẩu
- Trang khách hàng (tự động theo tài khoản đăng nhập): hồ sơ + hạng thành viên, thống kê chi tiêu, lịch sử đơn hàng (lọc theo trạng thái, sắp xếp), hủy đơn chưa xử lý, mua lại đơn cũ, cập nhật thông tin liên hệ

**Quản trị**

- Quản lý sách: thêm / sửa / xóa, upload ảnh bìa
- Quản lý thể loại và nhà xuất bản
- Quản lý đơn hàng: cập nhật trạng thái, in hóa đơn (TXT)

**Phân quyền:** cột `QUYEN` trong `TBL_TAIKHOAN` (`1` = quản trị, `0` = khách hàng). Tài khoản mẫu: `admin/admin` và `user/user`.

---

## Giao diện

| Trang chủ | Giỏ hàng | Thanh toán |
|:--:|:--:|:--:|
| ![](capmanhinh/trangchu.jpeg) | ![](capmanhinh/giohang.jpeg) | ![](capmanhinh/thanhtoan.jpeg) |

| Chi tiết sách | Kết quả tìm kiếm | Tra cứu đơn hàng |
|:--:|:--:|:--:|
| ![](capmanhinh/chitiet.jpeg) | ![](capmanhinh/ketquatimkiem.jpeg) | ![](capmanhinh/tracuu.jpeg) |

| Đăng nhập | Đăng ký | Quên mật khẩu |
|:--:|:--:|:--:|
| ![](capmanhinh/dangnhap.jpeg) | ![](capmanhinh/dangky.jpeg) | ![](capmanhinh/quenmatkhau.jpeg) |

| Thông tin khách hàng | Hóa đơn | Cảm ơn |
|:--:|:--:|:--:|
| ![](capmanhinh/khachhang.jpeg) | ![](capmanhinh/thongtindonhang.jpeg) | ![](capmanhinh/camon.jpeg) |

| Phân loại sách | Hướng dẫn | Chính sách đổi trả |
|:--:|:--:|:--:|
| ![](capmanhinh/theloai.jpeg) | ![](capmanhinh/huongdan.jpeg) | ![](capmanhinh/chinhsachdoitra.jpeg) |

| Admin | Quản lý sách | Quản lý đơn hàng |
|:--:|:--:|:--:|
| ![](capmanhinh/quanlybansach.jpeg) | ![](capmanhinh/quanlysach.jpeg) | ![](capmanhinh/quanlybanhang.jpeg) |

| Thêm sách | Sửa sách | |
|:--:|:--:|:--:|
| ![](capmanhinh/editsach-themsach.jpeg) | ![](capmanhinh/editsach-suasach.jpeg) | |

---

## Công nghệ

- ASP.NET Web Forms (.NET Framework 4.8.1)
- LINQ to SQL (`.dbml`)
- Bootstrap 5, Font Awesome 6.5
- SQL Server LocalDB `(localdb)\MSSQLLocalDB`

---

## Cài đặt

1. Mở `bansach.slnx` bằng Visual Studio 2022+ (workload **ASP.NET and web development**)
2. Tạo database `WEBBANSACH` trên `(localdb)\MSSQLLocalDB`:

   ```powershell
   sqlcmd -S "(localdb)\MSSQLLocalDB" -i dev\database.sql
   ```

   Script tạo đủ các bảng (`TBL_NXB`, `TBL_THELOAI`, `TBL_SACH`, `TBL_TAIKHOAN`, `TBL_HOADON`, `TBL_CHITIET_HOADON`) và seed 8 nhà xuất bản, 4 thể loại, 12 sách, 2 tài khoản.

   > ⚠️ Script dùng `CREATE DATABASE` không có kiểm tra tồn tại — hãy xóa `WEBBANSACH` trước nếu nó đã có.

3. Kiểm tra connection string khớp ở **cả hai** nơi:
   - `Web.config` → `WEBBANSACHConnectionString`
   - `DatabaseConfig.cs` → `ConnectionString`

   ```csharp
   Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=WEBBANSACH;Integrated Security=True;
   ```

4. Build và chạy (**F5**). URL mặc định: `http://localhost:58043/`
5. Đăng nhập `admin/admin`, sau đó mở `Quanlybansach.aspx` để vào trang quản trị

---

## Cấu trúc trang

| Trang | Mục đích |
|:--|:--|
| `Site.Master` | Master page (layout, navbar, footer) |
| `trangchu.aspx` | Trang chủ |
| `Theloai.aspx` | Sách theo thể loại |
| `chitiet.aspx` | Chi tiết sách |
| `Ketquatimkiem.aspx` | Kết quả tìm kiếm |
| `Giohang.aspx` | Giỏ hàng |
| `Thanhtoan.aspx` / `Camon.aspx` | Thanh toán / xác nhận đặt hàng |
| `tracuu.aspx` / `thongtindonhang.aspx` | Tra cứu đơn hàng / hóa đơn (+ in TXT) |
| `khachhang.aspx` | Trang tài khoản khách hàng |
| `Dangnhap.aspx` / `Dangky.aspx` / `Quenmatkhau.aspx` | Đăng nhập / đăng ký / quên mật khẩu |
| `Quanlybansach.aspx` | Dashboard quản trị |
| `Quanlysach.aspx` / `editsach.aspx` | Danh sách sách / thêm-sửa sách (+ upload ảnh) |
| `edittheloai.aspx` / `editnxb.aspx` | Sửa thể loại / nhà xuất bản |
| `Quanlybanhang.aspx` | Quản lý đơn hàng |
| `DataClasses.dbml` | LINQ to SQL mapping |
| `DatabaseConfig.cs` | Connection string + `GetContext()` |
| `CartItem.cs` | Model item giỏ hàng |

Ảnh bìa upload vào `image/upload/`. Hóa đơn TXT ghi vào thư mục `hoadon/`, được tạo khi chạy và không commit.

---

## Lưu ý

- Mật khẩu lưu **dạng plain text** — chỉ dùng cho bài tập; phải hash trước khi triển khai thực tế.
- Trang quản trị kiểm tra `Session["TAIKHOAN"]` nhưng không kiểm tra quyền `QUYEN`.
- `Web.config` đặt `enableEventValidation="false"` — chỉ dùng cho bài tập.
