<%@ Page Title="Quản lý sách - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editsach.aspx.cs" Inherits="bansach.editsach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .edit-form { max-width: 800px; margin: 0 auto; }
        .edit-form .form-group { margin-bottom: 16px; }
        .edit-form label { font-weight: 600; font-size: 14px; margin-bottom: 4px; display: block; }
        .edit-form .form-control-custom { width: 100%; }
        .edit-form textarea { min-height: 120px; resize: vertical; }
        .img-preview { max-width: 150px; max-height: 200px; border: 1px solid #d4d4d4; border-radius: 4px; margin-top: 8px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink NavigateUrl="~/Quanlysach.aspx" CssClass="form-link" Text="← Quay lại" runat="server" Style="display:inline-block;margin-bottom:12px;" />
    <div class="edit-form">
        <asp:Label CssClass="form-title" ID="lblTitle" Text="Thêm sách mới" runat="server" />

        <div class="form-group">
            <asp:Label Text="Mã sách" AssociatedControlID="txtMASACH" runat="server" />
            <asp:TextBox ID="txtMASACH" runat="server" CssClass="form-control-custom" placeholder="VD: S001" MaxLength="10" />
            <asp:RequiredFieldValidator ID="rfvMASACH" runat="server" ControlToValidate="txtMASACH" CssClass="form-error" Display="Dynamic">Vui lòng nhập mã sách!</asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <asp:Label Text="Tên sách" AssociatedControlID="txtTENSACH" runat="server" />
            <asp:TextBox ID="txtTENSACH" runat="server" CssClass="form-control-custom" placeholder="Nhập tên sách" />
            <asp:RequiredFieldValidator ID="rfvTENSACH" runat="server" ControlToValidate="txtTENSACH" CssClass="form-error" Display="Dynamic">Vui lòng nhập tên sách!</asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <asp:Label Text="Hình ảnh" AssociatedControlID="fuHINHANH" runat="server" />
            <asp:FileUpload ID="fuHINHANH" runat="server" CssClass="form-control-custom" />
            <asp:Image ID="imgPreview" runat="server" CssClass="img-preview" Visible="false" />
            <asp:HiddenField ID="hdfHINHANH" runat="server" />
        </div>

        <div class="row g-3">
            <div class="col-md-4">
                <div class="form-group">
                    <asp:Label Text="Ngày nhập" AssociatedControlID="txtNGAYNHAP" runat="server" />
                    <asp:TextBox ID="txtNGAYNHAP" runat="server" CssClass="form-control-custom" TextMode="Date" />
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <asp:Label Text="Đơn giá" AssociatedControlID="txtDONGIA" runat="server" />
                    <asp:TextBox ID="txtDONGIA" runat="server" CssClass="form-control-custom" placeholder="0" TextMode="Number" step="1000" min="0" />
                    <asp:RequiredFieldValidator ID="rfvDONGIA" runat="server" ControlToValidate="txtDONGIA" CssClass="form-error" Display="Dynamic">Vui lòng nhập đơn giá!</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <asp:Label Text="Nhà xuất bản" AssociatedControlID="ddlMANXB" runat="server" />
                    <asp:DropDownList ID="ddlMANXB" runat="server" CssClass="form-control-custom" DataTextField="TENNXB" DataValueField="MANXB" />
                </div>
            </div>
        </div>

        <div class="row g-3">
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label Text="Thể loại" AssociatedControlID="ddlMATL" runat="server" />
                    <asp:DropDownList ID="ddlMATL" runat="server" CssClass="form-control-custom" DataTextField="TENTL" DataValueField="MATL" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <asp:Label Text="Mô tả" AssociatedControlID="txtMOTA" runat="server" />
            <asp:TextBox ID="txtMOTA" runat="server" CssClass="form-control-custom" TextMode="MultiLine" placeholder="Nhập mô tả sách" />
        </div>

        <div class="d-flex gap-2 mt-4">
            <asp:Button ID="btnSave" runat="server" Text="LƯU" CssClass="btn-primary" OnClick="btnSave_Click" />
            <asp:HyperLink NavigateUrl="~/Quanlysach.aspx" CssClass="btn-cancel" Text="HỦY" runat="server" />
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="form-success mt-3" />
        <asp:Label ID="lblError" runat="server" CssClass="form-error mt-3" />
    </div>
</asp:Content>
