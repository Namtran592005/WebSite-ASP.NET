using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace bansach
{
    public partial class Quanlybanhang : System.Web.UI.Page
    {
        DataClassesDataContext dc = DatabaseConfig.GetContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TAIKHOAN"] == null)
                Response.Redirect("Dangnhap.aspx");

            if (!IsPostBack)
            {
                LoadStats();
                ViewState["SortExpression"] = "NGAYDAT";
                ViewState["SortDirection"] = "DESC";
                BindGrid();
            }
        }

        private void LoadStats()
        {
            var all = dc.TBL_HOADONs.ToList();
            lblTotal.Text = all.Count.ToString();
            lblPending.Text = all.Count(h => h.TINHTRANG == "Chưa xử lý").ToString();
            lblDone.Text = all.Count(h => h.TINHTRANG == "Đã xử lý").ToString();
            lblCancel.Text = all.Count(h => h.TINHTRANG == "Đã huỷ").ToString();
        }

        private void BindGrid()
        {
            var query = from h in dc.TBL_HOADONs
                        select new
                        {
                            MAHD = h.MAHD,
                            TENKHACHHANG = h.TENKHACHHANG,
                            SDT = h.SDT,
                            TONGTIEN = dc.TBL_CHITIET_HOADONs
                                .Where(ct => ct.MAHD == h.MAHD)
                                .Sum(ct => ct.THANHTIEN),
                            NGAYDAT = h.NGAYDAT,
                            TINHTRANG = h.TINHTRANG
                        };

            string sortExpr = ViewState["SortExpression"] as string ?? "NGAYDAT";
            string sortDir = ViewState["SortDirection"] as string ?? "DESC";

            switch (sortExpr)
            {
                case "MAHD": query = sortDir == "ASC" ? query.OrderBy(h => h.MAHD) : query.OrderByDescending(h => h.MAHD); break;
                case "TENKHACHHANG": query = sortDir == "ASC" ? query.OrderBy(h => h.TENKHACHHANG) : query.OrderByDescending(h => h.TENKHACHHANG); break;
                case "SDT": query = sortDir == "ASC" ? query.OrderBy(h => h.SDT) : query.OrderByDescending(h => h.SDT); break;
                case "NGAYDAT": query = sortDir == "ASC" ? query.OrderBy(h => h.NGAYDAT) : query.OrderByDescending(h => h.NGAYDAT); break;
                case "TINHTRANG": query = sortDir == "ASC" ? query.OrderBy(h => h.TINHTRANG) : query.OrderByDescending(h => h.TINHTRANG); break;
                default: query = query.OrderByDescending(h => h.NGAYDAT); break;
            }

            gvHD.DataSource = query.ToList();
            gvHD.DataBind();
        }

        protected void gvHD_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvHD.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void gvHD_Sorting(object sender, GridViewSortEventArgs e)
        {
            string currentSort = ViewState["SortExpression"] as string;
            string currentDir = ViewState["SortDirection"] as string;

            if (currentSort == e.SortExpression)
                ViewState["SortDirection"] = currentDir == "ASC" ? "DESC" : "ASC";
            else
            {
                ViewState["SortExpression"] = e.SortExpression;
                ViewState["SortDirection"] = "ASC";
            }

            BindGrid();
        }
    }
}