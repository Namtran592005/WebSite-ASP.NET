<%@ Page Title="Chính sách đổi trả - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="chinhsachdoitra.aspx.cs" Inherits="bansach.chinhsachdoitra" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .policy-section { margin-bottom: 32px; }
        .policy-heading {
            font-size: 17px;
            font-weight: 700;
            color: #1b4332;
            border-bottom: 2px solid #1b4332;
            padding-bottom: 8px;
            margin-bottom: 12px;
            display: block;
        }
        .policy-text, .policy-section li {
            font-size: 14px;
            line-height: 1.8;
            color: #333;
        }
        .policy-section ul { padding-left: 20px; margin: 8px 0; }
        .policy-section li { margin-bottom: 6px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label CssClass="page-title" Text="Chính sách đổi trả" runat="server" />

    <div class="policy-section">
        <asp:Label CssClass="policy-heading" Text="1. Điều kiện đổi trả" runat="server" />
        <asp:Label CssClass="policy-text" Text="sachweb.vn chấp nhận đổi hoặc trả lại sách trong các trường hợp sau:" runat="server" />
        <ul>
            <li><asp:Label Text="Sách bị lỗi in ấn, nhầm trang, thiếu trang." runat="server" /></li>
            <li><asp:Label Text="Sách bị hỏng do quá trình vận chuyển (nhăn nát, rách, ướt)." runat="server" /></li>
            <li><asp:Label Text="Sách không đúng với đơn hàng đã đặt." runat="server" /></li>
            <li><asp:Label Text="Thời gian yêu cầu đổi trả trong vòng 7 ngày kể từ ngày nhận hàng." runat="server" /></li>
        </ul>
    </div>

    <div class="policy-section">
        <asp:Label CssClass="policy-heading" Text="2. Quy trình đổi trả" runat="server" />
        <asp:Label CssClass="policy-text" Text="Để yêu cầu đổi trả, quý khách vui lòng thực hiện các bước sau:" runat="server" />
        <ul>
            <li><asp:Label Text="Liên hệ với bộ phận Chăm sóc khách hàng qua hotline hoặc email info@sachweb.vn." runat="server" /></li>
            <li><asp:Label Text="Cung cấp mã đơn hàng và hình ảnh sách lỗi (nếu có)." runat="server" /></li>
            <li><asp:Label Text="Nhân viên sẽ xác nhận và hướng dẫn gửi hàng trả lại." runat="server" /></li>
            <li><asp:Label Text="Sau khi nhận được sách trả, chúng tôi sẽ xử lý hoàn tiền hoặc gửi sách mới trong vòng 3-5 ngày." runat="server" /></li>
        </ul>
    </div>

    <div class="policy-section">
        <asp:Label CssClass="policy-heading" Text="3. Phí đổi trả" runat="server" />
        <ul>
            <li><asp:Label Text="Miễn phí đổi trả nếu lỗi do nhà sản xuất hoặc do sachweb.vn." runat="server" /></li>
            <li><asp:Label Text="Khách hàng chịu phí vận chuyển nếu đổi trả do thay đổi nhu cầu cá nhân." runat="server" /></li>
        </ul>
    </div>

    <div class="policy-section">
        <asp:Label CssClass="policy-heading" Text="4. Hình thức hoàn tiền" runat="server" />
        <ul>
            <li><asp:Label Text="Hoàn tiền qua chuyển khoản ngân hàng trong vòng 5-7 ngày làm việc." runat="server" /></li>
            <li><asp:Label Text="Hoặc quý khách có thể chọn nhận voucher mua hàng với giá trị bằng 110% giá trị sách trả." runat="server" /></li>
        </ul>
    </div>
</asp:Content>
