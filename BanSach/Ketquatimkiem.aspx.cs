using System;
using System.Linq;

namespace bansach
{
    public partial class Ketquatimkiem : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            loadsachketqua();
        }

        private void loadsachketqua()
        {
            try
            {
                var keyword = Request.QueryString["TENSACH"];

                if (string.IsNullOrEmpty(keyword))
                {
                    lbtensach.Text = "Vui lòng nhập tên sách";
                    DataListketqua.DataSource = null;
                    DataListketqua.DataBind();
                    return;
                }

                var s = (from sach in dc.TBL_SACHes
                         join theloai in dc.TBL_THELOAIs on sach.MATL equals theloai.MATL
                         join nxb in dc.TBL_NXBs on sach.MANXB equals nxb.MANXB
                         where sach.TENSACH.Contains(keyword)
                         orderby sach.NGAYNHAP descending
                         select new
                         {
                             sach.MASACH,
                             sach.TENSACH,
                             sach.HINHANH,
                             sach.NGAYNHAP,
                             sach.DONGIA,
                             sach.MANXB,
                             sach.MATL,
                             sach.MOTA,
                             TENTL = theloai.TENTL,
                             TENNXB = nxb.TENNXB,
                             DIACHINXB = nxb.DIACHI,
                             DIENTHOAI = nxb.DIENTHOAI
                         }).ToList();

                if (s.Count > 0)
                {
                    lbtensach.Text = "Kết quả tìm kiếm: " + s.Count + " sách cho từ khóa '" + keyword + "'";
                    DataListketqua.DataSource = s;
                    DataListketqua.DataBind();
                }
                else
                {
                    lbtensach.Text = "Không tìm thấy sách nào với từ khóa '" + keyword + "'";
                    DataListketqua.DataSource = null;
                    DataListketqua.DataBind();
                }
            }
            catch (Exception ex)
            {
                lbtensach.Text = "Có lỗi xảy ra: " + ex.Message;
                DataListketqua.DataSource = null;
                DataListketqua.DataBind();
            }
        }
    }
}
