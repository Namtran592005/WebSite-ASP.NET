using System;
using System.Linq;

namespace bansach
{
    public partial class Camon : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var mahd = Request.QueryString["MAHD"];
                var count = Request.QueryString["count"];

                if (string.IsNullOrEmpty(mahd))
                {
                    Response.Redirect("trangchu.aspx");
                    return;
                }

                int id;
                if (!int.TryParse(mahd, out id))
                {
                    Response.Redirect("trangchu.aspx");
                    return;
                }

                var hd = dc.TBL_HOADONs.FirstOrDefault(h => h.MAHD == id);
                if (hd == null)
                {
                    Response.Redirect("trangchu.aspx");
                    return;
                }

                lblMAHD.Text = "HD" + hd.MAHD.ToString("D5");
                lblCount.Text = count ?? "1";
                lblTenKH.Text = hd.TENKHACHHANG;
                lblSDT.Text = hd.SDT;

                var items = dc.TBL_CHITIET_HOADONs
                    .Where(ct => ct.MAHD == id)
                    .ToList();
                lblTongTien.Text = string.Format("{0:N0} đ", items.Sum(ct => ct.THANHTIEN).GetValueOrDefault());
                lblTrangThai.Text = "Chưa xử lý";
            }
        }
    }
}