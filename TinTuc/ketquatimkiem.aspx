<%@ Page Title="Kết quả tìm kiếm" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ketquatimkiem.aspx.cs" Inherits="bantin.ketquatimkiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- ================= KẾT QUẢ TÌM KIẾM (nhận keyword từ Site.Master) ================= --%>
    <div class="section-head"><i class="fa-solid fa-magnifying-glass"></i>Kết quả tìm kiếm</div>
    <asp:DataList ID="DataListbantin" runat="server" RepeatLayout="Flow" CssClass="d-flex flex-column gap-3">
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
    <div class="text-center mt-3">
        <asp:Label ID="lberror" runat="server" CssClass="alert alert-dark d-inline-block"></asp:Label>
    </div>
</asp:Content>
