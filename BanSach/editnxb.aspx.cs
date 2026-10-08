using System;
using System.Linq;

namespace bansach
{
    public partial class editnxb : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TAIKHOAN"] == null)
                Response.Redirect("Dangnhap.aspx");

            if (!IsPostBack)
            {
                string manxb = Request.QueryString["MANXB"];
                if (!string.IsNullOrEmpty(manxb))
                {
                    var nxb = dc.TBL_NXBs.FirstOrDefault(n => n.MANXB == manxb);
                    if (nxb != null)
                    {
                        txtMANXB.Text = nxb.MANXB;
                        txtMANXB.Enabled = false;
                        txtTENNXB.Text = nxb.TENNXB;
                        txtDIACHI.Text = nxb.DIACHI;
                        txtDIENTHOAI.Text = nxb.DIENTHOAI;
                        lblTitle.Text = "Sửa NXB";
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblError.Text = "";

            if (!Page.IsValid) return;

            string manxb = txtMANXB.Text.Trim();
            var existing = dc.TBL_NXBs.FirstOrDefault(n => n.MANXB == manxb);
            if (existing != null)
            {
                existing.TENNXB = txtTENNXB.Text.Trim();
                existing.DIACHI = txtDIACHI.Text.Trim();
                existing.DIENTHOAI = txtDIENTHOAI.Text.Trim();
                dc.SubmitChanges();
                lblMessage.Text = "Cập nhật thành công!";
            }
            else
            {
                if (dc.TBL_NXBs.Any(n => n.MANXB == manxb))
                {
                    lblError.Text = "Mã NXB đã tồn tại!";
                    return;
                }
                var nxb = new TBL_NXB
                {
                    MANXB = manxb,
                    TENNXB = txtTENNXB.Text.Trim(),
                    DIACHI = txtDIACHI.Text.Trim(),
                    DIENTHOAI = txtDIENTHOAI.Text.Trim()
                };
                dc.TBL_NXBs.InsertOnSubmit(nxb);
                dc.SubmitChanges();
                lblMessage.Text = "Thêm NXB thành công!";
                txtMANXB.Text = "";
                txtTENNXB.Text = "";
                txtDIACHI.Text = "";
                txtDIENTHOAI.Text = "";
            }
        }
    }
}
