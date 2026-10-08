using System;
using System.Linq;

namespace bansach
{
    public partial class tracuu : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();

        protected void btnTraCuu_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtSDT.Text))
            {
                lbloi.Text = "Vui lòng nhập số điện thoại!";
                gvDonHang.Visible = false;
                return;
            }

            var list = (from h in dc.TBL_HOADONs
                        where h.SDT.Contains(txtSDT.Text.Trim())
                        select new
                        {
                            MAHD = h.MAHD,
                            TENKHACHHANG = h.TENKHACHHANG,
                            SDT = h.SDT,
                            TONGTIEN = dc.TBL_CHITIET_HOADONs
                                .Where(ct => ct.MAHD == h.MAHD)
                                .Sum(ct => ct.THANHTIEN),
                            NGAYDAT = h.NGAYDAT,
                            TINHTRANG = h.TINHTRANG
                        })
                        .OrderByDescending(h => h.NGAYDAT)
                        .ToList();

            if (list.Count == 0)
            {
                lbloi.Text = "Không tìm thấy đơn hàng nào!";
                gvDonHang.Visible = false;
            }
            else
            {
                lbloi.Text = "";
                gvDonHang.DataSource = list;
                gvDonHang.DataBind();
                gvDonHang.Visible = true;
            }
        }
    }
}
