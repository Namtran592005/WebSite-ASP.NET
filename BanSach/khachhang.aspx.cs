using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;

namespace bansach
{
    public partial class Khachhang : System.Web.UI.Page
    {
        private const int PageSize = 5;

        private string CurrentSDT
        {
            get { return ViewState["KH_SDT"] as string ?? ""; }
            set { ViewState["KH_SDT"] = value; }
        }

        private int PageIndex
        {
            get { return ViewState["KH_Page"] == null ? 0 : (int)ViewState["KH_Page"]; }
            set { ViewState["KH_Page"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadCurrentUser();
        }

        // SĐT lấy tự động từ tài khoản đăng nhập
        private void LoadCurrentUser()
        {
            lblMsg.Text = "";

            if (Session["TAIKHOAN"] == null)
            {
                pnlRequireLogin.Visible = true;
                pnlInfo.Visible = false;
                return;
            }

            pnlRequireLogin.Visible = false;
            string tk = Session["TAIKHOAN"].ToString();

            using (var dc = DatabaseConfig.GetContext())
            {
                var user = dc.TBL_TAIKHOANs.FirstOrDefault(u => u.TAIKHOAN == tk);
                if (user == null)
                {
                    pnlRequireLogin.Visible = true;
                    pnlInfo.Visible = false;
                    return;
                }

                if (string.IsNullOrWhiteSpace(user.SDT))
                {
                    // Chưa có SĐT: hiện hồ sơ + mở form bổ sung
                    CurrentSDT = "";
                    PageIndex = 0;
                    lblTen.Text = string.IsNullOrEmpty(user.HOTEN) ? tk : user.HOTEN;
                    lblTaiKhoan.Text = tk;
                    lblSDT.Text = "(chưa có)";
                    lblDiaChi.Text = "—";
                    lblAvatar.Text = GetInitial(lblTen.Text);
                    SetRank(0);
                    ResetStats();
                    txtEditTen.Text = user.HOTEN;
                    txtEditSDT.Text = "";
                    txtEditDiaChi.Text = "";
                    pnlEdit.Visible = true;
                    rptDonHang.DataSource = null;
                    rptDonHang.DataBind();
                    pnlEmpty.Visible = true;
                    pnlPaging.Visible = false;
                    pnlInfo.Visible = true;
                    lblMsg.Text = "Tài khoản chưa có số điện thoại. Vui lòng bổ sung để xem đơn hàng.";
                    return;
                }

                CurrentSDT = user.SDT.Trim();
                PageIndex = 0;
                BindOrders();
            }
        }

        // Lấy lại SĐT hiện tại từ DB (tránh dùng SĐT cũ sau khi đổi)
        private string RefreshSDT()
        {
            if (Session["TAIKHOAN"] == null) return "";
            string tk = Session["TAIKHOAN"].ToString();
            using (var dc = DatabaseConfig.GetContext())
            {
                var user = dc.TBL_TAIKHOANs.FirstOrDefault(u => u.TAIKHOAN == tk);
                if (user == null || string.IsNullOrWhiteSpace(user.SDT)) return "";
                CurrentSDT = user.SDT.Trim();
                return CurrentSDT;
            }
        }

        protected void ddlLoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            PageIndex = 0;
            RefreshSDT();
            BindOrders();
        }

        protected void ddlSapXep_SelectedIndexChanged(object sender, EventArgs e)
        {
            PageIndex = 0;
            RefreshSDT();
            BindOrders();
        }

        private void BindOrders()
        {
            string sdt = CurrentSDT;
            if (string.IsNullOrEmpty(sdt))
            {
                pnlInfo.Visible = true;
                return;
            }

            using (var dc = DatabaseConfig.GetContext())
            {
                var all = (from h in dc.TBL_HOADONs
                           where h.SDT != null && h.SDT.Trim() == sdt
                           select new
                           {
                               MAHD = h.MAHD,
                               TENKHACHHANG = h.TENKHACHHANG,
                               SDT = h.SDT,
                               DIACHIGIAOHANG = h.DIACHIGIAOHANG,
                               NGAYDAT = h.NGAYDAT,
                               TINHTRANG = h.TINHTRANG,
                               TONGTIEN = dc.TBL_CHITIET_HOADONs
                                   .Where(ct => ct.MAHD == h.MAHD)
                                   .Sum(ct => (decimal?)ct.THANHTIEN) ?? 0
                           }).ToList();

                string tk = Session["TAIKHOAN"] as string ?? "";

                if (all.Count == 0)
                {
                    var user = dc.TBL_TAIKHOANs.FirstOrDefault(u => u.TAIKHOAN == tk);
                    lblTen.Text = (user != null && !string.IsNullOrEmpty(user.HOTEN)) ? user.HOTEN : tk;
                    lblTaiKhoan.Text = tk;
                    lblSDT.Text = sdt;
                    lblDiaChi.Text = "—";
                    lblAvatar.Text = GetInitial(lblTen.Text);
                    SetRank(0);
                    ResetStats();
                    txtEditTen.Text = user != null ? user.HOTEN : lblTen.Text;
                    txtEditSDT.Text = sdt;
                    txtEditDiaChi.Text = "";
                    rptDonHang.DataSource = null;
                    rptDonHang.DataBind();
                    pnlEmpty.Visible = true;
                    pnlPaging.Visible = false;
                    pnlInfo.Visible = true;
                    return;
                }

                var newest = all.OrderByDescending(x => x.NGAYDAT).First();
                lblTen.Text = newest.TENKHACHHANG;
                lblTaiKhoan.Text = tk;
                lblSDT.Text = newest.SDT != null ? newest.SDT.Trim() : sdt;
                lblDiaChi.Text = newest.DIACHIGIAOHANG;
                lblAvatar.Text = GetInitial(newest.TENKHACHHANG);

                if (!pnlEdit.Visible)
                {
                    txtEditTen.Text = newest.TENKHACHHANG;
                    txtEditSDT.Text = sdt;
                    txtEditDiaChi.Text = newest.DIACHIGIAOHANG;
                }

                decimal tongTien = all.Sum(x => x.TONGTIEN);
                lblStatTongDon.Text = all.Count.ToString();
                lblStatTongTien.Text = string.Format("{0:N0} đ", tongTien);
                lblStatChoXuLy.Text = all.Count(x => x.TINHTRANG == "Chưa xử lý").ToString();
                lblStatHoanThanh.Text = all.Count(x => x.TINHTRANG == "Đã xử lý").ToString();
                SetRank(tongTien);

                var q = all.AsQueryable();
                string loc = ddlLoc.SelectedValue;
                if (!string.IsNullOrEmpty(loc))
                    q = q.Where(x => x.TINHTRANG == loc).AsQueryable();

                switch (ddlSapXep.SelectedValue)
                {
                    case "CUNHAT": q = q.OrderBy(x => x.NGAYDAT).AsQueryable(); break;
                    case "GIACAO": q = q.OrderByDescending(x => x.TONGTIEN).AsQueryable(); break;
                    case "GIATHAP": q = q.OrderBy(x => x.TONGTIEN).AsQueryable(); break;
                    default: q = q.OrderByDescending(x => x.NGAYDAT).AsQueryable(); break;
                }

                var filtered = q.ToList();
                int totalPages = (int)Math.Ceiling(filtered.Count / (double)PageSize);
                if (totalPages == 0) totalPages = 1;
                if (PageIndex >= totalPages) PageIndex = totalPages - 1;
                if (PageIndex < 0) PageIndex = 0;

                var page = filtered.Skip(PageIndex * PageSize).Take(PageSize).ToList();

                rptDonHang.DataSource = page;
                rptDonHang.DataBind();

                pnlEmpty.Visible = page.Count == 0;
                pnlPaging.Visible = filtered.Count > PageSize;
                lblPage.Text = "Trang " + (PageIndex + 1) + " / " + totalPages + " (" + filtered.Count + " đơn)";
                btnPrev.Enabled = PageIndex > 0;
                btnNext.Enabled = PageIndex < totalPages - 1;
                pnlInfo.Visible = true;
            }
        }

        private void ResetStats()
        {
            lblStatTongDon.Text = "0";
            lblStatTongTien.Text = "0 đ";
            lblStatChoXuLy.Text = "0";
            lblStatHoanThanh.Text = "0";
        }

        protected void rptDonHang_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item &&
                e.Item.ItemType != ListItemType.AlternatingItem)
                return;

            dynamic order = e.Item.DataItem;
            int mahd = (int)order.MAHD;
            var rptChiTiet = e.Item.FindControl("rptChiTiet") as Repeater;
            if (rptChiTiet == null) return;

            using (var dc = DatabaseConfig.GetContext())
            {
                var items = (from ct in dc.TBL_CHITIET_HOADONs
                             join s in dc.TBL_SACHes on ct.MASACH equals s.MASACH
                             where ct.MAHD == mahd
                             select new
                             {
                                 MASACH = ct.MASACH.Trim(),
                                 TENSACH = s.TENSACH,
                                 HINHANH = s.HINHANH,
                                 SOLUONG = ct.SOLUONG,
                                 DONGIA = ct.DONGIA,
                                 THANHTIEN = ct.THANHTIEN
                             }).ToList();
                rptChiTiet.DataSource = items;
                rptChiTiet.DataBind();
            }
        }

        protected void rptDonHang_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int mahd;
            if (!int.TryParse(e.CommandArgument.ToString(), out mahd)) return;

            using (var dc = DatabaseConfig.GetContext())
            {
                var hd = dc.TBL_HOADONs.FirstOrDefault(h => h.MAHD == mahd);
                if (hd == null) return;

                string sdt = hd.SDT != null ? hd.SDT.Trim() : "";
                if (sdt != CurrentSDT)
                {
                    lblMsg.Text = "Bạn không có quyền thao tác trên đơn này.";
                    return;
                }

                if (e.CommandName == "HuyDon")
                {
                    if (hd.TINHTRANG != "Chưa xử lý")
                    {
                        lblMsg.Text = "Chỉ huỷ được đơn đang \"Chưa xử lý\".";
                        return;
                    }
                    hd.TINHTRANG = "Đã huỷ";
                    dc.SubmitChanges();
                    lblMsg.CssClass = "form-success";
                    lblMsg.Text = "Đã huỷ đơn #HD" + mahd.ToString("D5") + ".";
                }
                else if (e.CommandName == "MuaLai")
                {
                    var items = (from ct in dc.TBL_CHITIET_HOADONs
                                 join s in dc.TBL_SACHes on ct.MASACH equals s.MASACH
                                 where ct.MAHD == mahd
                                 select new { ct.MASACH, s.TENSACH, s.HINHANH, s.DONGIA, ct.SOLUONG }).ToList();

                    var cart = CartItem.GetCart();
                    foreach (var it in items)
                    {
                        string masach = it.MASACH.Trim();
                        var line = cart.FirstOrDefault(c => c.MASACH.Trim() == masach);
                        if (line != null)
                            line.SOLUONG += it.SOLUONG ?? 1;
                        else
                            cart.Add(new CartItem
                            {
                                MASACH = masach,
                                TENSACH = it.TENSACH,
                                HINHANH = it.HINHANH,
                                DONGIA = it.DONGIA ?? 0,
                                SOLUONG = it.SOLUONG ?? 1
                            });
                    }
                    Response.Redirect("Giohang.aspx");
                    return;
                }
            }
            BindOrders();
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            if (PageIndex > 0) PageIndex--;
            BindOrders();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            PageIndex++;
            BindOrders();
        }

        protected void btnToggleEdit_Click(object sender, EventArgs e)
        {
            pnlEdit.Visible = !pnlEdit.Visible;
            btnToggleEdit.Text = pnlEdit.Visible ? "Ẩn" : "Cập nhật";
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            string ten = txtEditTen.Text != null ? txtEditTen.Text.Trim() : "";
            string sdtMoi = txtEditSDT.Text != null ? txtEditSDT.Text.Trim() : "";
            string diachi = txtEditDiaChi.Text != null ? txtEditDiaChi.Text.Trim() : "";

            if (string.IsNullOrWhiteSpace(ten))
            {
                lblEditMsg.CssClass = "form-error";
                lblEditMsg.Text = "Vui lòng nhập họ tên.";
                return;
            }
            if (!Regex.IsMatch(sdtMoi, @"^0\d{8,10}$"))
            {
                lblEditMsg.CssClass = "form-error";
                lblEditMsg.Text = "SĐT chưa đúng (bắt đầu bằng 0, 9–11 số).";
                return;
            }
            if (Session["TAIKHOAN"] == null)
            {
                lblEditMsg.CssClass = "form-error";
                lblEditMsg.Text = "Phiên đăng nhập hết hạn. Vui lòng đăng nhập lại.";
                return;
            }

            string tk = Session["TAIKHOAN"].ToString();
            string sdtCu = CurrentSDT;

            using (var dc = DatabaseConfig.GetContext())
            {
                var user = dc.TBL_TAIKHOANs.FirstOrDefault(u => u.TAIKHOAN == tk);
                if (user == null) return;
                user.HOTEN = ten;
                user.SDT = sdtMoi;
                dc.SubmitChanges();

                if (!string.IsNullOrEmpty(sdtCu))
                {
                    var donChuaXuLy = dc.TBL_HOADONs
                        .Where(h => h.SDT != null && h.SDT.Trim() == sdtCu && h.TINHTRANG == "Chưa xử lý").ToList();
                    foreach (var h in donChuaXuLy)
                    {
                        h.TENKHACHHANG = ten;
                        if (!string.IsNullOrEmpty(diachi)) h.DIACHIGIAOHANG = diachi;
                        if (sdtMoi != sdtCu) h.SDT = sdtMoi;
                    }
                    dc.SubmitChanges();
                }
            }

            CurrentSDT = sdtMoi;
            PageIndex = 0;
            lblEditMsg.CssClass = "form-success";
            lblEditMsg.Text = "Đã lưu thay đổi.";
            BindOrders();
        }

        protected string GetBadgeClass(object tinhtrang)
        {
            string s = tinhtrang as string ?? "";
            if (s == "Đã xử lý") return "kh-badge done";
            if (s == "Đã huỷ") return "kh-badge cancel";
            return "kh-badge pending";
        }

        private string GetInitial(string name)
        {
            if (string.IsNullOrWhiteSpace(name)) return "K";
            string[] parts = name.Trim().Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            if (parts.Length == 0) return "K";
            return parts[parts.Length - 1].Substring(0, 1).ToUpper();
        }

        private void SetRank(decimal tongTien)
        {
            if (tongTien >= 5000000) lblHang.Text = "Thành viên Kim cương";
            else if (tongTien >= 2000000) lblHang.Text = "Thành viên Vàng";
            else if (tongTien >= 500000) lblHang.Text = "Thành viên Bạc";
            else lblHang.Text = "Thành viên Đồng";
        }
    }
}
