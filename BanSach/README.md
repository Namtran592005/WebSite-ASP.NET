<div align="center">

# BanSach — Online Bookstore

**ASP.NET Web Forms course project** — a single-store bookstore with a shopping cart, checkout and admin panel.

[![ASP.NET Web Forms](https://img.shields.io/badge/ASP.NET-Web%20Forms-512BD4?logo=dotnet&logoColor=white)](../)
[![.NET Framework](https://img.shields.io/badge/.NET%20Framework-4.8.1-512BD4?logo=dotnet&logoColor=white)](#)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-LocalDB-CC2927?logo=microsoftsqlserver&logoColor=white)](#)

**English** · [Tiếng Việt](README.vi.md) · [← Repository overview](../README.md)

</div>

---

## Features

**Storefront**

- Browse books by category, search books by title
- Book detail page, add to cart
- Shopping cart: change quantity, remove items
- Checkout and create an order with multiple line items
- Look up orders by phone number
- Register / Log in / Forgot password
- Customer page (driven by the signed-in account): profile + membership tier, spending stats, order history (filter by status, sorting), cancel unprocessed orders, re-order past orders, update contact info

**Administration**

- Book management: create / edit / delete, cover image upload
- Category and publisher management
- Order management: update order status, export invoice to TXT

**Access control:** the `QUYEN` column in `TBL_TAIKHOAN` (`1` = admin, `0` = customer). Seeded accounts: `admin/admin` and `user/user`.

---

## Screenshots

| Home | Cart | Checkout |
|:--:|:--:|:--:|
| ![](capmanhinh/trangchu.jpeg) | ![](capmanhinh/giohang.jpeg) | ![](capmanhinh/thanhtoan.jpeg) |

| Book detail | Search results | Order lookup |
|:--:|:--:|:--:|
| ![](capmanhinh/chitiet.jpeg) | ![](capmanhinh/ketquatimkiem.jpeg) | ![](capmanhinh/tracuu.jpeg) |

| Login | Register | Forgot password |
|:--:|:--:|:--:|
| ![](capmanhinh/dangnhap.jpeg) | ![](capmanhinh/dangky.jpeg) | ![](capmanhinh/quenmatkhau.jpeg) |

| Customer account | Invoice | Confirmation |
|:--:|:--:|:--:|
| ![](capmanhinh/khachhang.jpeg) | ![](capmanhinh/thongtindonhang.jpeg) | ![](capmanhinh/camon.jpeg) |

| Categories | Guide | Return policy |
|:--:|:--:|:--:|
| ![](capmanhinh/theloai.jpeg) | ![](capmanhinh/huongdan.jpeg) | ![](capmanhinh/chinhsachdoitra.jpeg) |

| Admin dashboard | Book management | Order management |
|:--:|:--:|:--:|
| ![](capmanhinh/quanlybansach.jpeg) | ![](capmanhinh/quanlysach.jpeg) | ![](capmanhinh/quanlybanhang.jpeg) |

| Add book | Edit book | |
|:--:|:--:|:--:|
| ![](capmanhinh/editsach-themsach.jpeg) | ![](capmanhinh/editsach-suasach.jpeg) | |

---

## Tech Stack

- ASP.NET Web Forms (.NET Framework 4.8.1)
- LINQ to SQL (`.dbml`)
- Bootstrap 5, Font Awesome 6.5
- SQL Server LocalDB `(localdb)\MSSQLLocalDB`

---

## Setup

1. Open `bansach.slnx` in Visual Studio 2022+ (**ASP.NET and web development** workload)
2. Create the `WEBBANSACH` database on `(localdb)\MSSQLLocalDB`:

   ```powershell
   sqlcmd -S "(localdb)\MSSQLLocalDB" -i dev\database.sql
   ```

   This creates all tables (`TBL_NXB`, `TBL_THELOAI`, `TBL_SACH`, `TBL_TAIKHOAN`, `TBL_HOADON`, `TBL_CHITIET_HOADON`) and seeds 8 publishers, 4 categories, 12 books and 2 accounts.

   > ⚠️ The script runs `CREATE DATABASE` without an `IF NOT EXISTS` guard — drop `WEBBANSACH` first if it already exists.

3. Verify the connection string matches in **both** places:
   - `Web.config` → `WEBBANSACHConnectionString`
   - `DatabaseConfig.cs` → `ConnectionString`

   ```csharp
   Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=WEBBANSACH;Integrated Security=True;
   ```

4. Build and run (**F5**). Default URL: `http://localhost:58043/`
5. Log in as `admin/admin`, then open `Quanlybansach.aspx` for the admin dashboard

---

## Project Layout

| Page | Purpose |
|:--|:--|
| `Site.Master` | Master page (layout, navbar, footer) |
| `trangchu.aspx` | Home page |
| `Theloai.aspx` | Books by category |
| `chitiet.aspx` | Book detail |
| `Ketquatimkiem.aspx` | Search results |
| `Giohang.aspx` | Shopping cart |
| `Thanhtoan.aspx` / `Camon.aspx` | Checkout / order confirmation |
| `tracuu.aspx` / `thongtindonhang.aspx` | Order lookup / invoice (+ TXT export) |
| `khachhang.aspx` | Customer account page |
| `Dangnhap.aspx` / `Dangky.aspx` / `Quenmatkhau.aspx` | Authentication |
| `Quanlybansach.aspx` | Admin dashboard |
| `Quanlysach.aspx` / `editsach.aspx` | Book list / create-edit (+ image upload) |
| `edittheloai.aspx` / `editnxb.aspx` | Category / publisher editor |
| `Quanlybanhang.aspx` | Order management |
| `DataClasses.dbml` | LINQ to SQL mapping |
| `DatabaseConfig.cs` | Connection string + `GetContext()` |
| `CartItem.cs` | Cart item model |

Uploaded covers go to `image/upload/`. TXT invoices are written to `hoadon/`, which is created at runtime and not committed.

---

## Notes

- Passwords are stored in **plain text** — coursework only; hash them before any real deployment.
- Admin pages check `Session["TAIKHOAN"]` but not the `QUYEN` role.
- `Web.config` sets `enableEventValidation="false"` — coursework only.
