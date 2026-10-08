using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bantin
{
    public partial class BantinChitiet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadbantin();
            }
        }

        DataClassesDataContext dc = new DataClassesDataContext(System.Configuration.ConfigurationManager.ConnectionStrings["TinTucConnectionString"].ConnectionString);

        private void loadbantin()
        {
            var mabantin = Request.QueryString["MaBanTin"];
            var bt = dc.BanTins.Where(u => u.MaBanTin == mabantin).ToList();
            DataList1.DataSource = bt;
            DataList1.DataBind();
        }
    }
}