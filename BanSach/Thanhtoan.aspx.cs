using System;
using System.Linq;

namespace bansach
{
    public partial class Thanhtoan : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TAIKHOAN"] != null)
                {
                    string tk = Session["TAIKHOAN"].ToString();
                    var user = dc.TBL_TAIKHOANs.FirstOrDefault(u => u.TAIKHOAN == tk);
                    if (user != null)
                    {
                        if (!string.IsNullOrEmpty(user.HOTEN))
                            txttenkhachhang.Text = user.HOTEN;
                        if (!string.IsNullOrEmpty(user.SDT))
                            txtsdt.Text = user.SDT;
                    }
                }

                var cart = CartItem.GetCart();
                if (cart.Count == 0)
                {
                    pnlCheckout.Visible = false;
                    pnlEmpty.Visible = true;
                    return;
                }
                pnlCheckout.Visible = true;
                pnlEmpty.Visible = false;
                dtlCartItems.DataSource = cart.ToList();
                dtlCartItems.DataBind();
                lblGrandTotal.Text = string.Format("Tổng cộng: {0:N0} đ", cart.Sum(c => c.DONGIA * c.SOLUONG));
            }
        }

        protected void btnthanhtoan_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            var cart = CartItem.GetCart();
            if (cart.Count == 0) return;

            string diachi = txtdiachi.Text + ", " + txtphuongxa.Text + ", " + txttinh.Text;
            DateTime now = DateTime.Now;

            var hoadon = new TBL_HOADON
            {
                TENKHACHHANG = txttenkhachhang.Text,
                SDT = txtsdt.Text,
                DIACHIGIAOHANG = diachi,
                NGAYDAT = now,
                TINHTRANG = "Chưa xử lý"
            };
            dc.TBL_HOADONs.InsertOnSubmit(hoadon);
            dc.SubmitChanges();

            foreach (var item in cart)
            {
                var ct = new TBL_CHITIET_HOADON
                {
                    MAHD = hoadon.MAHD,
                    MASACH = item.MASACH,
                    SOLUONG = item.SOLUONG,
                    DONGIA = item.DONGIA
                };
                dc.TBL_CHITIET_HOADONs.InsertOnSubmit(ct);
            }
            dc.SubmitChanges();

            CartItem.ClearCart();
            Response.Redirect("Camon.aspx?MAHD=" + hoadon.MAHD + "&count=" + cart.Count);
        }
    }
}