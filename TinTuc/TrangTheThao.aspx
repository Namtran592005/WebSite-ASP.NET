<%@ Page Title="Tin Thể Thao" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TrangTheThao.aspx.cs" Inherits="bantin.TrangTheThao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- ================= TIN THỂ THAO (lưới 2 cột) ================= --%>
    <div class="section-head"><i class="fa-solid fa-futbol"></i>Tin thể thao</div>
    <asp:DataList ID="DataListTheThao" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%" CellPadding="0" CellSpacing="0" CssClass="cat-table">
        <ItemStyle Width="50%" VerticalAlign="Top" />
        <ItemTemplate>
                <article class="news-card">
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# "BantinChitiet.aspx?MaBanTin=" + ((string)Eval("MaBanTin")).Trim() %>'>
                        <asp:Image ID="Image3" runat="server" CssClass="img-fluid w-100" Style="height:200px;object-fit:cover;" ImageUrl='<%# "image/" + Eval("HinhAnh").ToString().Trim() %>' AlternateText='<%# Eval("TieuDe") %>' />
                    </asp:HyperLink>
                    <div class="p-3">
                        <h3 class="news-title">
                            <asp:HyperLink ID="hlT" runat="server" Text='<%# Eval("TieuDe") %>' NavigateUrl='<%# "BantinChitiet.aspx?MaBanTin=" + ((string)Eval("MaBanTin")).Trim() %>'></asp:HyperLink>
                        </h3>
                        <div class="news-meta"><i class="fa-regular fa-calendar me-1"></i><%# Eval("NgayDangTin","{0:dd/MM/yyyy}") %></div>
                    </div>
                </article>
        </ItemTemplate>
    </asp:DataList>
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
