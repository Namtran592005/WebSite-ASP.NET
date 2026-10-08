using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bantin
{
    public partial class ketquatimkiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loaddulieu();
        }

        DataClassesDataContext dc = new DataClassesDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["TinTucConnectionString"].ConnectionString);

        private void loaddulieu()
        {
            string keyword = Request.QueryString["MaBanTin"];
            if (keyword == null)
            {
                lberror.Text = "KHÔNG CÓ KẾT QUẢ NÀO!!!";
            }
            else {
                var bt = dc.BanTins.Where(u => u.TieuDe.ToLower().Contains(keyword.ToLower()));
                DataListbantin.DataSource = bt.ToList();
                DataListbantin.DataBind();
            }
        }
    }
}