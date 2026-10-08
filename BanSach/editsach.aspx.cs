using System;
using System.IO;
using System.Linq;

namespace bansach
{
    public partial class editsach : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TAIKHOAN"] == null)
                Response.Redirect("Dangnhap.aspx");

            if (!IsPostBack)
            {
                LoadDropDowns();

                string masach = Request.QueryString["MASACH"];
                if (!string.IsNullOrEmpty(masach))
                {
                    LoadBook(masach);
                    lblTitle.Text = "Sửa sách";
                }
            }
        }

        private void LoadDropDowns()
        {
            ddlMANXB.DataSource = dc.TBL_NXBs.ToList();
            ddlMANXB.DataBind();
            ddlMANXB.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Chọn NXB --", ""));

            ddlMATL.DataSource = dc.TBL_THELOAIs.ToList();
            ddlMATL.DataBind();
            ddlMATL.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Chọn thể loại --", ""));
        }

        private void LoadBook(string masach)
        {
            var sach = dc.TBL_SACHes.FirstOrDefault(s => s.MASACH == masach);
            if (sach == null) return;

            txtMASACH.Text = sach.MASACH;
            txtMASACH.Enabled = false;
            txtTENSACH.Text = sach.TENSACH;
            txtNGAYNHAP.Text = sach.NGAYNHAP?.ToString("yyyy-MM-dd");
            txtDONGIA.Text = sach.DONGIA?.ToString("N0").Replace(",", "");
            ddlMANXB.SelectedValue = sach.MANXB ?? "";
            ddlMATL.SelectedValue = sach.MATL ?? "";
            txtMOTA.Text = sach.MOTA;

            if (!string.IsNullOrEmpty(sach.HINHANH))
            {
                hdfHINHANH.Value = sach.HINHANH;
                imgPreview.ImageUrl = "image/upload/" + sach.HINHANH;
                imgPreview.Visible = true;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblError.Text = "";

            if (!Page.IsValid) return;

            string masach = txtMASACH.Text.Trim();
            string tensach = txtTENSACH.Text.Trim();
            string hinhanh = hdfHINHANH.Value;

            if (fuHINHANH.HasFile)
            {
                string ext = Path.GetExtension(fuHINHANH.FileName).ToLower();
                string[] allowed = { ".jpg", ".jpeg", ".png", ".gif" };
                if (!allowed.Contains(ext))
                {
                    lblError.Text = "Chỉ chấp nhận file ảnh (.jpg, .png, .gif)!";
                    return;
                }
                string fileName = masach + ext;
                string savePath = Server.MapPath("~/image/upload/" + fileName);
                fuHINHANH.SaveAs(savePath);
                hinhanh = fileName;
            }

            DateTime? ngaynhap = null;
            if (!string.IsNullOrEmpty(txtNGAYNHAP.Text))
                ngaynhap = DateTime.Parse(txtNGAYNHAP.Text);

            decimal dongia = 0;
            decimal.TryParse(txtDONGIA.Text, out dongia);

            string manxb = ddlMANXB.SelectedValue;
            string matl = ddlMATL.SelectedValue;

            var existing = dc.TBL_SACHes.FirstOrDefault(s => s.MASACH == masach);
            if (existing != null)
            {
                existing.TENSACH = tensach;
                if (!string.IsNullOrEmpty(hinhanh)) existing.HINHANH = hinhanh;
                existing.NGAYNHAP = ngaynhap;
                existing.DONGIA = dongia;
                existing.MANXB = manxb;
                existing.MATL = matl;
                existing.MOTA = txtMOTA.Text;
                lblMessage.Text = "Cập nhật sách thành công!";
            }
            else
            {
                var sach = new TBL_SACH
                {
                    MASACH = masach,
                    TENSACH = tensach,
                    HINHANH = hinhanh,
                    NGAYNHAP = ngaynhap,
                    DONGIA = dongia,
                    MANXB = manxb,
                    MATL = matl,
                    MOTA = txtMOTA.Text
                };
                dc.TBL_SACHes.InsertOnSubmit(sach);
                dc.SubmitChanges();
                lblMessage.Text = "Thêm sách thành công!";
                ClearForm();
                return;
            }
            dc.SubmitChanges();
        }

        private void ClearForm()
        {
            txtMASACH.Text = "";
            txtMASACH.Enabled = true;
            txtTENSACH.Text = "";
            txtNGAYNHAP.Text = "";
            txtDONGIA.Text = "";
            ddlMANXB.SelectedIndex = 0;
            ddlMATL.SelectedIndex = 0;
            txtMOTA.Text = "";
            hdfHINHANH.Value = "";
            imgPreview.Visible = false;
        }
    }
}
