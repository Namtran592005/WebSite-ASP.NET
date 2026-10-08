using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bantin
{
    public partial class TrangTheThao : System.Web.UI.Page
    {
        DataClassesDataContext dc = new DataClassesDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["TinTucConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            loadtinthethao();
        }

        private void loadtinthethao()
        {
            var bt = dc.BanTins.Where(u => u.MaLinhVuc == "TT").ToList();
            DataListTheThao.DataSource = bt;
            DataListLienquan.DataSource = bt;
            DataListTheThao.DataBind();
            DataListLienquan.DataBind();
        }

        protected void DataListTheThao_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}