<%@ Page Title="Tra cứu đơn hàng - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tracuu.aspx.cs" Inherits="bansach.tracuu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" />
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-card" style="max-width:100%;">
        <asp:Label CssClass="form-title" Text="Tra cứu đơn hàng" runat="server" />
        <div class="d-flex gap-2 justify-content-center mb-4 flex-wrap">
            <asp:TextBox ID="txtSDT" runat="server" CssClass="form-control-custom" placeholder="Nhập số điện thoại" Style="max-width:300px;" />
            <asp:Button ID="btnTraCuu" runat="server" Text="TRA CỨU" CssClass="btn-primary" OnClick="btnTraCuu_Click" />
        </div>
        <asp:Label ID="lbloi" runat="server" CssClass="form-error text-center mb-3" />

        <asp:GridView ID="gvDonHang" runat="server" AutoGenerateColumns="false" CssClass="data-table" DataKeyNames="MAHD" Visible="false" AllowPaging="true" PageSize="20">
            <Columns>
                <asp:BoundField DataField="MAHD" HeaderText="Mã HD" />
                <asp:BoundField DataField="TENKHACHHANG" HeaderText="Khách hàng" />
                <asp:BoundField DataField="SDT" HeaderText="SĐT" />
                <asp:BoundField DataField="TONGTIEN" HeaderText="Tổng tiền" DataFormatString="{0:N0} đ" HtmlEncode="false" />
                <asp:BoundField DataField="NGAYDAT" HeaderText="Ngày đặt" DataFormatString="{0:yyyy-MM-dd HH:mm}" HtmlEncode="false" />
                <asp:BoundField DataField="TINHTRANG" HeaderText="Tình trạng" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
