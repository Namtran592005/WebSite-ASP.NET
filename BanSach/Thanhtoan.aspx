<%@ Page Title="Thanh toán - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Thanhtoan.aspx.cs" Inherits="bansach.Thanhtoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tt-qty { width: 60px; text-align: center; }
        .tt-book-img { width: 60px; height: 80px; object-fit: cover; border: 1px solid #d4d4d4; }
        .tt-item { display: flex; gap: 12px; align-items: center; padding: 8px 0; border-bottom: 1px solid #e8e8e0; }
        .tt-item:last-child { border-bottom: none; }
        .tt-name { font-size: 14px; font-weight: 600; color: #1a1a1a; flex: 1; }
        .tt-price { font-size: 15px; font-weight: 700; color: #dc3545; white-space: nowrap; }
        .tt-grand { font-size: 18px; font-weight: 700; color: #dc3545; }
        .checkout-section { background: #fafaf5; border: 1px solid #d4d4d4; padding: 20px; margin-bottom: 20px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-card form-card-wide">
        <asp:Label CssClass="form-title" Text="Thanh toán" runat="server" />

        <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
            <div style="text-align:center;padding:40px;color:#6b7280;font-size:15px;">
                <p>Giỏ hàng trống.</p>
                <asp:HyperLink NavigateUrl="~/trangchu.aspx" CssClass="btn-primary" Text="Về trang chủ" runat="server" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlCheckout" runat="server">
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="checkout-section">
                        <asp:Label CssClass="section-title" Text="Thông tin giao hàng" runat="server" />
                        <div class="mb-3">
                            <asp:Label CssClass="form-label" Text="Họ và tên" AssociatedControlID="txttenkhachhang" runat="server" />
                            <asp:TextBox ID="txttenkhachhang" runat="server" CssClass="form-control-custom" placeholder="Họ và tên" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txttenkhachhang" CssClass="form-error" Display="Dynamic">Vui lòng nhập họ tên!</asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <asp:Label CssClass="form-label" Text="Số điện thoại" AssociatedControlID="txtsdt" runat="server" />
                            <asp:TextBox ID="txtsdt" runat="server" CssClass="form-control-custom" placeholder="Số điện thoại" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtsdt" CssClass="form-error" Display="Dynamic">Vui lòng nhập SĐT!</asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <asp:Label CssClass="form-label" Text="Tỉnh / Thành phố" AssociatedControlID="txttinh" runat="server" />
                            <asp:TextBox ID="txttinh" runat="server" CssClass="form-control-custom" placeholder="Tỉnh / Thành phố" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txttinh" CssClass="form-error" Display="Dynamic">Vui lòng nhập tỉnh!</asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <asp:Label CssClass="form-label" Text="Phường / Xã" AssociatedControlID="txtphuongxa" runat="server" />
                            <asp:TextBox ID="txtphuongxa" runat="server" CssClass="form-control-custom" placeholder="Phường / Xã" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtphuongxa" CssClass="form-error" Display="Dynamic">Vui lòng nhập phường xã!</asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <asp:Label CssClass="form-label" Text="Địa chỉ (số nhà, đường)" AssociatedControlID="txtdiachi" runat="server" />
                            <asp:TextBox ID="txtdiachi" runat="server" CssClass="form-control-custom" placeholder="Địa chỉ (số nhà, đường)" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtdiachi" CssClass="form-error" Display="Dynamic">Vui lòng nhập địa chỉ!</asp:RequiredFieldValidator>
                        </div>
                        <asp:Label ID="lbloi" runat="server" CssClass="form-error" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="checkout-section">
                        <asp:Label CssClass="section-title" Text="Đơn hàng" runat="server" />
                        <asp:DataList ID="dtlCartItems" runat="server" Width="100%">
                            <ItemTemplate>
                                <div class="tt-item">
                                    <asp:Image ID="imgItem" runat="server" CssClass="tt-book-img" ImageUrl='<%# "image/upload/" + Eval("HINHANH") %>' AlternateText='<%# Eval("TENSACH") %>' />
                                    <div class="tt-name"><%# Eval("TENSACH") %> × <strong><%# Eval("SOLUONG") %></strong></div>
                                    <div class="tt-price"><%# string.Format("{0:N0} đ", (decimal)Eval("DONGIA") * (int)Eval("SOLUONG")) %></div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <div style="text-align:right;padding-top:12px;">
                            <asp:Label ID="lblGrandTotal" runat="server" CssClass="tt-grand" />
                        </div>
                    </div>
                    <div class="mt-3">
                        <asp:Button ID="btnthanhtoan" runat="server" Text="XÁC NHẬN ĐẶT HÀNG" CssClass="btn-primary" Style="width:100%;" OnClick="btnthanhtoan_Click" />
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
