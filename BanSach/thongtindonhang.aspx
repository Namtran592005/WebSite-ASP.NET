<%@ Page Title="Chi tiết đơn hàng - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="thongtindonhang.aspx.cs" Inherits="bansach.thongtindonhang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .order-card { background: #fafaf5; border: 1px solid #d4d4d4; border-radius: 6px; padding: 20px; margin-bottom: 16px; }
        .order-label { font-weight: 600; color: #555; min-width: 110px; display: inline-block; }
        .order-item { display: flex; align-items: center; gap: 16px; padding: 12px 0; border-bottom: 1px solid #e8e8e0; }
        .order-item:last-child { border-bottom: none; }
        .order-item-img { width: 50px; height: 65px; object-fit: cover; border: 1px solid #d4d4d4; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink NavigateUrl="~/Quanlybanhang.aspx" CssClass="form-link" Text="← Quay lại" runat="server" Style="display:inline-block;margin-bottom:12px;" />

    <div style="max-width:900px;margin:0 auto;">
        <asp:Label CssClass="form-title" ID="lblTitle" Text="Chi tiết đơn hàng" runat="server" />

        <div class="order-card">
            <div style="font-size:14px;margin-bottom:6px;"><span class="order-label">Mã đơn hàng:</span> <asp:Label ID="lblMAHD" Font-Bold="true" runat="server" /></div>
            <div style="font-size:14px;margin-bottom:6px;"><span class="order-label">Khách hàng:</span> <asp:Label ID="lblTenKH" runat="server" /></div>
            <div style="font-size:14px;margin-bottom:6px;"><span class="order-label">Số điện thoại:</span> <asp:Label ID="lblSDT" runat="server" /></div>
            <div style="font-size:14px;margin-bottom:6px;"><span class="order-label">Địa chỉ giao:</span> <asp:Label ID="lblDiaChi" runat="server" /></div>
            <div style="font-size:14px;margin-bottom:6px;"><span class="order-label">Ngày đặt:</span> <asp:Label ID="lblNgayDat" runat="server" /></div>
            <div style="font-size:14px;">
                <span class="order-label">Tình trạng:</span>
                <asp:DropDownList ID="ddlTinhTrang" runat="server" CssClass="form-control-custom" Style="width:auto;display:inline-block;">
                    <asp:ListItem Text="Chưa xử lý" Value="Chưa xử lý" />
                    <asp:ListItem Text="Đã xử lý" Value="Đã xử lý" />
                    <asp:ListItem Text="Đã huỷ" Value="Đã huỷ" />
                </asp:DropDownList>
                <asp:Button ID="btnUpdateStatus" runat="server" Text="CẬP NHẬT" CssClass="btn-primary" Style="margin-left:8px;padding:6px 16px;font-size:13px;" OnClick="btnUpdateStatus_Click" />
                <asp:Label ID="lblStatusMsg" runat="server" CssClass="form-success ms-2" />
            </div>
        </div>

        <asp:Label CssClass="section-title" Text="Sản phẩm trong đơn" runat="server" Style="margin-bottom:12px;" />
        <div id="orderItems" runat="server" class="order-card">
            <asp:Repeater ID="rptItems" runat="server">
                <ItemTemplate>
                    <div class="order-item">
                        <asp:Image ID="imgSach" runat="server" CssClass="order-item-img" ImageUrl='<%# "image/upload/" + Eval("HINHANH") %>' AlternateText='<%# Eval("TENSACH") %>' />
                        <div style="flex:1;">
                            <div style="font-weight:600;"><%# Eval("TENSACH") %></div>
                            <div style="font-size:13px;color:#6b7280;">Mã: <%# Eval("MASACH") %> | SL: <%# Eval("SOLUONG") %> | Đơn giá: <%# string.Format("{0:N0} đ", Eval("DONGIA")) %></div>
                        </div>
                        <div style="text-align:right;font-weight:700;color:#dc3545;white-space:nowrap;">
                            <%# string.Format("{0:N0} đ", Eval("THANHTIEN")) %>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div style="text-align:right;font-size:18px;font-weight:700;color:#dc3545;padding:16px 0;">
            Tổng cộng: <asp:Label ID="lblTongTien" runat="server" />
        </div>

        <div style="text-align:center;margin-top:16px;">
            <asp:Button ID="btnInHoaDon" runat="server" Text="🖨 IN HOÁ ĐƠN" CssClass="btn-primary" Style="padding:10px 32px;" OnClick="btnInHoaDon_Click" />
            <asp:Label ID="lblInMsg" runat="server" CssClass="form-success ms-3" />
        </div>
    </div>
</asp:Content>
