<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="trangchu.aspx.cs" Inherits="bantin.trangchu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- ================= TRANG CHỦ =================
         Khối 1: DataListbantin  -> danh sách tin mới (card ngang)
         Khối 2: DataListLienquan -> tin liên quan (list-group)
         Runtime render giống web, chỉ thêm comment để dễ nhìn trong Visual. --%>
    <%-- ===== Khối 1: TIN MỚI NHẤT ===== --%>
    <div class="section-head"><i class="fa-solid fa-newspaper"></i>Tin mới nhất</div>
    <asp:DataList ID="DataListbantin" runat="server" RepeatLayout="Flow" RepeatDirection="Vertical" CssClass="d-flex flex-column gap-3">
        <ItemTemplate>
            <article class="news-card">
                <div class="row g-0">
                    <div class="col-md-4">
                        <asp:HyperLink ID="hlImg" runat="server" NavigateUrl='<%# "BantinChitiet.aspx?MaBanTin=" + ((string)Eval("MaBanTin")).Trim() %>'>
                            <asp:Image ID="Image3" runat="server" CssClass="img-fluid" ImageUrl='<%# "image/" + Eval("HinhAnh").ToString().Trim() %>' AlternateText='<%# Eval("TieuDe") %>' />
                        </asp:HyperLink>
                    </div>
                    <div class="col-md-8 p-3">
                        <h3 class="news-title">
                            <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("TieuDe") %>' NavigateUrl='<%# "BantinChitiet.aspx?MaBanTin=" + ((string)Eval("MaBanTin")).Trim() %>'></asp:HyperLink>
                        </h3>
                        <div class="news-meta mb-2"><i class="fa-regular fa-calendar me-1"></i><%# Eval("NgayDangTin","{0:dd/MM/yyyy}") %> &nbsp;|&nbsp; <i class="fa-solid fa-tag me-1"></i><%# Eval("MaLinhVuc") %></div>
                        <p class="news-summary mb-2"><%# Eval("NDTomTat") %></p>
                        <asp:HyperLink ID="hlMore" runat="server" CssClass="btn btn-classic btn-square btn-sm" NavigateUrl='<%# "BantinChitiet.aspx?MaBanTin=" + ((string)Eval("MaBanTin")).Trim() %>' Text="Đọc tiếp"></asp:HyperLink>
                    </div>
                </div>
            </article>
        </ItemTemplate>
    </asp:DataList>

    <%-- ===== Khối 2: TIN LIÊN QUAN ===== --%>
    <div class="section-head mt-4"><i class="fa-solid fa-link"></i>Tin tức liên quan</div>
    <div class="side-box">
        <div class="list-group list-group-flush">
            <asp:DataList ID="DataListLienquan" runat="server" RepeatLayout="Flow" CssClass="list-group list-group-flush">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="list-group-item list-group-item-action" NavigateUrl='<%# "BantinChitiet.aspx?MaBanTin=" + ((string)Eval("MaBanTin")).Trim() %>'><i class="fa-solid fa-angle-right me-2"></i><%# Eval("TieuDe") %></asp:HyperLink>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
