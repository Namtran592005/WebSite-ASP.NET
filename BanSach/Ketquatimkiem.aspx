<%@ Page Title="Kết quả tìm kiếm - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ketquatimkiem.aspx.cs" Inherits="bansach.Ketquatimkiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lbtensach" CssClass="page-title" Style="color:#1b4332; display:inline;" runat="server" />
    <div class="book-grid">
        <asp:DataList ID="DataListketqua" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CssClass="book-grid-table">
            <ItemTemplate>
                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "image/upload/" + Eval("HINHANH") %>' AlternateText='<%# Eval("TENSACH") %>' />
                <asp:HyperLink ID="HyperLink6" runat="server" CssClass="book-title" Text='<%# Eval("TENSACH") %>' NavigateUrl='<%# "chitiet.aspx?MASACH=" + Eval("MASACH") %>'></asp:HyperLink>
                <div class="book-price"><asp:Label ID="lbGia" runat="server" Text='<%# string.Format("{0:N0} đ", Eval("DONGIA")) %>'></asp:Label></div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
