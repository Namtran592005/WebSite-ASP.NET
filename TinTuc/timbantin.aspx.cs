using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bantin
{
    public partial class timbantin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label6.Visible = false;
        }

        DataClassesDataContext dc = new DataClassesDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["TinTucConnectionString"].ConnectionString);

        protected void txttimkiemtrongtrang_TextChanged(object sender, EventArgs e)
        {
            string keyword = txttimkiemtrongtrang.Text.Trim().ToLower();
            var bt = dc.BanTins.Where(u => u.TieuDe.ToLower().Contains(keyword));
            DataListbantin.DataSource = bt.ToList();
            DataListbantin.DataBind();
            Label6.Visible = true;
        }
    }
}