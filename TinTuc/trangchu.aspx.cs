using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bantin
{
    public partial class trangchu : System.Web.UI.Page
    {
        DataClassesDataContext dc = new DataClassesDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["TinTucConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            bantintrangchu(10);
        }

        private void bantintrangchu(int n) 
        {
            var bt = dc.BanTins.OrderByDescending(u => u.NgayDangTin).Take(n).ToList();
            var btnb = dc.BanTins.ToList();
            DataListbantin.DataSource = bt;
            DataListLienquan.DataSource = btnb;
            DataListbantin.DataBind();
            DataListLienquan.DataBind();
        }
    }
}