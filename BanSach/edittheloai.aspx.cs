using System;
using System.Linq;

namespace bansach
{
    public partial class edittheloai : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TAIKHOAN"] == null)
                Response.Redirect("Dangnhap.aspx");

            if (!IsPostBack)
            {
                string matl = Request.QueryString["MATL"];
                if (!string.IsNullOrEmpty(matl))
                {
                    var tl = dc.TBL_THELOAIs.FirstOrDefault(t => t.MATL == matl);
                    if (tl != null)
                    {
                        txtMATL.Text = tl.MATL;
                        txtMATL.Enabled = false;
                        txtTENTL.Text = tl.TENTL;
                        lblTitle.Text = "Sửa thể loại";
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblError.Text = "";

            if (!Page.IsValid) return;

            string matl = txtMATL.Text.Trim();
            var existing = dc.TBL_THELOAIs.FirstOrDefault(t => t.MATL == matl);
            if (existing != null)
            {
                existing.TENTL = txtTENTL.Text.Trim();
                dc.SubmitChanges();
                lblMessage.Text = "Cập nhật thành công!";
            }
            else
            {
                if (dc.TBL_THELOAIs.Any(t => t.MATL == matl))
                {
                    lblError.Text = "Mã thể loại đã tồn tại!";
                    return;
                }
                var tl = new TBL_THELOAI
                {
                    MATL = matl,
                    TENTL = txtTENTL.Text.Trim()
                };
                dc.TBL_THELOAIs.InsertOnSubmit(tl);
                dc.SubmitChanges();
                lblMessage.Text = "Thêm thể loại thành công!";
                txtMATL.Text = "";
                txtTENTL.Text = "";
            }
        }
    }
}
