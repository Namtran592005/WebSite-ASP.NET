<%@ Page Title="Đăng nhập - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dangnhap.aspx.cs" Inherits="bansach.Dangnhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-card">
        <asp:Label CssClass="form-title" Text="Đăng nhập" runat="server" />
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
        <div class="d-flex align-items-center justify-content-between mt-4">
            <asp:Button ID="btndangnhap" runat="server" Text="ĐĂNG NHẬP" CssClass="btn-primary" OnClick="btndangnhap_Click" />
            <div>
                <asp:HyperLink ID="HyperLink5" runat="server" CssClass="form-link" NavigateUrl="~/Quenmatkhau.aspx">Quên mật khẩu</asp:HyperLink>
                <asp:Label CssClass="mx-2 text-muted" Text="|" runat="server" />
                <asp:HyperLink ID="HyperLink6" runat="server" CssClass="form-link" NavigateUrl="~/Dangky.aspx">Đăng ký</asp:HyperLink>
            </div>
        </div>
        <asp:Label ID="lbloi" runat="server" CssClass="form-error mt-2"></asp:Label>
    </div>
</asp:Content>
