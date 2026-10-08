using System;
using System.Linq;

namespace bansach
{
    public partial class trangchu : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            loadsachmoinhat();
            loadsachkhcn();
            loadsachtltc();
            loadsachvhvt();
            loadsachvhxh();
        }


        private void loadsachmoinhat()
        {
            var s = dc.TBL_SACHes.OrderByDescending(u => u.NGAYNHAP).Take(4).ToList();
            DataListsachmoinhat.DataSource = s;
            DataListsachmoinhat.DataBind();
        }

        private void loadsachkhcn()
        {
            var s = dc.TBL_SACHes.OrderByDescending(u => u.NGAYNHAP).Where(u => u.MATL == "KHCN").Take(4).ToList();
            DataListsachkhcn.DataSource = s;
            DataListsachkhcn.DataBind();
        }

        private void loadsachtltc()
        {
            var s = dc.TBL_SACHes.OrderByDescending(u => u.NGAYNHAP).Where(u => u.MATL == "TLTC").Take(4).ToList();
            DataListsachtltc.DataSource = s;
            DataListsachtltc.DataBind();
        }

        private void loadsachvhvt()
        {
            var s = dc.TBL_SACHes.OrderByDescending(u => u.NGAYNHAP).Where(u => u.MATL == "VHVT").Take(4).ToList();
            DataListsachvhvt.DataSource = s;
            DataListsachvhvt.DataBind();
        }

        private void loadsachvhxh()
        {
            var s = dc.TBL_SACHes.OrderByDescending(u => u.NGAYNHAP).Where(u => u.MATL == "VHXH").Take(4).ToList();
            DataListsachvhxh.DataSource = s;
            DataListsachvhxh.DataBind();
        }
    }
}
