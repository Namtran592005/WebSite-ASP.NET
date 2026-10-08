using System;
using System.Linq;

namespace bansach
{
    public partial class chitiet : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadsachsach();
                loadsachnoibatkhac();
            }
        }

        private void loadsachsach()
        {
            var keyword = Request.QueryString["MASACH"];
            var s = (from sach in dc.TBL_SACHes
                     join theloai in dc.TBL_THELOAIs on sach.MATL equals theloai.MATL
                     join nxb in dc.TBL_NXBs on sach.MANXB equals nxb.MANXB
                     where sach.MASACH == keyword
                     orderby sach.NGAYNHAP descending
                     select new
                     {
                         sach.MASACH, sach.TENSACH, sach.HINHANH, sach.NGAYNHAP,
                         sach.DONGIA, sach.MANXB, sach.MATL, sach.MOTA,
                         TENTL = theloai.TENTL, TENNXB = nxb.TENNXB,
                         DIACHINXB = nxb.DIACHI, DIENTHOAI = nxb.DIENTHOAI
                     }).ToList();
            DataListChitiet.DataSource = s;
            DataListChitiet.DataBind();
        }

        private void loadsachnoibatkhac()
        {
            var s = dc.TBL_SACHes.OrderByDescending(u => u.NGAYNHAP).Take(4).ToList();
            DataListsachnbk.DataSource = s;
            DataListsachnbk.DataBind();
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string masach = Request.QueryString["MASACH"];
            var sach = dc.TBL_SACHes.FirstOrDefault(s => s.MASACH == masach);
            if (sach == null) return;

            var cart = CartItem.GetCart();
            var existing = cart.FirstOrDefault(c => c.MASACH == masach);
            if (existing != null)
            {
                existing.SOLUONG++;
            }
            else
            {
                cart.Add(new CartItem
                {
                    MASACH = sach.MASACH,
                    TENSACH = sach.TENSACH,
                    HINHANH = sach.HINHANH,
                    DONGIA = sach.DONGIA ?? 0,
                    SOLUONG = 1
                });
            }
            Response.Redirect("giohang.aspx");
        }
    }
}
