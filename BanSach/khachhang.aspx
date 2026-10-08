<%@ Page Title="Thông tin khách hàng - sachweb.vn" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="khachhang.aspx.cs" Inherits="bansach.Khachhang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .kh-wrap { max-width: 900px; margin: 0 auto; }
        .kh-box { background: #fafaf5; border: 1px solid #d4d4d4; padding: 20px; margin-bottom: 16px; }
        .kh-profile { display: flex; gap: 16px; align-items: center; flex-wrap: wrap; }
        .kh-avatar { width: 60px; height: 60px; background: #1b4332; color: #fff; font-size: 24px; font-weight: 700; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
        .kh-name { font-size: 17px; font-weight: 700; color: #1a1a1a; }
        .kh-meta { font-size: 13px; color: #555; margin-top: 2px; }
        .kh-rank { display: inline-block; margin-top: 6px; font-size: 12px; font-weight: 700; color: #1b4332; border: 1px solid #1b4332; padding: 2px 10px; text-transform: uppercase; letter-spacing: .5px; }
        .kh-stats { display: grid; grid-template-columns: repeat(4, 1fr); gap: 0; border: 1px solid #d4d4d4; margin-bottom: 16px; background: #fff; }
        .kh-stat { padding: 14px 10px; text-align: center; border-right: 1px solid #e8e8e0; }
        .kh-stat:last-child { border-right: none; }
        .kh-stat .num { font-size: 18px; font-weight: 700; color: #1b4332; display: block; }
        .kh-stat .cap { font-size: 12px; color: #6b7280; display: block; margin-top: 2px; }
        .kh-toolbar { display: flex; gap: 10px; align-items: center; margin-bottom: 16px; flex-wrap: wrap; }
        .kh-toolbar .form-control-custom { height: 38px; }
        .kh-order { border: 1px solid #d4d4d4; background: #fff; margin-bottom: 12px; }
        .kh-order-head { display: flex; align-items: center; gap: 10px; padding: 10px 14px; background: #fafaf5; border-bottom: 1px solid #d4d4d4; flex-wrap: wrap; }
        .kh-order-id { font-weight: 700; color: #1b4332; font-size: 14px; }
        .kh-order-date { font-size: 12px; color: #6b7280; }
        .kh-badge { font-size: 11px; font-weight: 700; padding: 2px 10px; border: 1px solid; text-transform: uppercase; white-space: nowrap; }
        .kh-badge.pending { background: #fff3cd; color: #856404; border-color: #ffeeba; }
        .kh-badge.done { background: #d4edda; color: #155724; border-color: #c3e6cb; }
        .kh-badge.cancel { background: #f8d7da; color: #721c24; border-color: #f5c6cb; }
        .kh-order-total { margin-left: auto; font-weight: 700; color: #dc3545; font-size: 15px; white-space: nowrap; }
        .kh-item { display: flex; gap: 12px; padding: 10px 14px; border-bottom: 1px solid #e8e8e0; align-items: center; }
        .kh-item:last-child { border-bottom: none; }
        .kh-item img { width: 44px; height: 60px; object-fit: cover; border: 1px solid #d4d4d4; }
        .kh-item-name { font-weight: 600; font-size: 13px; }
        .kh-item-meta { font-size: 12px; color: #6b7280; }
        .kh-item-money { margin-left: auto; font-weight: 700; font-size: 13px; white-space: nowrap; }
        .kh-order-foot { display: flex; gap: 8px; padding: 10px 14px; border-top: 1px solid #e8e8e0; flex-wrap: wrap; align-items: center; }
        .kh-order-addr { font-size: 12px; color: #6b7280; flex: 1; min-width: 200px; }
        .kh-btn { font-size: 12px; font-weight: 700; padding: 6px 14px; border: 1px solid #1b4332; background: #fff; color: #1b4332; cursor: pointer; }
        .kh-btn:hover { background: #1b4332; color: #fff; }
        .kh-btn.solid { background: #1b4332; color: #fff; }
        .kh-btn.solid:hover { background: #2d6a4f; }
        .kh-btn.danger { border-color: #dc3545; color: #dc3545; }
        .kh-btn.danger:hover { background: #dc3545; color: #fff; }
        .kh-btn:disabled { opacity: .5; cursor: not-allowed; }
        .kh-paging { display: flex; align-items: center; justify-content: center; gap: 12px; margin: 16px 0 4px; }
        .kh-empty { text-align: center; padding: 40px 20px; border: 1px solid #d4d4d4; background: #fff; }
        @media (max-width: 767.98px) {
            .kh-stats { grid-template-columns: repeat(2, 1fr); }
            .kh-stat:nth-child(2) { border-right: none; }
            .kh-stat { border-bottom: 1px solid #e8e8e0; }
            .kh-order-total { margin-left: 0; }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="kh-wrap">
        <asp:Label CssClass="page-title" Text="Thông tin khách hàng" runat="server" />
        <asp:Label ID="lblMsg" runat="server" CssClass="form-error" Style="display:block;margin-bottom:12px;" />

        <!-- Chưa đăng nhập -->
        <asp:Panel ID="pnlRequireLogin" runat="server" Visible="false" CssClass="kh-empty">
            <strong>Vui lòng đăng nhập để xem thông tin khách hàng.</strong>
            <div class="mt-3 d-flex gap-2 justify-content-center flex-wrap">
                <a href="Dangnhap.aspx" class="btn-primary" style="padding:10px 30px;text-decoration:none;">ĐĂNG NHẬP</a>
                <a href="Dangky.aspx" class="kh-btn" style="padding:10px 30px;text-decoration:none;display:inline-block;">ĐĂNG KÝ</a>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlInfo" runat="server" Visible="false">
            <!-- Hồ sơ -->
            <div class="kh-box">
                <div class="kh-profile">
                    <div class="kh-avatar"><asp:Label ID="lblAvatar" runat="server" Text="K" /></div>
                    <div style="flex:1;min-width:200px;">
                        <div class="kh-name"><asp:Label ID="lblTen" runat="server" /></div>
                        <div class="kh-meta">Tài khoản: <asp:Label ID="lblTaiKhoan" runat="server" /> · SĐT: <asp:Label ID="lblSDT" runat="server" /></div>
                        <div class="kh-meta">Địa chỉ: <asp:Label ID="lblDiaChi" runat="server" /></div>
                        <asp:Label ID="lblHang" runat="server" CssClass="kh-rank" Text="Thành viên Đồng" />
                    </div>
                    <asp:Button ID="btnToggleEdit" runat="server" Text="Cập nhật" CssClass="kh-btn" OnClick="btnToggleEdit_Click" />
                </div>
            </div>

            <!-- Form cập nhật -->
            <asp:Panel ID="pnlEdit" runat="server" Visible="false" CssClass="kh-box" Style="background:#fff;">
                <asp:Label CssClass="section-title" Text="Cập nhật thông tin liên hệ" runat="server" />
                <div class="row g-2">
                    <div class="col-md-4">
                        <asp:Label CssClass="form-label" Text="Họ tên" runat="server" />
                        <asp:TextBox ID="txtEditTen" runat="server" CssClass="form-control-custom" MaxLength="50" />
                    </div>
                    <div class="col-md-4">
                        <asp:Label CssClass="form-label" Text="Số điện thoại" runat="server" />
                        <asp:TextBox ID="txtEditSDT" runat="server" CssClass="form-control-custom" MaxLength="15" />
                    </div>
                    <div class="col-md-4">
                        <asp:Label CssClass="form-label" Text="Địa chỉ giao hàng" runat="server" />
                        <asp:TextBox ID="txtEditDiaChi" runat="server" CssClass="form-control-custom" MaxLength="100" />
                    </div>
                </div>
                <div class="mt-3 d-flex gap-2 align-items-center flex-wrap">
                    <asp:Button ID="btnCapNhat" runat="server" Text="LƯU THAY ĐỔI" CssClass="btn-primary" OnClick="btnCapNhat_Click" />
                    <asp:Label ID="lblEditMsg" runat="server" CssClass="form-success" />
                </div>
            </asp:Panel>

            <!-- Thống kê -->
            <div class="kh-stats">
                <div class="kh-stat">
                    <span class="num"><asp:Label ID="lblStatTongDon" runat="server" Text="0" /></span>
                    <span class="cap">Tổng đơn hàng</span>
                </div>
                <div class="kh-stat">
                    <span class="num"><asp:Label ID="lblStatTongTien" runat="server" Text="0 đ" /></span>
                    <span class="cap">Tổng chi tiêu</span>
                </div>
                <div class="kh-stat">
                    <span class="num"><asp:Label ID="lblStatChoXuLy" runat="server" Text="0" /></span>
                    <span class="cap">Chờ xử lý</span>
                </div>
                <div class="kh-stat">
                    <span class="num"><asp:Label ID="lblStatHoanThanh" runat="server" Text="0" /></span>
                    <span class="cap">Đã hoàn thành</span>
                </div>
            </div>

            <!-- Lọc đơn -->
            <asp:Label CssClass="section-title" Text="Lịch sử đơn hàng" runat="server" />
            <div class="kh-toolbar">
                <asp:DropDownList ID="ddlLoc" runat="server" CssClass="form-control-custom" Style="width:auto;min-width:160px;" AutoPostBack="true" OnSelectedIndexChanged="ddlLoc_SelectedIndexChanged">
                    <asp:ListItem Text="Tất cả trạng thái" Value="" />
                    <asp:ListItem Text="Chưa xử lý" Value="Chưa xử lý" />
                    <asp:ListItem Text="Đã xử lý" Value="Đã xử lý" />
                    <asp:ListItem Text="Đã huỷ" Value="Đã huỷ" />
                </asp:DropDownList>
                <asp:DropDownList ID="ddlSapXep" runat="server" CssClass="form-control-custom" Style="width:auto;min-width:160px;" AutoPostBack="true" OnSelectedIndexChanged="ddlSapXep_SelectedIndexChanged">
                    <asp:ListItem Text="Mới nhất trước" Value="MOINHAT" />
                    <asp:ListItem Text="Cũ nhất trước" Value="CUNHAT" />
                    <asp:ListItem Text="Giá trị cao trước" Value="GIACAO" />
                    <asp:ListItem Text="Giá trị thấp trước" Value="GIATHAP" />
                </asp:DropDownList>
            </div>

            <!-- Danh sách đơn -->
            <asp:Repeater ID="rptDonHang" runat="server" OnItemDataBound="rptDonHang_ItemDataBound" OnItemCommand="rptDonHang_ItemCommand">
                <ItemTemplate>
                    <div class="kh-order">
                        <div class="kh-order-head">
                            <span class="kh-order-id">#HD<%# Eval("MAHD", "{0:D5}") %></span>
                            <span class="kh-order-date"><%# Eval("NGAYDAT", "{0:dd/MM/yyyy HH:mm}") %></span>
                            <span class='<%# GetBadgeClass(Eval("TINHTRANG")) %>'><%# Eval("TINHTRANG") %></span>
                            <span class="kh-order-total"><%# string.Format("{0:N0} đ", Eval("TONGTIEN")) %></span>
                        </div>
                        <asp:Repeater ID="rptChiTiet" runat="server">
                            <ItemTemplate>
                                <div class="kh-item">
                                    <asp:Image runat="server" ImageUrl='<%# "image/upload/" + Eval("HINHANH") %>' AlternateText='<%# Eval("TENSACH") %>' />
                                    <div>
                                        <div class="kh-item-name"><%# Eval("TENSACH") %></div>
                                        <div class="kh-item-meta">Mã: <%# Eval("MASACH") %> · SL: <%# Eval("SOLUONG") %> · <%# string.Format("{0:N0} đ", Eval("DONGIA")) %></div>
                                    </div>
                                    <div class="kh-item-money"><%# string.Format("{0:N0} đ", Eval("THANHTIEN")) %></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div class="kh-order-foot">
                            <span class="kh-order-addr"><%# Eval("TENKHACHHANG") %> — <%# Eval("DIACHIGIAOHANG") %></span>
                            <asp:Button runat="server" Text="Mua lại" CssClass="kh-btn solid" CommandName="MuaLai" CommandArgument='<%# Eval("MAHD") %>' />
                            <asp:Button runat="server" Text="Huỷ đơn" CssClass="kh-btn danger" CommandName="HuyDon"
                                CommandArgument='<%# Eval("MAHD") %>' Visible='<%# Eval("TINHTRANG").ToString() == "Chưa xử lý" %>'
                                OnClientClick="return confirm('Bạn chắc chắn muốn huỷ đơn hàng này?');" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="kh-empty">
                <strong>Chưa có đơn hàng nào.</strong>
                <div class="text-muted" style="font-size:13px;">Hãy mua sắm để đơn hàng hiển thị tại đây.</div>
                <div class="mt-3"><a href="trangchu.aspx" class="btn-primary" style="padding:10px 30px;text-decoration:none;">MUA SẮM NGAY</a></div>
            </asp:Panel>

            <asp:Panel ID="pnlPaging" runat="server" Visible="false" CssClass="kh-paging">
                <asp:Button ID="btnPrev" runat="server" Text="← Trước" CssClass="kh-btn" OnClick="btnPrev_Click" />
                <asp:Label ID="lblPage" runat="server" Style="font-size:13px;font-weight:600;" />
                <asp:Button ID="btnNext" runat="server" Text="Sau →" CssClass="kh-btn" OnClick="btnNext_Click" />
            </asp:Panel>
        </asp:Panel>
    </div>
</asp:Content>
