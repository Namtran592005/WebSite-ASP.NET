<%@ Page Title="Giỏ hàng - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Giohang.aspx.cs" Inherits="bansach.Giohang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .cart-table { width: 100%; border-collapse: collapse; font-size: 14px; }
        .cart-table th { background: #1b4332; color: #fff; padding: 10px 8px; text-align: left; font-weight: 600; }
        .cart-table td { padding: 12px 8px; border-bottom: 1px solid #e8e8e0; vertical-align: middle; }
        .cart-img { width: 60px; height: 80px; object-fit: cover; border: 1px solid #d4d4d4; }
        .cart-qty { width: 60px; text-align: center; height: 36px; border: 1px solid #d4d4d4; font-size: 14px; }
        .cart-price { color: #dc3545; font-weight: 700; font-size: 15px; }
        .cart-total { color: #dc3545; font-weight: 700; font-size: 17px; }
        .btn-remove { color: #dc3545; font-weight: 600; font-size: 13px; cursor: pointer; border: none; background: none; padding: 0; }
        .btn-remove:hover { text-decoration: underline; }
        .cart-summary { background: #fafaf5; border: 1px solid #d4d4d4; padding: 20px; margin-top: 20px; text-align: right; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label CssClass="page-title" Text="Giỏ hàng" runat="server" />

    <asp:Panel ID="pnlCart" runat="server" Visible="false">
        <asp:DataList ID="dtlCart" runat="server" RepeatDirection="Vertical" Width="100%" DataKeyField="MASACH">
            <HeaderTemplate>
                <table class="cart-table">
                    <tr>
                        <th style="width:80px;">Ảnh</th>
                        <th>Sách</th>
                        <th style="width:120px;">Đơn giá</th>
                        <th style="width:100px;">Số lượng</th>
                        <th style="width:120px;">Thành tiền</th>
                        <th style="width:60px;"></th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><asp:Image ID="imgCart" runat="server" CssClass="cart-img" ImageUrl='<%# "image/upload/" + Eval("HINHANH") %>' AlternateText='<%# Eval("TENSACH") %>' /></td>
                    <td><asp:HyperLink NavigateUrl='<%# "chitiet.aspx?MASACH=" + Eval("MASACH") %>' Style="font-weight:600;color:#1a1a1a;" Text='<%# Eval("TENSACH") %>' runat="server" /></td>
                    <td class="cart-price"><%# string.Format("{0:N0} đ", Eval("DONGIA")) %></td>
                    <td>
                        <asp:TextBox ID="txtSL" runat="server" CssClass="cart-qty" Text='<%# Eval("SOLUONG") %>' TextMode="Number" min="1" AutoPostBack="true" OnTextChanged="txtSL_TextChanged" />
                    </td>
                    <td class="cart-price"><%# string.Format("{0:N0} đ", (decimal)Eval("DONGIA") * (int)Eval("SOLUONG")) %></td>
                    <td><asp:LinkButton ID="btnRemove" runat="server" CssClass="btn-remove" Text="Xoá" CommandArgument='<%# Eval("MASACH") %>' OnClick="btnRemove_Click" /></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:DataList>

        <div class="cart-summary">
            <div style="font-size:16px;margin-bottom:10px;">
                <asp:Label ID="lblTotal" runat="server" CssClass="cart-total" />
            </div>
            <asp:Button ID="btnCheckout" runat="server" Text="Tiến hành thanh toán" CssClass="btn-primary" OnClick="btnCheckout_Click" />
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlEmpty" runat="server" Visible="true">
        <div style="text-align:center;padding:60px 20px;color:#6b7280;font-size:15px;">
            <p>Giỏ hàng của bạn đang trống.</p>
            <asp:HyperLink NavigateUrl="~/trangchu.aspx" CssClass="btn-primary" Style="margin-top:12px;display:inline-block;" Text="Mua sắm ngay" runat="server" />
        </div>
    </asp:Panel>
</asp:Content>
