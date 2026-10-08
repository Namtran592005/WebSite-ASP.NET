<%@ Page Title="Đăng ký - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dangky.aspx.cs" Inherits="bansach.Dangky" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-card">
        <asp:Label CssClass="form-title" Text="Đăng ký" runat="server" />
        <div class="mb-3">
            <asp:Label CssClass="form-label" Text="Họ và tên" AssociatedControlID="txthoten" runat="server" />
            <asp:TextBox ID="txthoten" runat="server" CssClass="form-control-custom" placeholder="Nhập họ và tên"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txthoten" CssClass="form-error" Display="Dynamic">Vui lòng nhập Họ tên!</asp:RequiredFieldValidator>
        </div>
        <div class="mb-3">
            <asp:Label CssClass="form-label" Text="Số điện thoại" AssociatedControlID="txtSDT" runat="server" />
            <asp:TextBox ID="txtSDT" runat="server" CssClass="form-control-custom" placeholder="Nhập số điện thoại"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSDT" CssClass="form-error" Display="Dynamic">Vui lòng nhập số điện thoại!</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSDT" ValidationExpression="\d{10,15}" CssClass="form-error" Display="Dynamic">Số điện thoại không hợp lệ!</asp:RegularExpressionValidator>
        </div>
        <div class="mb-3">
            <asp:Label CssClass="form-label" Text="Tên tài khoản" AssociatedControlID="txtuser" runat="server" />
            <asp:TextBox ID="txtuser" runat="server" CssClass="form-control-custom" placeholder="Nhập tên tài khoản"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtuser" CssClass="form-error" Display="Dynamic">Vui lòng nhập tên tài khoản!</asp:RequiredFieldValidator>
        </div>
        <div class="mb-3">
            <asp:Label CssClass="form-label" Text="Mật khẩu" AssociatedControlID="txtpass" runat="server" />
            <asp:TextBox ID="txtpass" runat="server" CssClass="form-control-custom" TextMode="Password" placeholder="Nhập mật khẩu"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpass" CssClass="form-error" Display="Dynamic">Vui lòng nhập mật khẩu!</asp:RequiredFieldValidator>
        </div>
        <div class="mb-3">
            <asp:Label CssClass="form-label" Text="Nhập lại mật khẩu" AssociatedControlID="txtpass2" runat="server" />
            <asp:TextBox ID="txtpass2" runat="server" CssClass="form-control-custom" TextMode="Password" placeholder="Nhập lại mật khẩu"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtpass2" CssClass="form-error" Display="Dynamic">Vui lòng nhập lại mật khẩu!</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpass" ControlToValidate="txtpass2" CssClass="form-error" Display="Dynamic">Mật khẩu không khớp!</asp:CompareValidator>
        </div>
        <div class="mt-4">
            <asp:Button ID="btndangky" runat="server" Text="ĐĂNG KÝ" CssClass="btn-primary" OnClick="btndangky_Click" />
        </div>
        <div class="mt-2">
            <asp:HyperLink ID="HyperLink6" runat="server" CssClass="form-link" NavigateUrl="~/Dangnhap.aspx">Quay lại đăng nhập</asp:HyperLink>
        </div>
        <asp:Label ID="lbloi" runat="server" CssClass="form-error mt-2"></asp:Label>
        <asp:Label ID="lbthanhcong" runat="server" CssClass="form-success mt-2"></asp:Label>
    </div>
</asp:Content>
