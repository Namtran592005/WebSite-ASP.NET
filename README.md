<div align="center">

# WebSite ASP.NET

**Bộ bài tập ASP.NET Web Forms — Website bán sách & Website tin tức**

![.NET Framework](https://img.shields.io/badge/.NET%20Framework-4.8.1-512BD4?logo=dotnet&logoColor=white)
![ASP.NET Web Forms](https://img.shields.io/badge/ASP.NET-Web%20Forms-512BD4?logo=dotnet&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL%20Server-LocalDB-CC2927?logo=microsoftsqlserver&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5-7952B3?logo=bootstrap&logoColor=white)
![License](https://img.shields.io/badge/license-Educational-lightgrey)

</div>

---

## Giới thiệu

Repo gồm **02 website độc lập**, mỗi website là một solution ASP.NET Web Forms riêng (không chia sẻ project), dùng chung stack công nghệ và cùng kết nối SQL Server LocalDB.

| Thư mục | Solution | Cơ sở dữ liệu | Mô tả |
|:--|:--|:--|:--|
| [`BanSach/`](BanSach/) | `bansach.slnx` | `WEBBANSACH` | Website bán sách trực tuyến: giỏ hàng, đặt hàng, tra cứu đơn, tài khoản khách hàng, trang quản trị |
| [`TinTuc/`](TinTuc/) | `bantin.slnx` | `TinTuc` | Website tin tức tổng hợp theo chuyên mục: Kinh tế, Thể thao, Xã hội |

---

## Tính năng

### 📚 Website bán sách (`BanSach/`)

**Khách hàng**

- Xem sách theo thể loại, tìm kiếm theo tên sách
- Xem chi tiết sách, thêm vào giỏ hàng
- Giỏ hàng: thay đổi số lượng, xóa sản phẩm
- Thanh toán, tạo đơn hàng gồm nhiều sản phẩm
- Tra cứu đơn hàng theo số điện thoại
- Đăng ký / Đăng nhập / Quên mật khẩu
- Trang khách hàng: hồ sơ, hạng thành viên, thống kê chi tiêu, lịch sử đơn hàng (lọc theo trạng thái, sắp xếp), hủy đơn chưa xử lý, mua lại đơn cũ, cập nhật thông tin liên hệ

**Quản trị**

- Quản lý sách: thêm / sửa / xóa, upload ảnh bìa
- Quản lý thể loại và nhà xuất bản
- Quản lý đơn hàng: cập nhật trạng thái, in hóa đơn (TXT)

**Phân quyền:** cột `QUYEN` trong `TBL_TAIKHOAN` (`1` = quản trị, `0` = khách hàng). Tài khoản mẫu: `admin/admin` và `user/user`.

### 📰 Website tin tức (`TinTuc/`)

- Trang chủ: tin mới nhất (sắp xếp theo ngày đăng) + tin liên quan
- Trang chuyên mục Kinh tế / Thể thao / Xã hội (lưới 2 cột) + tin liên quan
- Xem chi tiết bản tin: tiêu đề, ngày đăng, ảnh kèm chú thích, tóm tắt, nội dung
- Tìm kiếm bản tin theo tiêu đề (ô tìm kiếm trên navbar + trang kết quả)
- Dữ liệu lấy từ bảng `dbo.BanTin`, phân loại qua `MaLinhVuc` (`KT`, `TT`, `XH`)

---

## Công nghệ

| Thành phần | Sử dụng |
|:--|:--|
| Ngôn ngữ | C# |
| Framework | ASP.NET Web Forms — .NET Framework 4.8.1 |
| Truy cập dữ liệu | LINQ to SQL (`.dbml`) |
| CSDL | SQL Server LocalDB `(localdb)\MSSQLLocalDB` |
| Giao diện | Bootstrap 5, Font Awesome 6.5 |
| Công cụ | Visual Studio 2022+ (workload **ASP.NET and web development**), IIS Express |
| Compiler package | `Microsoft.CodeDom.Providers.DotNetCompilerPlatform` 2.0.1 (đã kèm trong `packages/`) |

---

## Yêu cầu môi trường

- **Windows**
- **Visual Studio 2022** (hoặc mới hơn) với workload *ASP.NET and web development*
- **.NET Framework 4.8.1** Developer Pack
- **SQL Server Express LocalDB** (đi kèm Visual Studio, hoặc cài từ SQL Server Express installer)
- **sqlcmd** để chạy script CSDL — hoặc dùng SQL Server Management Studio (SSMS) / Azure Data Studio để chạy file `.sql`

> Kiểm tra LocalDB đã cài chưa:
> ```powershell
> sqllocaldb info
> ```

---

## Cài đặt

### 1. Clone repo

```bash
git clone https://github.com/Namtran592005/WebSite-ASP.NET.git
cd WebSite-ASP.NET
```

### 2. Tạo cơ sở dữ liệu

Mỗi website có script riêng trong thư mục `dev/`. Có thể chạy bằng `sqlcmd` (khuyến nghị) hoặc mở file trong SSMS / Azure Data Studio và bấm **Execute**.

**Website bán sách**

```powershell
sqlcmd -S "(localdb)\MSSQLLocalDB" -i BanSach\dev\database.sql
```

Script sẽ tạo database `WEBBANSACH`, các bảng `TBL_NXB`, `TBL_THELOAI`, `TBL_SACH`, `TBL_TAIKHOAN`, `TBL_HOADON`, `TBL_CHITIET_HOADON` và seed dữ liệu mẫu (8 NXB, 4 thể loại, 12 sách, 2 tài khoản).

> ⚠️ Script bán sách dùng `CREATE DATABASE` trực tiếp (không có `IF NOT EXISTS`). Nếu đã tồn tại database `WEBBANSACH`, hãy xóa trước hoặc chạy lại sau khi `DROP DATABASE WEBBANSACH;`.

**Website tin tức**

```powershell
sqlcmd -S "(localdb)\MSSQLLocalDB" -i TinTuc\dev\database.sql
```

Script an toàn khi chạy nhiều lần: tạo database `TinTuc` nếu chưa có, tạo bảng `dbo.BanTin` nếu chưa có, sau đó xóa và seed lại dữ liệu mẫu.

> 💡 Nếu có sẵn file backup (`.bak`) trong `BanSach/dev/WEBBANSACH.bak` hoặc `TinTuc/dev/TinTuc.bak`, có thể restore thay vì chạy script.

### 3. Kiểm tra connection string

**Bán sách** — chuỗi kết nối nằm ở 2 nơi, cần khớp nhau:

- `BanSach/Web.config` → `WEBBANSACHConnectionString` / `WEBBANSACHConnectionString1`
- `BanSach/DatabaseConfig.cs` → `ConnectionString` (dùng bởi `DatabaseConfig.GetContext()`)

```csharp
Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=WEBBANSACH;Integrated Security=True;
```

**Tin tức** — trong `TinTuc/Web.config`:

```xml
<add name="TinTucConnectionString"
     connectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=TinTuc;Integrated Security=True;TrustServerCertificate=True"
     providerName="System.Data.SqlClient" />
```

Nếu dùng SQL Server Express / instance khác thay cho LocalDB, sửa `Data Source` tương ứng (ví dụ `.\SQLEXPRESS`).

### 4. Mở và chạy

1. Mở solution tương ứng bằng Visual Studio:
   - `BanSach/bansach.slnx`
   - `TinTuc/bantin.slnx`
2. Chuột phải project → **Set as Startup Project**
3. Nhấn **F5** (IIS Express). Bán sách chạy mặc định tại `http://localhost:58043/`

Nếu NuGet báo thiếu package, chạy **Restore NuGet Packages** (project đã có sẵn thư mục `packages/` với `DotNetCompilerPlatform` 2.0.1 nên thường không cần tải thêm).

### 5. Vào trang quản trị (bán sách)

Đăng nhập bằng tài khoản quản trị, sau đó truy cập:

| Trang | Đường dẫn |
|:--|:--|
| Quản lý bán sách | `Quanlybansach.aspx` |
| Quản lý sách | `Quanlysach.aspx` |
| Quản lý đơn hàng | `Quanlybanhang.aspx` |

Các trang quản trị kiểm tra `Session["TAIKHOAN"]`; nếu chưa đăng nhập sẽ bị chuyển về trang đăng nhập.

---

## Cấu trúc repo

```text
WebSite-ASP.NET/
├── README.md
├── .gitignore
├── BanSach/                        # Website bán sách (solution bansach.slnx)
│   ├── Site.Master                 # Master page (layout, navbar, footer)
│   ├── trangchu.aspx               # Trang chủ
│   ├── Theloai.aspx                # Sách theo thể loại
│   ├── chitiet.aspx                # Chi tiết sách
│   ├── Ketquatimkiem.aspx          # Kết quả tìm kiếm
│   ├── Giohang.aspx                # Giỏ hàng
│   ├── Thanhtoan.aspx              # Thanh toán
│   ├── Camon.aspx                  # Xác nhận đặt hàng
│   ├── tracuu.aspx                 # Tra cứu đơn hàng theo SĐT
│   ├── thongtindonhang.aspx        # Hóa đơn / chi tiết đơn (+ in TXT)
│   ├── khachhang.aspx              # Trang tài khoản khách hàng
│   ├── Dangnhap.aspx / Dangky.aspx / Quenmatkhau.aspx
│   ├── huongdan.aspx / chinhsachdoitra.aspx
│   ├── Quanlybansach.aspx          # Dashboard quản trị
│   ├── Quanlysach.aspx             # Danh sách sách (admin)
│   ├── editsach.aspx               # Thêm / sửa sách (+ upload ảnh)
│   ├── edittheloai.aspx            # Thêm / sửa thể loại
│   ├── editnxb.aspx                # Thêm / sửa nhà xuất bản
│   ├── Quanlybanhang.aspx          # Quản lý đơn hàng
│   ├── DataClasses.dbml            # LINQ to SQL mapping
│   ├── DataClasses.designer.cs
│   ├── DatabaseConfig.cs           # Connection string + GetContext()
│   ├── CartItem.cs                 # Model item giỏ hàng
│   ├── Web.config
│   ├── bootstrap/                  # Bootstrap 5 (bundle JS + CSS)
│   ├── fontawesome/                # Font Awesome 6.5
│   ├── image/                      # Banner, logo, ảnh bìa sách (image/upload)
│   ├── capmanhinh/                 # Ảnh chụp màn hình
│   ├── dev/                        # database.sql + WEBBANSACH.bak
│   └── hoadon/                     # File hóa đơn TXT sinh khi in (không commit)
└── TinTuc/                         # Website tin tức (solution bantin.slnx)
    ├── Site.Master                 # Master page tin tức
    ├── trangchu.aspx               # Trang chủ
    ├── TrangKinhTe.aspx            # Chuyên mục Kinh tế
    ├── TrangTheThao.aspx           # Chuyên mục Thể thao
    ├── TrangXaHoi.aspx             # Chuyên mục Xã hội
    ├── BantinChitiet.aspx          # Chi tiết bản tin
    ├── timbantin.aspx              # Trang tìm kiếm
    ├── ketquatimkiem.aspx          # Kết quả tìm kiếm
    ├── DataClasses.dbml            # LINQ to SQL mapping (bảng BanTin)
    ├── Web.config                  # TinTucConnectionString
    ├── image/                      # Ảnh minh họa bản tin
    ├── capmanhinh/                 # Ảnh chụp màn hình
    └── dev/                        # database.sql + TinTuc.bak
```

---

## Giao diện

### Website bán sách

| Trang chủ | Giỏ hàng | Thanh toán |
|:--:|:--:|:--:|
| ![](BanSach/capmanhinh/trangchu.jpeg) | ![](BanSach/capmanhinh/giohang.jpeg) | ![](BanSach/capmanhinh/thanhtoan.jpeg) |

| Chi tiết sách | Kết quả tìm kiếm | Tra cứu đơn hàng |
|:--:|:--:|:--:|
| ![](BanSach/capmanhinh/chitiet.jpeg) | ![](BanSach/capmanhinh/ketquatimkiem.jpeg) | ![](BanSach/capmanhinh/tracuu.jpeg) |

| Đăng nhập | Đăng ký | Quên mật khẩu |
|:--:|:--:|:--:|
| ![](BanSach/capmanhinh/dangnhap.jpeg) | ![](BanSach/capmanhinh/dangky.jpeg) | ![](BanSach/capmanhinh/quenmatkhau.jpeg) |

| Thông tin khách hàng | Hóa đơn | Cảm ơn |
|:--:|:--:|:--:|
| ![](BanSach/capmanhinh/khachhang.jpeg) | ![](BanSach/capmanhinh/thongtindonhang.jpeg) | ![](BanSach/capmanhinh/camon.jpeg) |

| Phân loại sách | Hướng dẫn | Chính sách đổi trả |
|:--:|:--:|:--:|
| ![](BanSach/capmanhinh/theloai.jpeg) | ![](BanSach/capmanhinh/huongdan.jpeg) | ![](BanSach/capmanhinh/chinhsachdoitra.jpeg) |

| Admin | Quản lý sách | Quản lý đơn hàng |
|:--:|:--:|:--:|
| ![](BanSach/capmanhinh/quanlybansach.jpeg) | ![](BanSach/capmanhinh/quanlysach.jpeg) | ![](BanSach/capmanhinh/quanlybanhang.jpeg) |

| Thêm sách | Sửa sách | |
|:--:|:--:|:--:|
| ![](BanSach/capmanhinh/editsach-themsach.jpeg) | ![](BanSach/capmanhinh/editsach-suasach.jpeg) | |

### Website tin tức

| Trang chủ | Chuyên mục |
|:--:|:--:|
| ![](TinTuc/capmanhinh/trangchu.jpg) | ![](TinTuc/capmanhinh/danhmuc.jpg) |

| Chi tiết bản tin | Kết quả tìm kiếm |
|:--:|:--:|
| ![](TinTuc/capmanhinh/chitiet.jpg) | ![](TinTuc/capmanhinh/ketquatimkiem.jpg) |

---

## Lưu ý khi phát triển

- **Mật khẩu lưu dạng plain text** trong `TBL_TAIKHOAN` — phù hợp cho mục đích học tập, không dùng cho production. Nên hash mật khẩu (BCrypt / PBKDF2) trước khi triển khai thực tế.
- Mật khẩu không được kiểm tra ở trang quản trị ngoài `Session["TAIKHOAN"]` — cần bổ sung kiểm tra `QUYEN` ở mọi trang admin trước khi public.
- Connection string đăng nhập bằng **Integrated Security** (Windows Authentication), không có tài khoản SQL riêng.
- `BanSach/Web.config` đặt `enableEventValidation="false"` — chỉ dùng trong môi trường bài tập.
- Ảnh sách upload vào `image/upload/`, hóa đơn TXT ghi vào thư mục `hoadon/` (thư mục này chưa có sẵn, ứng dụng tự tạo khi in hóa đơn lần đầu và không được commit).
- Thay đổi schema: sửa `.dbml` trong Visual Studio (LINQ to SQL Designer) và cập nhật lại `dev/database.sql` để đồng bộ.

---

## Giấy phép

Dự án phục vụ mục đích học tập / bài tập môn học.
