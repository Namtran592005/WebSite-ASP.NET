using System;

namespace bansach
{
    public partial class Quanlybansach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TAIKHOAN"] == null)
                Response.Redirect("Dangnhap.aspx");
        }
    }
}
