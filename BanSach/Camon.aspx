<%@ Page Title="Đặt hàng thành công - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Camon.aspx.cs" Inherits="bansach.Camon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" />
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="thanks-wrap">
        <div class="thanks-box">
            <asp:Label CssClass="thanks-heading" Text="ĐẶT HÀNG THÀNH CÔNG" runat="server" />
            <asp:Label CssClass="note" Text="Cảm ơn bạn đã đặt hàng tại cửa hàng chúng tôi" runat="server" />
            <div class="order-info">
                <span><asp:Label Font-Bold="true" Text="Mã đơn hàng:" runat="server" /> <asp:Label ID="lblMAHD" runat="server" CssClass="highlight" /></span>
                <span><asp:Label Font-Bold="true" Text="Số sản phẩm:" runat="server" /> <asp:Label ID="lblCount" runat="server" /></span>
                <span><asp:Label Font-Bold="true" Text="Khách hàng:" runat="server" /> <asp:Label ID="lblTenKH" runat="server" /></span>
                <span><asp:Label Font-Bold="true" Text="Số điện thoại:" runat="server" /> <asp:Label ID="lblSDT" runat="server" /></span>
                <span><asp:Label Font-Bold="true" Text="Tổng tiền:" runat="server" /> <asp:Label ID="lblTongTien" runat="server" CssClass="highlight" /></span>
                <span><asp:Label Font-Bold="true" Text="Trạng thái:" runat="server" /> <asp:Label ID="lblTrangThai" runat="server" Style="color:#2563eb; font-weight:700;" /></span>
            </div>
            <asp:HyperLink ID="HyperLinkBack" NavigateUrl="~/trangchu.aspx" CssClass="btn-primary" Text="Quay về trang chủ" runat="server" />
        </div>
    </div>
</asp:Content>
