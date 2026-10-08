using System;
using System.Linq;
using System.Web.UI;

namespace bansach
{
    public partial class Dangnhap : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultButton = btndangnhap.UniqueID;
        }

        protected void btndangnhap_Click(object sender, EventArgs e)
        {
            var user = dc.TBL_TAIKHOANs.Where(u => u.TAIKHOAN == txtuser.Text && u.MATKHAU == txtpass.Text).FirstOrDefault();

            if (user != null)
            {
                Session["TAIKHOAN"] = txtuser.Text;
                if (user.QUYEN == true)
                    Response.Redirect("Quanlybansach.aspx");
                else
                    Response.Redirect("Khachhang.aspx");
            }
            else
            {
                lbloi.Text = "Sai tên đăng nhập hoặc mật khẩu!";
            }
        }
    }
}