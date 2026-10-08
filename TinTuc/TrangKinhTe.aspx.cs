using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bantin
{
    public partial class TrangKinhTe : System.Web.UI.Page
    {
        DataClassesDataContext dc = new DataClassesDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["TinTucConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadtinKinhTe();
        }
        private void LoadtinKinhTe()
        {
            var bt = dc.BanTins.Where(u => u.MaLinhVuc == "KT").ToList();
            DataListKinhTe.DataSource = bt;
            DataListLienquan.DataSource = bt;
            DataListKinhTe.DataBind();
            DataListLienquan.DataBind();
        }
    }
}