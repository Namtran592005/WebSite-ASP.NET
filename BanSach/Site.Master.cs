using System;
using System.Linq;
using System.Web.UI;

namespace bansach
{
    public partial class Site : System.Web.UI.MasterPage
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TAIKHOAN"] != null)
            {
                HyperLink3.Visible = false;
                HyperLink4.Visible = false;
                btnDangXuat.Visible = true;
                hlUser.Visible = true;

                string tk = Session["TAIKHOAN"].ToString();
                var user = dc.TBL_TAIKHOANs.FirstOrDefault(u => u.TAIKHOAN == tk);
                if (user != null)
                {
                    lblGreeting.Text = "Xin chào, " + (user.HOTEN ?? tk);
                    hlUser.NavigateUrl = user.QUYEN == true ? "~/Quanlybansach.aspx" : "~/Khachhang.aspx";
                }
                else
                {
                    lblGreeting.Text = "Xin chào, " + tk;
                    hlUser.NavigateUrl = "~/Khachhang.aspx";
                }
            }
            else
            {
                HyperLink3.Visible = true;
                HyperLink4.Visible = true;
                btnDangXuat.Visible = false;
                hlUser.Visible = false;
            }

            if (!IsPostBack)
                LoadFeaturedBooks();

            string page = Request.Url.AbsolutePath.ToLower();
            string[] fullPages = { "/giohang.aspx", "/thanhtoan.aspx", "/quanlysach.aspx", "/quanlybanhang.aspx", "/quanlybansach.aspx" };
            bool isFull = false;
            foreach (var p in fullPages)
            {
                if (page.EndsWith(p)) { isFull = true; break; }
            }

            if (isFull)
            {
                sidebarCol.Visible = false;
                mainCol.Attributes["class"] = "col-12";
            }
            else
            {
                sidebarCol.Visible = true;
                mainCol.Attributes["class"] = "col-12 col-lg-9";
            }
        }

        private void LoadFeaturedBooks()
        {
            lblCartCount.Text = CartItem.Count > 0 ? CartItem.Count.ToString() : "";
            var books = dc.TBL_SACHes.OrderByDescending(s => s.NGAYNHAP).Take(2).ToList();
            dtlSachNoiBat.DataSource = books;
            dtlSachNoiBat.DataBind();
        }

        protected void btnDangXuat_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("trangchu.aspx");
        }

        protected void btnmastertimkiem_Click(object sender, EventArgs e)
        {
            string keyword = txtmastertimkiem.Text;
            Response.Redirect("Ketquatimkiem.aspx?TENSACH=" + keyword);
        }
    }
}
