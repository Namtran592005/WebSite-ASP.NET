using System;
using System.Linq;

namespace bansach
{
    public partial class Theloai : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSach();
            }
        }

        protected void ddlSapXep_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSach();
        }

        private void LoadSach()
        {
            var matl = Request.QueryString["MATL"];

            if (string.IsNullOrEmpty(matl))
            {
                lbtentheloai.Text = "Vui lòng chọn thể loại";
                DataListsachtheloai.DataSource = null;
                DataListsachtheloai.DataBind();
                return;
            }

            var tl = dc.TBL_THELOAIs.FirstOrDefault(t => t.MATL == matl);
            if (tl == null)
            {
                lbtentheloai.Text = "Không tìm thấy thể loại";
                DataListsachtheloai.DataSource = null;
                DataListsachtheloai.DataBind();
                return;
            }

            lbtentheloai.Text = tl.TENTL;

            var query = dc.TBL_SACHes.Where(s => s.MATL == matl);
            var sort = ddlSapXep.SelectedValue;

            if (sort == "asc")
                query = query.OrderBy(s => s.DONGIA);
            else if (sort == "desc")
                query = query.OrderByDescending(s => s.DONGIA);
            else
                query = query.OrderByDescending(s => s.NGAYNHAP);

            var list = query.ToList();

            if (list.Count > 0)
            {
                DataListsachtheloai.DataSource = list;
                DataListsachtheloai.DataBind();
                lblNone.Visible = false;
            }
            else
            {
                DataListsachtheloai.DataSource = null;
                DataListsachtheloai.DataBind();
                lblNone.Text = "Chưa có sách nào trong thể loại này";
                lblNone.Visible = true;
            }
        }
    }
}
