using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bantin
{
    public partial class TrangXaHoi : System.Web.UI.Page
    {
        DataClassesDataContext dc = new DataClassesDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["TinTucConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadtinXahoi();
        }

        private void LoadtinXahoi()
        {
            var bt = dc.BanTins.Where(u => u.MaLinhVuc == "XH").ToList();
            DataListXaHoi.DataSource = bt;
            DataListLienquan.DataSource = bt;
            DataListXaHoi.DataBind();
            DataListLienquan.DataBind();
        }
    }
}