<div align="center">

# Website ASP.NET

**A set of ASP.NET Web Forms course projects — Online Bookstore & News Portal**

[![.NET Framework](https://img.shields.io/badge/.NET%20Framework-4.8.1-512BD4?logo=dotnet&logoColor=white)](#)
[![ASP.NET Web Forms](https://img.shields.io/badge/ASP.NET-Web%20Forms-512BD4?logo=dotnet&logoColor=white)](#)
[![C#](https://img.shields.io/badge/C%23-239120?logo=csharp&logoColor=white)](#)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-LocalDB-CC2927?logo=microsoftsqlserver&logoColor=white)](#)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-5-7952B3?logo=bootstrap&logoColor=white)](#)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

**English** · [Tiếng Việt](README.vi.md)

</div>

---

## Overview

This repository contains **two independent websites**. Each one is its own ASP.NET Web Forms solution (no shared project). They use the same technology stack and each connects to its own SQL Server LocalDB database.

| Folder | Solution | Database | Description |
|:--|:--|:--|:--|
| [`BanSach/`](BanSach/) | `bansach.slnx` | `WEBBANSACH` | Online bookstore: shopping cart, checkout, order lookup, customer account page, admin panel |
| [`TinTuc/`](TinTuc/) | `bantin.slnx` | `TinTuc` | News portal with category pages: Economy, Sports, Society |

---

## Features

### 📚 Bookstore (`BanSach/`)

**Storefront**

- Browse books by category, search books by title
- Book detail page, add to cart
- Shopping cart: change quantity, remove items
- Checkout and create an order with multiple line items
- Look up orders by phone number
- Register / Log in / Forgot password
- Customer page: profile, membership tier, spending stats, order history (filter by status, sorting), cancel unprocessed orders, re-order past orders, update contact info

**Administration**

- Book management: create / edit / delete, cover image upload
- Category and publisher management
- Order management: update order status, export invoice to TXT

**Access control:** the `QUYEN` column in `TBL_TAIKHOAN` (`1` = admin, `0` = customer). Seeded accounts: `admin/admin` and `user/user`.

### 📰 News Portal (`TinTuc/`)

- Home page: latest articles (sorted by publish date) plus related articles
- Category pages for Economy / Sports / Society (two-column grid) plus related articles
- Article detail page: title, publish date, image with caption, summary, body
- Search articles by title (navbar search box plus a dedicated results page)
- Data comes from the `dbo.BanTin` table, categorized by `MaLinhVuc` (`KT`, `TT`, `XH`)

---

## Tech Stack

| Layer | Used |
|:--|:--|
| Language | C# |
| Framework | ASP.NET Web Forms — .NET Framework 4.8.1 |
| Data access | LINQ to SQL (`.dbml`) |
| Database | SQL Server LocalDB `(localdb)\MSSQLLocalDB` |
| UI | Bootstrap 5, Font Awesome 6.5 |
| Tooling | Visual Studio 2022+ (workload **ASP.NET and web development**), IIS Express |
| Compiler package | `Microsoft.CodeDom.Providers.DotNetCompilerPlatform` 2.0.1 (bundled in `packages/`) |

---

## Requirements

- **Windows**
- **Visual Studio 2022** (or newer) with the *ASP.NET and web development* workload
- **.NET Framework 4.8.1** Developer Pack
- **SQL Server Express LocalDB** (installs with Visual Studio, or from the SQL Server Express installer)
- **sqlcmd** to run the database scripts — or SQL Server Management Studio (SSMS) / Azure Data Studio to open and execute the `.sql` files

> Check whether LocalDB is installed:
> ```powershell
> sqllocaldb info
> ```

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Namtran592005/WebSite-ASP.NET.git
cd WebSite-ASP.NET
```

### 2. Create the databases

Each website has its own script in its `dev/` folder. Run it with `sqlcmd` (recommended), or open the file in SSMS / Azure Data Studio and press **Execute**.

**Bookstore**

```powershell
sqlcmd -S "(localdb)\MSSQLLocalDB" -i BanSach\dev\database.sql
```

This creates the `WEBBANSACH` database and the tables `TBL_NXB`, `TBL_THELOAI`, `TBL_SACH`, `TBL_TAIKHOAN`, `TBL_HOADON`, `TBL_CHITIET_HOADON`, then seeds sample data (8 publishers, 4 categories, 12 books, 2 accounts).

> ⚠️ The bookstore script calls `CREATE DATABASE` directly (no `IF NOT EXISTS` guard). If `WEBBANSACH` already exists, drop it first or you will get an error.

**News portal**

```powershell
sqlcmd -S "(localdb)\MSSQLLocalDB" -i TinTuc\dev\database.sql
```

This script is safe to run multiple times: it creates the `TinTuc` database if missing, creates `dbo.BanTin` if missing, then clears and re-seeds the sample data.

> 💡 If a backup file is available (`BanSach/dev/WEBBANSACH.bak` or `TinTuc/dev/TinTuc.bak`), you can restore it instead of running the script.

### 3. Check the connection strings

**Bookstore** — the connection string lives in two places and they must match:

- `BanSach/Web.config` → `WEBBANSACHConnectionString` / `WEBBANSACHConnectionString1`
- `BanSach/DatabaseConfig.cs` → `ConnectionString` (used by `DatabaseConfig.GetContext()`)

```csharp
Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=WEBBANSACH;Integrated Security=True;
```

**News portal** — in `TinTuc/Web.config`:

```xml
<add name="TinTucConnectionString"
     connectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=TinTuc;Integrated Security=True;TrustServerCertificate=True"
     providerName="System.Data.SqlClient" />
```

If you use SQL Server Express or another instance instead of LocalDB, change `Data Source` accordingly (for example `.\SQLEXPRESS`).

### 4. Build and run

1. Open the matching solution in Visual Studio:
   - `BanSach/bansach.slnx`
   - `TinTuc/bantin.slnx`
2. Right-click the project → **Set as Startup Project**
3. Press **F5** (IIS Express). The bookstore runs at `http://localhost:58043/` by default

If NuGet reports missing packages, run **Restore NuGet Packages**. The `packages/` folder already ships `DotNetCompilerPlatform` 2.0.1, so a restore is usually not required.

### 5. Access the admin panel (bookstore)

Log in with the admin account, then open:

| Page | Path |
|:--|:--|
| Sales dashboard | `Quanlybansach.aspx` |
| Book management | `Quanlysach.aspx` |
| Order management | `Quanlybanhang.aspx` |

Admin pages check `Session["TAIKHOAN"]` and redirect to the login page when the user is not signed in.

---

## Project Structure

```text
WebSite-ASP.NET/
├── README.md                       # English (default)
├── README.vi.md                    # Vietnamese
├── LICENSE                         # MIT License
├── .gitignore
├── BanSach/                        # Bookstore (solution bansach.slnx)
│   ├── README.md                   # English (project readme)
│   ├── README.vi.md                # Vietnamese (project readme)
│   ├── Site.Master                 # Master page (layout, navbar, footer)
│   ├── trangchu.aspx               # Home page
│   ├── Theloai.aspx                # Books by category
│   ├── chitiet.aspx                # Book detail
│   ├── Ketquatimkiem.aspx          # Search results
│   ├── Giohang.aspx                # Shopping cart
│   ├── Thanhtoan.aspx              # Checkout
│   ├── Camon.aspx                  # Order confirmation
│   ├── tracuu.aspx                 # Order lookup by phone number
│   ├── thongtindonhang.aspx        # Invoice / order detail (+ TXT export)
│   ├── khachhang.aspx              # Customer account page
│   ├── Dangnhap.aspx / Dangky.aspx / Quenmatkhau.aspx
│   ├── huongdan.aspx / chinhsachdoitra.aspx
│   ├── Quanlybansach.aspx          # Admin dashboard
│   ├── Quanlysach.aspx             # Book list (admin)
│   ├── editsach.aspx               # Create / edit book (+ image upload)
│   ├── edittheloai.aspx            # Create / edit category
│   ├── editnxb.aspx                # Create / edit publisher
│   ├── Quanlybanhang.aspx          # Order management
│   ├── DataClasses.dbml            # LINQ to SQL mapping
│   ├── DataClasses.designer.cs
│   ├── DatabaseConfig.cs           # Connection string + GetContext()
│   ├── CartItem.cs                 # Cart item model
│   ├── Web.config
│   ├── bootstrap/                  # Bootstrap 5 (bundle JS + CSS)
│   ├── fontawesome/                # Font Awesome 6.5
│   ├── image/                      # Banners, logo, book covers (image/upload)
│   ├── capmanhinh/                 # Screenshots
│   ├── dev/                        # database.sql + WEBBANSACH.bak
│   └── hoadon/                     # TXT invoices written at runtime (not committed)
└── TinTuc/                         # News portal (solution bantin.slnx)
    ├── README.md                   # English (project readme)
    ├── README.vi.md                # Vietnamese (project readme)
    ├── Site.Master                 # News master page
    ├── trangchu.aspx               # Home page
    ├── TrangKinhTe.aspx            # Economy category
    ├── TrangTheThao.aspx           # Sports category
    ├── TrangXaHoi.aspx             # Society category
    ├── BantinChitiet.aspx          # Article detail
    ├── timbantin.aspx              # Search page
    ├── ketquatimkiem.aspx          # Search results
    ├── DataClasses.dbml            # LINQ to SQL mapping (BanTin table)
    ├── Web.config                  # TinTucConnectionString
    ├── image/                      # Article images
    ├── capmanhinh/                 # Screenshots
    └── dev/                        # database.sql + TinTuc.bak
```

---

## Screenshots

### Bookstore

| Home | Cart | Checkout |
|:--:|:--:|:--:|
| ![](BanSach/capmanhinh/trangchu.jpeg) | ![](BanSach/capmanhinh/giohang.jpeg) | ![](BanSach/capmanhinh/thanhtoan.jpeg) |

| Book detail | Search results | Order lookup |
|:--:|:--:|:--:|
| ![](BanSach/capmanhinh/chitiet.jpeg) | ![](BanSach/capmanhinh/ketquatimkiem.jpeg) | ![](BanSach/capmanhinh/tracuu.jpeg) |

| Login | Register | Forgot password |
|:--:|:--:|:--:|
| ![](BanSach/capmanhinh/dangnhap.jpeg) | ![](BanSach/capmanhinh/dangky.jpeg) | ![](BanSach/capmanhinh/quenmatkhau.jpeg) |

| Customer account | Invoice | Confirmation |
|:--:|:--:|:--:|
| ![](BanSach/capmanhinh/khachhang.jpeg) | ![](BanSach/capmanhinh/thongtindonhang.jpeg) | ![](BanSach/capmanhinh/camon.jpeg) |

| Categories | Guide | Return policy |
|:--:|:--:|:--:|
| ![](BanSach/capmanhinh/theloai.jpeg) | ![](BanSach/capmanhinh/huongdan.jpeg) | ![](BanSach/capmanhinh/chinhsachdoitra.jpeg) |

| Admin dashboard | Book management | Order management |
|:--:|:--:|:--:|
| ![](BanSach/capmanhinh/quanlybansach.jpeg) | ![](BanSach/capmanhinh/quanlysach.jpeg) | ![](BanSach/capmanhinh/quanlybanhang.jpeg) |

| Add book | Edit book | |
|:--:|:--:|:--:|
| ![](BanSach/capmanhinh/editsach-themsach.jpeg) | ![](BanSach/capmanhinh/editsach-suasach.jpeg) | |

### News portal

| Home | Category |
|:--:|:--:|
| ![](TinTuc/capmanhinh/trangchu.jpg) | ![](TinTuc/capmanhinh/danhmuc.jpg) |

| Article detail | Search results |
|:--:|:--:|
| ![](TinTuc/capmanhinh/chitiet.jpg) | ![](TinTuc/capmanhinh/ketquatimkiem.jpg) |

---

## Development Notes

- **Passwords are stored in plain text** in `TBL_TAIKHOAN`. This is acceptable for coursework but must not be shipped to production. Hash passwords (BCrypt / PBKDF2) before any real deployment.
- Admin pages only check `Session["TAIKHOAN"]` and do not verify the `QUYEN` flag. Add a role check on every admin page before exposing the site publicly.
- Connection strings use **Integrated Security** (Windows Authentication); there is no dedicated SQL login.
- `BanSach/Web.config` sets `enableEventValidation="false"` — coursework use only.
- Uploaded book covers go to `image/upload/`; TXT invoices are written to the `hoadon/` folder. That folder is not committed — the app creates it on the first invoice export.
- To change the schema, edit the `.dbml` in Visual Studio (LINQ to SQL Designer) and update `dev/database.sql` to keep them in sync.

---

## License

This project is licensed under the [MIT License](LICENSE).

Copyright © 2026 [@Namtran592005](https://github.com/Namtran592005).
