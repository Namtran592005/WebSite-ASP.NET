<%@ Page Title="Chi tiết sách - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="chitiet.aspx.cs" Inherits="bansach.chitiet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataListChitiet" runat="server">
        <ItemTemplate>
            <div class="row g-4">
                <div class="col-md-4 text-center">
                    <asp:Image ID="Image2" runat="server" CssClass="detail-img" ImageUrl='<%# "image/upload/" + Eval("HINHANH") %>' AlternateText='<%# Eval("TENSACH") %>' />
                </div>
                <div class="col-md-8">
                    <div class="detail-name"><asp:Label ID="Label1" runat="server" Text='<%# Eval("TENSACH") %>'></asp:Label></div>
                    <div class="detail-meta"><asp:Label ID="Label5" runat="server" Text='<%# "Nhà xuất bản: " + Eval("TENNXB") %>'></asp:Label></div>
                    <div class="detail-meta"><asp:Label ID="Label2" runat="server" Text='<%# "Thể loại: " + Eval("TENTL") %>'></asp:Label></div>
                    <div class="detail-price"><asp:Label ID="Label3" runat="server" Text='<%# string.Format("{0:N0} đ", Eval("DONGIA")) %>'></asp:Label></div>
                    <div class="detail-desc"><asp:Label ID="Label4" runat="server" Text='<%# Eval("MOTA") %>'></asp:Label></div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:Button ID="btnAddToCart" runat="server" CssClass="btn-accent" Text="Thêm vào giỏ hàng" OnClick="btnAddToCart_Click" Style="margin-top:12px;" />

    <asp:Label CssClass="page-title" Style="margin-top:36px; display:block;" Text="Sách nổi bật khác" runat="server" />
    <div class="book-grid">
        <asp:DataList ID="DataListsachnbk" runat="server" RepeatDirection="Horizontal" CssClass="book-grid-table">
            <ItemTemplate>
                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "image/upload/" + Eval("HINHANH") %>' AlternateText='<%# Eval("TENSACH") %>' />
                <asp:HyperLink ID="HyperLink6" runat="server" CssClass="book-title" Text='<%# Eval("TENSACH") %>' NavigateUrl='<%# "chitiet.aspx?MASACH=" + Eval("MASACH") %>'></asp:HyperLink>
                <div class="book-price"><asp:Label ID="lbGia" runat="server" Text='<%# string.Format("{0:N0} đ", Eval("DONGIA")) %>'></asp:Label></div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
