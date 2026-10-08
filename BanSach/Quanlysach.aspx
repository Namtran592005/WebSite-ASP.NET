<%@ Page Title="Quản lý sách - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Quanlysach.aspx.cs" Inherits="bansach.Quanlysach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-stat { background: #fff; border: 1px solid #d4d4d4; padding: 20px; text-align: center; }
        .admin-stat .num { font-size: 28px; font-weight: 700; display: block; }
        .admin-stat .lbl { font-size: 13px; color: #6b7280; margin-top: 4px; display: block; }
        .admin-stat.books .num { color: #1b4332; }
        .admin-stat.cats .num { color: #2563eb; }
        .admin-stat.pubs .num { color: #198754; }
        .ql-section { border: 1px solid #d4d4d4; padding: 20px; margin-bottom: 24px; background: #fff; }
        .ql-back { margin-bottom: 20px; }
        .btn-back { display: inline-block; padding: 8px 20px; border: 1px solid #1b4332; color: #1b4332; font-size: 14px; font-weight: 600; text-decoration: none; }
        .btn-back:hover { background: #1b4332; color: #fff; text-decoration: none; }
        .btn-add { display: inline-block; padding: 6px 14px; background: #1b4332; color: #fff; font-size: 13px; font-weight: 600; text-decoration: none; border-radius: 3px; margin-bottom: 10px; }
        .btn-add:hover { background: #0f2922; color: #fff; text-decoration: none; }
        .data-table tr:hover td { background: #f5f5f0; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ql-back">
        <asp:HyperLink NavigateUrl="~/Quanlybansach.aspx" CssClass="btn-back" Text="← Quay về trang quản lý" runat="server" />
    </div>

    <div class="row g-3 mb-4">
        <div class="col-4">
            <div class="admin-stat books">
                <span class="num"><asp:Label ID="lblBooks" runat="server" /></span>
                <span class="lbl">Sách</span>
            </div>
        </div>
        <div class="col-4">
            <div class="admin-stat cats">
                <span class="num"><asp:Label ID="lblCats" runat="server" /></span>
                <span class="lbl">Thể loại</span>
            </div>
        </div>
        <div class="col-4">
            <div class="admin-stat pubs">
                <span class="num"><asp:Label ID="lblPubs" runat="server" /></span>
                <span class="lbl">Nhà xuất bản</span>
            </div>
        </div>
    </div>

    <div class="ql-section">
        <asp:Label CssClass="section-title" Text="Danh mục sách" runat="server" />
        <div style="margin:10px 0;"><asp:HyperLink NavigateUrl="~/editsach.aspx" CssClass="btn-add" Text="+ Thêm sách mới" runat="server" /></div>
        <asp:GridView ID="gvSach" runat="server" DataKeyNames="MASACH" AutoGenerateColumns="false" CssClass="data-table" AllowPaging="True" PageSize="10" OnPageIndexChanging="gvSach_PageIndexChanging" OnRowDeleting="gvSach_RowDeleting">
            <Columns>
                <asp:BoundField DataField="MASACH" HeaderText="Mã sách" />
                <asp:BoundField DataField="TENSACH" HeaderText="Tên sách" />
                <asp:BoundField DataField="HINHANH" HeaderText="Hình ảnh" />
                <asp:BoundField DataField="DONGIA" HeaderText="Đơn giá" DataFormatString="{0:N0}" />
                <asp:BoundField DataField="MANXB" HeaderText="Mã NXB" />
                <asp:BoundField DataField="MATL" HeaderText="Mã thể loại" />
                <asp:BoundField DataField="NGAYNHAP" HeaderText="Ngày nhập" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false" />
                <asp:HyperLinkField HeaderText="" Text="Sửa" DataNavigateUrlFields="MASACH" DataNavigateUrlFormatString="~/editsach.aspx?MASACH={0}" ItemStyle-CssClass="action-link" />
                <asp:CommandField ShowDeleteButton="True" DeleteText="Xoá" ItemStyle-CssClass="action-link" />
            </Columns>
        </asp:GridView>
    </div>

    <div class="ql-section">
        <asp:Label CssClass="section-title" Text="Thể loại" runat="server" />
        <div style="margin:10px 0;"><asp:HyperLink NavigateUrl="~/edittheloai.aspx" CssClass="btn-add" Text="+ Thêm thể loại" runat="server" /></div>
        <asp:GridView ID="gvTheLoai" runat="server" DataKeyNames="MATL" AutoGenerateColumns="false" CssClass="data-table" AllowPaging="True" PageSize="10" OnPageIndexChanging="gvTheLoai_PageIndexChanging" OnRowDeleting="gvTheLoai_RowDeleting">
            <Columns>
                <asp:BoundField DataField="MATL" HeaderText="Mã thể loại" />
                <asp:BoundField DataField="TENTL" HeaderText="Tên thể loại" />
                <asp:HyperLinkField HeaderText="" Text="Sửa" DataNavigateUrlFields="MATL" DataNavigateUrlFormatString="~/edittheloai.aspx?MATL={0}" ItemStyle-CssClass="action-link" />
                <asp:CommandField ShowDeleteButton="True" DeleteText="Xoá" ItemStyle-CssClass="action-link" />
            </Columns>
        </asp:GridView>
    </div>

    <div class="ql-section">
        <asp:Label CssClass="section-title" Text="Nhà xuất bản" runat="server" />
        <div style="margin:10px 0;"><asp:HyperLink NavigateUrl="~/editnxb.aspx" CssClass="btn-add" Text="+ Thêm NXB" runat="server" /></div>
        <asp:GridView ID="gvNXB" runat="server" DataKeyNames="MANXB" AutoGenerateColumns="false" CssClass="data-table" AllowPaging="True" PageSize="10" OnPageIndexChanging="gvNXB_PageIndexChanging" OnRowDeleting="gvNXB_RowDeleting">
            <Columns>
                <asp:BoundField DataField="MANXB" HeaderText="Mã NXB" />
                <asp:BoundField DataField="TENNXB" HeaderText="Tên NXB" />
                <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" />
                <asp:BoundField DataField="DIENTHOAI" HeaderText="Điện thoại" />
                <asp:HyperLinkField HeaderText="" Text="Sửa" DataNavigateUrlFields="MANXB" DataNavigateUrlFormatString="~/editnxb.aspx?MANXB={0}" ItemStyle-CssClass="action-link" />
                <asp:CommandField ShowDeleteButton="True" DeleteText="Xoá" ItemStyle-CssClass="action-link" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
