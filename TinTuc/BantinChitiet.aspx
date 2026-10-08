<%@ Page Title="Chi tiết bản tin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BantinChitiet.aspx.cs" Inherits="bantin.BantinChitiet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- ================= CHI TIẾT BẢN TIN =================
         1 dòng/bài: badge lĩnh vực -> tiêu đề -> meta -> sapo -> ảnh -> nội dung. --%>
    <nav class="small mb-3 article-meta"><a href="trangchu.aspx" class="text-decoration-none"><i class="fa-solid fa-house me-1"></i>Trang chủ</a> <span class="mx-1">/</span> <span class="text-muted">Chi tiết tin</span></nav>
    <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" CssClass="d-flex flex-column gap-3">
        <ItemTemplate>
            <article class="article-wrap p-3 p-md-4">
                <span class="badge bg-dark mb-2 article-meta" style="letter-spacing:1px;"><i class="fa-solid fa-tag me-1"></i><%# Eval("MaLinhVuc") %></span>
                <h1 class="article-title mb-2"><%# Eval("TieuDe") %></h1>
                <div class="article-meta news-meta d-flex flex-wrap gap-2 align-items-center mb-3">
                    <span><i class="fa-solid fa-user-pen me-1"></i>Ban biên tập</span>
                    <span><i class="fa-regular fa-calendar ms-2 me-1"></i><%# Eval("NgayDangTin","{0:dd/MM/yyyy}") %></span>
                    <span><i class="fa-regular fa-clock ms-2 me-1"></i><%# Eval("NgayDangTin","{0:HH:mm}") %></span>
                </div>
                <p class="article-sapo mb-3"><%# Eval("NDTomTat") %></p>
                <figure class="article-figure my-3">
                    <asp:Image ID="Image2" runat="server" CssClass="img-fluid" ImageUrl='<%# "image/" + Eval("HinhAnh").ToString().Trim() %>' AlternateText='<%# Eval("TieuDe") %>' />
                    <figcaption class="article-cap text-center mt-2 px-2"><%# Eval("ChuThichHinh") %></figcaption>
                </figure>
                <div class="article-body"><%# Eval("NoiDung") %></div>
                <hr class="my-4" />
                <div class="d-flex flex-wrap gap-2 justify-content-between align-items-center">
                    <a href="trangchu.aspx" class="btn btn-classic btn-square btn-sm"><i class="fa-solid fa-arrow-left me-1"></i>Về trang chủ</a>
                    <div class="article-meta small text-muted">Chia sẻ:
                        <a href="#" class="ms-2 text-dark"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" class="ms-2 text-dark"><i class="fa-brands fa-x-twitter"></i></a>
                        <a href="#" class="ms-2 text-dark"><i class="fa-solid fa-link"></i></a>
                    </div>
                </div>
            </article>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
