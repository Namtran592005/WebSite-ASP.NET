<%@ Page Title="Quản lý NXB - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editnxb.aspx.cs" Inherits="bansach.editnxb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" />
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink NavigateUrl="~/Quanlysach.aspx" CssClass="form-link" Text="← Quay lại" runat="server" Style="display:inline-block;margin-bottom:12px;" />
    <div class="form-card" style="max-width:600px;">
        <asp:Label CssClass="form-title" ID="lblTitle" Text="Thêm NXB" runat="server" />

        <div class="mb-3">
            <asp:Label CssClass="form-label" Text="Mã NXB" AssociatedControlID="txtMANXB" runat="server" />
            <asp:TextBox ID="txtMANXB" runat="server" CssClass="form-control-custom" placeholder="VD: NXB01" MaxLength="5" />
            <asp:RequiredFieldValidator ID="rfvMANXB" runat="server" ControlToValidate="txtMANXB" CssClass="form-error" Display="Dynamic">Vui lòng nhập mã NXB!</asp:RequiredFieldValidator>
        </div>

        <div class="mb-3">
            <asp:Label CssClass="form-label" Text="Tên NXB" AssociatedControlID="txtTENNXB" runat="server" />
            <asp:TextBox ID="txtTENNXB" runat="server" CssClass="form-control-custom" placeholder="Nhập tên NXB" />
            <asp:RequiredFieldValidator ID="rfvTENNXB" runat="server" ControlToValidate="txtTENNXB" CssClass="form-error" Display="Dynamic">Vui lòng nhập tên NXB!</asp:RequiredFieldValidator>
        </div>

        <div class="mb-3">
            <asp:Label CssClass="form-label" Text="Địa chỉ" AssociatedControlID="txtDIACHI" runat="server" />
            <asp:TextBox ID="txtDIACHI" runat="server" CssClass="form-control-custom" placeholder="Nhập địa chỉ" />
        </div>

        <div class="mb-3">
            <asp:Label CssClass="form-label" Text="Điện thoại" AssociatedControlID="txtDIENTHOAI" runat="server" />
            <asp:TextBox ID="txtDIENTHOAI" runat="server" CssClass="form-control-custom" placeholder="Nhập số điện thoại" />
        </div>

        <div class="d-flex gap-2 mt-4">
            <asp:Button ID="btnSave" runat="server" Text="LƯU" CssClass="btn-primary" OnClick="btnSave_Click" />
            <asp:HyperLink NavigateUrl="~/Quanlysach.aspx" CssClass="btn-cancel" Text="HỦY" runat="server" />
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="form-success mt-3" />
        <asp:Label ID="lblError" runat="server" CssClass="form-error mt-3" />
    </div>
</asp:Content>
