<%@ Page Title="Quản lý thể loại - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="edittheloai.aspx.cs" Inherits="bansach.edittheloai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" />
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink NavigateUrl="~/Quanlysach.aspx" CssClass="form-link" Text="← Quay lại" runat="server" Style="display:inline-block;margin-bottom:12px;" />
    <div class="form-card" style="max-width:500px;">
        <asp:Label CssClass="form-title" ID="lblTitle" Text="Thêm thể loại" runat="server" />

        <div class="mb-3">
            <asp:Label CssClass="form-label" Text="Mã thể loại" AssociatedControlID="txtMATL" runat="server" />
            <asp:TextBox ID="txtMATL" runat="server" CssClass="form-control-custom" placeholder="VD: TL001" MaxLength="10" />
            <asp:RequiredFieldValidator ID="rfvMATL" runat="server" ControlToValidate="txtMATL" CssClass="form-error" Display="Dynamic">Vui lòng nhập mã thể loại!</asp:RequiredFieldValidator>
        </div>

        <div class="mb-3">
            <asp:Label CssClass="form-label" Text="Tên thể loại" AssociatedControlID="txtTENTL" runat="server" />
            <asp:TextBox ID="txtTENTL" runat="server" CssClass="form-control-custom" placeholder="Nhập tên thể loại" />
            <asp:RequiredFieldValidator ID="rfvTENTL" runat="server" ControlToValidate="txtTENTL" CssClass="form-error" Display="Dynamic">Vui lòng nhập tên thể loại!</asp:RequiredFieldValidator>
        </div>

        <div class="d-flex gap-2 mt-4">
            <asp:Button ID="btnSave" runat="server" Text="LƯU" CssClass="btn-primary" OnClick="btnSave_Click" />
            <asp:HyperLink NavigateUrl="~/Quanlysach.aspx" CssClass="btn-cancel" Text="HỦY" runat="server" />
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="form-success mt-3" />
        <asp:Label ID="lblError" runat="server" CssClass="form-error mt-3" />
    </div>
</asp:Content>
