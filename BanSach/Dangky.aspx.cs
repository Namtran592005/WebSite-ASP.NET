using System;
using System.Linq;
using System.Web.UI;

namespace bansach
{
    public partial class Dangky : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultButton = btndangky.UniqueID;
        }

        protected void btndangky_Click(object sender, EventArgs e)
        {
            string user = txtuser.Text;
            string pass = txtpass.Text;
            if (dc.TBL_TAIKHOANs.Any(u => u.TAIKHOAN == user))
            {
                lbloi.Text = "Đã có tên tài khoản này rồi!!!";
            }
            else
            {
                TBL_TAIKHOAN tk = new TBL_TAIKHOAN();
                tk.TAIKHOAN = user;
                tk.MATKHAU = pass;
                tk.HOTEN = txthoten.Text;
                tk.SDT = txtSDT.Text;
                tk.QUYEN = false;

                dc.TBL_TAIKHOANs.InsertOnSubmit(tk);
                dc.SubmitChanges();

                lbthanhcong.Text = "Đã đăng ký tài khoản thành công!";
            }

        }
    }
}