using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace bansach
{
    public partial class Quanlysach : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TAIKHOAN"] == null)
                Response.Redirect("Dangnhap.aspx");

            if (!IsPostBack)
            {
                LoadStats();
                BindGrids();
            }
        }

        private void LoadStats()
        {
            lblBooks.Text = dc.TBL_SACHes.Count().ToString();
            lblCats.Text = dc.TBL_THELOAIs.Count().ToString();
            lblPubs.Text = dc.TBL_NXBs.Count().ToString();
        }

        private void BindGrids()
        {
            gvSach.DataSource = dc.TBL_SACHes.OrderBy(s => s.MASACH).ToList();
            gvSach.DataBind();
            gvTheLoai.DataSource = dc.TBL_THELOAIs.OrderBy(t => t.MATL).ToList();
            gvTheLoai.DataBind();
            gvNXB.DataSource = dc.TBL_NXBs.OrderBy(n => n.MANXB).ToList();
            gvNXB.DataBind();
        }

        protected void gvSach_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSach.PageIndex = e.NewPageIndex;
            gvSach.DataSource = dc.TBL_SACHes.OrderBy(s => s.MASACH).ToList();
            gvSach.DataBind();
        }

        protected void gvTheLoai_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTheLoai.PageIndex = e.NewPageIndex;
            gvTheLoai.DataSource = dc.TBL_THELOAIs.OrderBy(t => t.MATL).ToList();
            gvTheLoai.DataBind();
        }

        protected void gvNXB_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvNXB.PageIndex = e.NewPageIndex;
            gvNXB.DataSource = dc.TBL_NXBs.OrderBy(n => n.MANXB).ToList();
            gvNXB.DataBind();
        }

        protected void gvSach_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string masach = gvSach.DataKeys[e.RowIndex].Value.ToString();
            var sach = dc.TBL_SACHes.FirstOrDefault(s => s.MASACH == masach);
            if (sach != null)
            {
                dc.TBL_SACHes.DeleteOnSubmit(sach);
                dc.SubmitChanges();
            }
            BindGrids();
            LoadStats();
        }

        protected void gvTheLoai_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string matl = gvTheLoai.DataKeys[e.RowIndex].Value.ToString();
            var tl = dc.TBL_THELOAIs.FirstOrDefault(t => t.MATL == matl);
            if (tl != null)
            {
                dc.TBL_THELOAIs.DeleteOnSubmit(tl);
                dc.SubmitChanges();
            }
            BindGrids();
            LoadStats();
        }

        protected void gvNXB_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string manxb = gvNXB.DataKeys[e.RowIndex].Value.ToString();
            var nxb = dc.TBL_NXBs.FirstOrDefault(n => n.MANXB == manxb);
            if (nxb != null)
            {
                dc.TBL_NXBs.DeleteOnSubmit(nxb);
                dc.SubmitChanges();
            }
            BindGrids();
            LoadStats();
        }
    }
}
