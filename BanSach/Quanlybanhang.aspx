<%@ Page Title="Quản lý đơn hàng - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Quanlybanhang.aspx.cs" Inherits="bansach.Quanlybanhang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-stat { background: #fff; border: 1px solid #d4d4d4; padding: 20px; text-align: center; }
        .admin-stat .num { font-size: 28px; font-weight: 700; display: block; }
        .admin-stat .lbl { font-size: 13px; color: #6b7280; margin-top: 4px; display: block; }
        .admin-stat.pending .num { color: #2563eb; }
        .admin-stat.done .num { color: #198754; }
        .admin-stat.cancel .num { color: #dc3545; }
        .admin-stat.total .num { color: #1b4332; }
        .ql-section { border: 1px solid #d4d4d4; padding: 20px; background: #fff; }
        .ql-back { margin-bottom: 20px; }
        .btn-back { display: inline-block; padding: 8px 20px; border: 1px solid #1b4332; color: #1b4332; font-size: 14px; font-weight: 600; text-decoration: none; }
        .btn-back:hover { background: #1b4332; color: #fff; text-decoration: none; }
        .action-link a { color: #2563eb; font-weight: 600; text-decoration: none; }
        .action-link a:hover { text-decoration: underline; }
        .data-table tr:hover td { background: #f5f5f0; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ql-back">
        <asp:HyperLink NavigateUrl="~/Quanlybansach.aspx" CssClass="btn-back" Text="← Quay về trang quản lý" runat="server" />
    </div>

    <div class="row g-3 mb-4">
        <div class="col-6 col-md-3">
            <div class="admin-stat total">
                <span class="num"><asp:Label ID="lblTotal" runat="server" /></span>
                <span class="lbl">Tổng đơn</span>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="admin-stat pending">
                <span class="num"><asp:Label ID="lblPending" runat="server" /></span>
                <span class="lbl">Chưa xử lý</span>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="admin-stat done">
                <span class="num"><asp:Label ID="lblDone" runat="server" /></span>
                <span class="lbl">Đã xử lý</span>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="admin-stat cancel">
                <span class="num"><asp:Label ID="lblCancel" runat="server" /></span>
                <span class="lbl">Đã huỷ</span>
            </div>
        </div>
    </div>

    <div class="ql-section">
        <asp:Label CssClass="section-title" Text="Danh sách hóa đơn" runat="server" />
        <asp:GridView ID="gvHD" runat="server" DataKeyNames="MAHD" AutoGenerateColumns="False" CssClass="data-table" AllowPaging="True" PageSize="15" AllowSorting="True" OnPageIndexChanging="gvHD_PageIndexChanging" OnSorting="gvHD_Sorting">
            <Columns>
                <asp:BoundField DataField="MAHD" HeaderText="Mã HD" ReadOnly="true" SortExpression="MAHD" />
                <asp:BoundField DataField="TENKHACHHANG" HeaderText="Khách hàng" SortExpression="TENKHACHHANG" />
                <asp:BoundField DataField="SDT" HeaderText="SĐT" SortExpression="SDT" />
                <asp:BoundField DataField="TONGTIEN" HeaderText="Tổng tiền" DataFormatString="{0:N0} đ" HtmlEncode="false" />
                <asp:BoundField DataField="NGAYDAT" HeaderText="Ngày đặt" DataFormatString="{0:yyyy-MM-dd HH:mm}" HtmlEncode="false" SortExpression="NGAYDAT" />
                <asp:BoundField DataField="TINHTRANG" HeaderText="Tình trạng" SortExpression="TINHTRANG" />
                <asp:HyperLinkField HeaderText="" Text="Chi tiết" DataNavigateUrlFields="MAHD" DataNavigateUrlFormatString="~/thongtindonhang.aspx?MAHD={0}" ItemStyle-CssClass="action-link" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
