<%@ Page Title="Hướng dẫn đặt hàng - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="huongdan.aspx.cs" Inherits="bansach.huongdan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .guide-section { margin-bottom: 32px; }
        .guide-heading {
            font-size: 17px;
            font-weight: 700;
            color: #1b4332;
            border-bottom: 2px solid #1b4332;
            padding-bottom: 8px;
            margin-bottom: 12px;
            display: block;
        }
        .guide-text, .guide-section li {
            font-size: 14px;
            line-height: 1.8;
            color: #333;
        }
        .guide-section ul { padding-left: 20px; margin: 8px 0; }
        .guide-section li { margin-bottom: 6px; }
        .guide-step {
            display: flex;
            gap: 16px;
            align-items: flex-start;
            padding: 14px 16px;
            border: 1px solid #d4d4d4;
            background: #fafaf5;
            margin-bottom: 12px;
        }
        .guide-step .num {
            font-size: 20px;
            font-weight: 700;
            color: #fff;
            background: #1b4332;
            width: 36px;
            height: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }
        .guide-step .content { flex: 1; }
        .guide-step-title {
            display: block;
            font-size: 15px;
            font-weight: 700;
            color: #1a1a1a;
            margin-bottom: 4px;
        }
        .guide-step-desc {
            font-size: 14px;
            color: #555;
            line-height: 1.6;
            display: block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label CssClass="page-title" Text="Hướng dẫn đặt hàng" runat="server" />

    <div class="guide-section">
        <asp:Label CssClass="guide-text" Style="margin-bottom:20px; display:block;" Text="Quý khách có thể đặt hàng tại sachweb.vn theo các bước đơn giản sau đây:" runat="server" />

        <div class="guide-step">
            <div class="num">1</div>
            <div class="content">
                <asp:Label CssClass="guide-step-title" Text="Tìm sách" runat="server" />
                <asp:Label CssClass="guide-step-desc" Text="Duyệt danh mục sách theo thể loại hoặc sử dụng thanh tìm kiếm ở đầu trang để tìm cuốn sách bạn muốn mua." runat="server" />
            </div>
        </div>

        <div class="guide-step">
            <div class="num">2</div>
            <div class="content">
                <asp:Label CssClass="guide-step-title" Text="Xem chi tiết và thêm vào giỏ" runat="server" />
                <asp:Label CssClass="guide-step-desc" Text="Nhấp vào sách để xem thông tin chi tiết, mô tả và giá. Nhấn nút 'Thêm vào giỏ hàng' để đưa sách vào giỏ." runat="server" />
            </div>
        </div>

        <div class="guide-step">
            <div class="num">3</div>
            <div class="content">
                <asp:Label CssClass="guide-step-title" Text="Kiểm tra giỏ hàng" runat="server" />
                <asp:Label CssClass="guide-step-desc" Text="Xem lại danh sách sách đã chọn, điều chỉnh số lượng hoặc xoá sản phẩm không cần. Nhấn 'Tiến hành thanh toán' để tiếp tục." runat="server" />
            </div>
        </div>

        <div class="guide-step">
            <div class="num">4</div>
            <div class="content">
                <asp:Label CssClass="guide-step-title" Text="Nhập thông tin giao hàng" runat="server" />
                <asp:Label CssClass="guide-step-desc" Text="Điền họ tên, số điện thoại và địa chỉ nhận hàng. Nếu đã đăng nhập, thông tin sẽ được tự động điền sẵn. Sau đó nhấn 'Xác nhận đặt hàng'." runat="server" />
            </div>
        </div>

        <div class="guide-step">
            <div class="num">5</div>
            <div class="content">
                <asp:Label CssClass="guide-step-title" Text="Hoàn tất đơn hàng" runat="server" />
                <asp:Label CssClass="guide-step-desc" Text="Hệ thống sẽ hiển thị mã đơn hàng và thông báo thành công. Bạn có thể tra cứu đơn hàng bằng số điện thoại tại trang Tra cứu đơn hàng." runat="server" />
            </div>
        </div>
    </div>

    <div class="guide-section">
        <asp:Label CssClass="guide-heading" Text="Phương thức thanh toán" runat="server" />
        <ul>
            <li><asp:Label Text="Thanh toán khi nhận hàng (COD): Trả tiền mặt khi nhận được sách." runat="server" /></li>
            <li><asp:Label Text="Chuyển khoản ngân hàng: Chuyển khoản trước qua tài khoản ngân hàng của sachweb.vn." runat="server" /></li>
        </ul>
    </div>

    <div class="guide-section">
        <asp:Label CssClass="guide-heading" Text="Thời gian giao hàng" runat="server" />
        <ul>
            <li><asp:Label Text="Nội thành: 1-2 ngày làm việc." runat="server" /></li>
            <li><asp:Label Text="Liên tỉnh: 3-5 ngày làm việc." runat="server" /></li>
        </ul>
    </div>
</asp:Content>
