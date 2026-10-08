using System;
using System.IO;
using System.Linq;
using System.Text;

namespace bansach
{
    public partial class thongtindonhang : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TAIKHOAN"] == null)
                Response.Redirect("Dangnhap.aspx");

            if (!IsPostBack)
            {
                string mahd = Request.QueryString["MAHD"];
                if (!string.IsNullOrEmpty(mahd))
                    LoadOrder(mahd);
            }
        }

        private void LoadOrder(string mahd)
        {
            int id;
            if (!int.TryParse(mahd, out id)) return;

            var hd = dc.TBL_HOADONs.FirstOrDefault(h => h.MAHD == id);
            if (hd == null) return;

            lblMAHD.Text = "HD" + hd.MAHD.ToString("D5");
            lblTenKH.Text = hd.TENKHACHHANG;
            lblSDT.Text = hd.SDT;
            lblDiaChi.Text = hd.DIACHIGIAOHANG;
            lblNgayDat.Text = hd.NGAYDAT?.ToString("yyyy-MM-dd HH:mm");
            ddlTinhTrang.SelectedValue = hd.TINHTRANG ?? "Chưa xử lý";
            lblTitle.Text = "Đơn hàng HD" + hd.MAHD.ToString("D5");

            var items = from ct in dc.TBL_CHITIET_HOADONs
                        join s in dc.TBL_SACHes on ct.MASACH equals s.MASACH
                        where ct.MAHD == id
                        select new
                        {
                            ct.MASACH,
                            s.TENSACH,
                            s.HINHANH,
                            ct.SOLUONG,
                            ct.DONGIA,
                            ct.THANHTIEN
                        };

            var itemList = items.ToList();

            rptItems.DataSource = itemList;
            rptItems.DataBind();

            lblTongTien.Text = string.Format("{0:N0} đ", itemList.Sum(i => i.THANHTIEN).GetValueOrDefault());
        }

        protected void btnInHoaDon_Click(object sender, EventArgs e)
        {
            lblInMsg.Text = "";
            string mahd = Request.QueryString["MAHD"];
            int id;
            if (!int.TryParse(mahd, out id)) return;

            var hd = dc.TBL_HOADONs.FirstOrDefault(h => h.MAHD == id);
            if (hd == null) return;

            var items = from ct in dc.TBL_CHITIET_HOADONs
                        join s in dc.TBL_SACHes on ct.MASACH equals s.MASACH
                        where ct.MAHD == id
                        select new
                        {
                            ct.MASACH,
                            s.TENSACH,
                            ct.SOLUONG,
                            ct.DONGIA,
                            ct.THANHTIEN
                        };

            var itemList = items.ToList();
            decimal tong = itemList.Sum(i => i.THANHTIEN).GetValueOrDefault();

            var sb = new StringBuilder();
            sb.AppendLine("========================================");
            sb.AppendLine("            HOÁ ĐƠN BÁN HÀNG            ");
            sb.AppendLine("========================================");
            sb.AppendLine();
            sb.AppendLine("Mã đơn hàng: HD" + hd.MAHD.ToString("D5"));
            sb.AppendLine("Ngày đặt:    " + (hd.NGAYDAT?.ToString("yyyy-MM-dd HH:mm") ?? ""));
            sb.AppendLine("Tình trạng:  " + (hd.TINHTRANG ?? "Chưa xử lý"));
            sb.AppendLine();
            sb.AppendLine("--- Thông tin khách hàng ---");
            sb.AppendLine("Khách hàng:  " + hd.TENKHACHHANG);
            sb.AppendLine("SĐT:         " + hd.SDT);
            sb.AppendLine("Địa chỉ:     " + hd.DIACHIGIAOHANG);
            sb.AppendLine();
            sb.AppendLine("--- Danh sách sản phẩm ---");
            sb.AppendLine();
            int stt = 0;
            foreach (var item in itemList)
            {
                stt++;
                sb.AppendLine(string.Format("{0}. {1}", stt, item.TENSACH));
                sb.AppendLine(string.Format("   Mã: {0} | SL: {1} | Đơn giá: {2:N0} đ", item.MASACH, item.SOLUONG, item.DONGIA));
                sb.AppendLine(string.Format("   Thành tiền: {0:N0} đ", item.THANHTIEN));
                sb.AppendLine();
            }
            sb.AppendLine("----------------------------------------");
            sb.AppendLine(string.Format("Tổng cộng: {0,35:N0} đ", tong));
            sb.AppendLine("========================================");
            sb.AppendLine("Cảm ơn quý khách đã mua hàng!");
            sb.AppendLine("Liên hệ: 0965530439");
            sb.AppendLine("Website: sachweb.vn");

            string dir = Server.MapPath("~/hoadon");
            if (!Directory.Exists(dir))
                Directory.CreateDirectory(dir);

            string fileName = "HD" + hd.MAHD.ToString("D5") + ".txt";
            string filePath = Path.Combine(dir, fileName);
            File.WriteAllText(filePath, sb.ToString(), Encoding.UTF8);

            lblInMsg.Text = "Đã tạo file: " + fileName;
        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            string mahd = Request.QueryString["MAHD"];
            int id;
            if (!int.TryParse(mahd, out id)) return;

            var hd = dc.TBL_HOADONs.FirstOrDefault(h => h.MAHD == id);
            if (hd == null) return;

            hd.TINHTRANG = ddlTinhTrang.SelectedValue;
            dc.SubmitChanges();

            lblStatusMsg.Text = "Đã cập nhật trạng thái!";
        }
    }
}