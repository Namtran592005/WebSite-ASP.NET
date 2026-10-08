using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace bansach
{
    public partial class Giohang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindCart();
        }

        private void BindCart()
        {
            var cart = CartItem.GetCart();
            if (cart.Count == 0)
            {
                pnlCart.Visible = false;
                pnlEmpty.Visible = true;
                return;
            }
            pnlCart.Visible = true;
            pnlEmpty.Visible = false;
            dtlCart.DataSource = cart.ToList();
            dtlCart.DataBind();
            lblTotal.Text = "Tổng cộng: " + string.Format("{0:N0} đ", cart.Sum(c => c.DONGIA * c.SOLUONG));
        }

        protected void txtSL_TextChanged(object sender, EventArgs e)
        {
            var txt = sender as TextBox;
            var item = txt.NamingContainer as DataListItem;
            if (item == null) return;

            var masach = dtlCart.DataKeys[item.ItemIndex] as string;
            int sl;
            int.TryParse(txt.Text, out sl);
            if (sl < 1) sl = 1;

            var cart = CartItem.GetCart();
            var ci = cart.FirstOrDefault(c => c.MASACH == masach);
            if (ci != null) ci.SOLUONG = sl;

            Response.Redirect("giohang.aspx");
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            var btn = sender as LinkButton;
            string masach = btn.CommandArgument;

            var cart = CartItem.GetCart();
            cart.RemoveAll(c => c.MASACH == masach);
            Response.Redirect("giohang.aspx");
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Thanhtoan.aspx");
        }
    }
}
