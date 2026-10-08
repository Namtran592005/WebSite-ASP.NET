<%@ Page Title="Tìm bản tin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="timbantin.aspx.cs" Inherits="bantin.timbantin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- ================= TÌM BẢN TIN (tìm trong trang, AutoPostBack) ================= --%>
    <div class="section-head"><i class="fa-solid fa-magnifying-glass"></i>Tìm bản tin</div>
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnGo" CssClass="input-group search-square mb-3">
        <asp:TextBox ID="txttimkiemtrongtrang" runat="server" CssClass="form-control" placeholder="Nhập tên bản tin..." TextMode="Search" ToolTip="Nhập tên bản tin" AutoPostBack="True" OnTextChanged="txttimkiemtrongtrang_TextChanged"></asp:TextBox>
        <asp:Button ID="btnGo" runat="server" CssClass="btn" Text="Tìm" OnClick="txttimkiemtrongtrang_TextChanged" style="display:none;" />
        <span class="input-group-text bg-dark text-white"><i class="fa-solid fa-magnifying-glass"></i></span>
    </asp:Panel>
    <asp:Label ID="Label6" runat="server" CssClass="fw-bold" Text="Kết quả tìm kiếm:"></asp:Label>
    <asp:DataList ID="DataListbantin" runat="server" RepeatLayout="Flow" CssClass="d-flex flex-column gap-3 mt-2">
        <ItemTemplate>
            <article class="news-card">
                <div class="row g-0">
                    <div class="col-md-4">
                        <asp:Image ID="Image3" runat="server" CssClass="img-fluid" ImageUrl='<%# "image/" + Eval("HinhAnh").ToString().Trim() %>' AlternateText='<%# Eval("TieuDe") %>' />
                    </div>
                    <div class="col-md-8 p-3">
                        <h3 class="news-title">
                            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("TieuDe") %>' NavigateUrl='<%# "BantinChitiet.aspx?MaBanTin=" + ((string)Eval("MaBanTin")).Trim() %>'></asp:HyperLink>
                        </h3>
                        <div class="news-meta mb-2"><i class="fa-regular fa-calendar me-1"></i><%# Eval("NgayDangTin","{0:dd/MM/yyyy}") %></div>
                        <p class="news-summary mb-0"><%# Eval("NDTomTat") %></p>
                    </div>
                </div>
            </article>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
