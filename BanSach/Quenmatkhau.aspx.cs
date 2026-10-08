using System;
using System.Linq;

namespace bansach
{
    public partial class Quenmatkhau : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultButton = btnDoi.UniqueID;
        }

        protected void btnDoi_Click(object sender, EventArgs e)
        {
            lbloi.Text = "";
            lbthanhcong.Text = "";

            if (!Page.IsValid) return;

            var user = dc.TBL_TAIKHOANs.Where(u => u.TAIKHOAN == txtuser.Text).FirstOrDefault();
            if (user == null)
            {
                lbloi.Text = "Tên tài khoản không tồn tại!";
                return;
            }

            if (user.SDT != txtSDT.Text.Trim())
            {
                lbloi.Text = "Số điện thoại không đúng với tài khoản đã đăng ký!";
                return;
            }

            user.MATKHAU = txtpass.Text;
            dc.SubmitChanges();

            lbthanhcong.Text = "Đổi mật khẩu thành công!";
        }
    }
}
