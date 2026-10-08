<%@ Page Title="Quản lý - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Quanlybansach.aspx.cs" Inherits="bansach.Quanlybansach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nav-cards">
        <asp:HyperLink ID="hlQuanLySach" runat="server" NavigateUrl="~/Quanlysach.aspx" CssClass="nav-card">
            <asp:Label CssClass="label" Text="QUẢN LÝ SÁCH" runat="server" />
            <asp:Label CssClass="desc" Text="Quản lý danh mục sách, thể loại, nhà xuất bản" runat="server" />
        </asp:HyperLink>
        <asp:HyperLink ID="hlQuanLyDonHang" runat="server" NavigateUrl="~/Quanlybanhang.aspx" CssClass="nav-card">
            <asp:Label CssClass="label" Text="QUẢN LÝ ĐƠN HÀNG" runat="server" />
            <asp:Label CssClass="desc" Text="Quản lý hóa đơn, tình trạng đơn hàng" runat="server" />
        </asp:HyperLink>
    </div>
</asp:Content>
