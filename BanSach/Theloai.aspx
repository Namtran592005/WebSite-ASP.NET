<%@ Page Title="Thể loại - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Theloai.aspx.cs" Inherits="bansach.Theloai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label CssClass="page-title" Style="display:inline;" Text="Sách " runat="server" />
    <asp:Label ID="lbtentheloai" CssClass="page-title" Style="color:#1b4332; display:inline;" runat="server" />

    <div class="filter-row">
        <asp:Label ID="Label1" runat="server" Text="Sắp xếp theo giá:" AssociatedControlID="ddlSapXep"></asp:Label>
        <asp:DropDownList ID="ddlSapXep" runat="server" CssClass="form-control-custom" Style="width:auto;" AutoPostBack="true" OnSelectedIndexChanged="ddlSapXep_SelectedIndexChanged">
            <asp:ListItem Value="">Mặc định</asp:ListItem>
            <asp:ListItem Value="asc">Giá tăng dần</asp:ListItem>
            <asp:ListItem Value="desc">Giá giảm dần</asp:ListItem>
        </asp:DropDownList>
    </div>

    <div class="book-grid">
        <asp:DataList ID="DataListsachtheloai" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" CssClass="book-grid-table">
            <ItemTemplate>
                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "image/upload/" + Eval("HINHANH") %>' AlternateText='<%# Eval("TENSACH") %>' />
                <asp:HyperLink ID="HyperLink6" runat="server" CssClass="book-title" Text='<%# Eval("TENSACH") %>' NavigateUrl='<%# "chitiet.aspx?MASACH=" + Eval("MASACH") %>'></asp:HyperLink>
                <div class="book-price"><asp:Label ID="lbGia" runat="server" Text='<%# string.Format("{0:N0} đ", Eval("DONGIA")) %>'></asp:Label></div>
            </ItemTemplate>
        </asp:DataList>
    </div>

    <div class="text-center text-muted py-4"><asp:Label ID="lblNone" runat="server" Visible="false"></asp:Label></div>
</asp:Content>
