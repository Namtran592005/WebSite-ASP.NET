<%@ Page Title="Trang chủ - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="trangchu.aspx.cs" Inherits="bansach.trangchu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .carousel-item img { height: 300px; object-fit: cover; }
        .carousel { margin-bottom: 24px; }
        .carousel-control-prev, .carousel-control-next { width: 40px; height: 40px; top: 50%; transform: translateY(-50%); background: rgba(0,0,0,0.5); }
        .carousel-control-prev { left: 10px; }
        .carousel-control-next { right: 10px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="homeBanner" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="image/trangchu/banner1.jpg" class="d-block w-100" alt="Sách mới 1">
            </div>
            <div class="carousel-item">
                <img src="image/trangchu/banner2.jpg" class="d-block w-100" alt="Sách mới 2">
            </div>
        </div>
        <a class="carousel-control-prev" href="#homeBanner" role="button" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#homeBanner" role="button" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>

    <asp:Label CssClass="page-title" Text="Sách mới nhất" runat="server" />
    <div class="book-grid">
        <asp:DataList ID="DataListsachmoinhat" runat="server" RepeatDirection="Horizontal" CssClass="book-grid-table">
            <ItemTemplate>
                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "image/upload/" + Eval("HINHANH") %>' AlternateText='<%# Eval("TENSACH") %>' />
                <asp:HyperLink ID="HyperLink6" runat="server" CssClass="book-title" Text='<%# Eval("TENSACH") %>' NavigateUrl='<%# "chitiet.aspx?MASACH=" + Eval("MASACH") %>'></asp:HyperLink>
                <div class="book-price"><asp:Label ID="lbGia" runat="server" Text='<%# string.Format("{0:N0} đ", Eval("DONGIA")) %>'></asp:Label></div>
            </ItemTemplate>
        </asp:DataList>
    </div>

    <asp:Label CssClass="page-title" Style="margin-top:28px; display:block;" Text="Sách Khoa học Công nghệ" runat="server" />
    <div class="book-grid">
        <asp:DataList ID="DataListsachkhcn" runat="server" RepeatDirection="Horizontal" CssClass="book-grid-table">
            <ItemTemplate>
                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "image/upload/" + Eval("HINHANH") %>' AlternateText='<%# Eval("TENSACH") %>' />
                <asp:HyperLink ID="HyperLink6" runat="server" CssClass="book-title" Text='<%# Eval("TENSACH") %>' NavigateUrl='<%# "chitiet.aspx?MASACH=" + Eval("MASACH") %>'></asp:HyperLink>
                <div class="book-price"><asp:Label ID="lbGia" runat="server" Text='<%# string.Format("{0:N0} đ", Eval("DONGIA")) %>'></asp:Label></div>
            </ItemTemplate>
        </asp:DataList>
    </div>

    <asp:Label CssClass="page-title" Style="margin-top:28px; display:block;" Text="Sách Tâm lý, Tình cảm" runat="server" />
    <div class="book-grid">
        <asp:DataList ID="DataListsachtltc" runat="server" RepeatDirection="Horizontal" CssClass="book-grid-table">
            <ItemTemplate>
                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "image/upload/" + Eval("HINHANH") %>' AlternateText='<%# Eval("TENSACH") %>' />
                <asp:HyperLink ID="HyperLink6" runat="server" CssClass="book-title" Text='<%# Eval("TENSACH") %>' NavigateUrl='<%# "chitiet.aspx?MASACH=" + Eval("MASACH") %>'></asp:HyperLink>
                <div class="book-price"><asp:Label ID="lbGia" runat="server" Text='<%# string.Format("{0:N0} đ", Eval("DONGIA")) %>'></asp:Label></div>
            </ItemTemplate>
        </asp:DataList>
    </div>

    <asp:Label CssClass="page-title" Style="margin-top:28px; display:block;" Text="Sách Văn học Viễn tưởng" runat="server" />
    <div class="book-grid">
        <asp:DataList ID="DataListsachvhvt" runat="server" RepeatDirection="Horizontal" CssClass="book-grid-table">
            <ItemTemplate>
                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "image/upload/" + Eval("HINHANH") %>' AlternateText='<%# Eval("TENSACH") %>' />
                <asp:HyperLink ID="HyperLink6" runat="server" CssClass="book-title" Text='<%# Eval("TENSACH") %>' NavigateUrl='<%# "chitiet.aspx?MASACH=" + Eval("MASACH") %>'></asp:HyperLink>
                <div class="book-price"><asp:Label ID="lbGia" runat="server" Text='<%# string.Format("{0:N0} đ", Eval("DONGIA")) %>'></asp:Label></div>
            </ItemTemplate>
        </asp:DataList>
    </div>

    <asp:Label CssClass="page-title" Style="margin-top:28px; display:block;" Text="Sách Văn hoá Xã hội" runat="server" />
    <div class="book-grid">
        <asp:DataList ID="DataListsachvhxh" runat="server" RepeatDirection="Horizontal" CssClass="book-grid-table">
            <ItemTemplate>
                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "image/upload/" + Eval("HINHANH") %>' AlternateText='<%# Eval("TENSACH") %>' />
                <asp:HyperLink ID="HyperLink6" runat="server" CssClass="book-title" Text='<%# Eval("TENSACH") %>' NavigateUrl='<%# "chitiet.aspx?MASACH=" + Eval("MASACH") %>'></asp:HyperLink>
                <div class="book-price"><asp:Label ID="lbGia" runat="server" Text='<%# string.Format("{0:N0} đ", Eval("DONGIA")) %>'></asp:Label></div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
