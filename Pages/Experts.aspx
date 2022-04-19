<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Experts.aspx.cs" Inherits="CNRST.Experts" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href=" https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="css/MasterPage.css" rel="stylesheet" type="text/css" />
    <script src="JS/index.js"></script>
    <title>Experts</title>
    <style> 
        .header_img {

            margin-top:180px;    
            width: 200px;
            height: 200px;
            display: flex;
            justify-content: center;
            border-radius: 50%;
            overflow: hidden
        }

        .header_img img {
            width: 200px
        }
</style>
</head>

<body id="body-pd">
    <form id="form1" runat="server">
        <div>
            <header class="header" id="header">
                <div class="header_toggle"><i class='bx bx-menu' id="header-toggle"></i></div>
                <div class="header_img">
                    
                    <a href="https://www.cnrst.ma/"><img src="https://www.cnrst.ma/images/CNRST/logo_cnrst_2018.png" alt="Logo"/></a>
                </div>
            </header>
            <div class="l-navbar" id="nav-bar">
                <nav class="nav">
                    <div>
                        <a href="#" class="nav_logo"><i class='bx bx-home nav_logo-icon'></i><span class="nav_logo-name">CNRST</span> </a>
                        <div class="nav_list">
                            <a href="Home.aspx" onserverclick="GotoDashboard_Click" class="nav_link active"><i class='bx bx-grid-alt nav_icon'></i><span class="nav_name">Dashboard</span> </a>
                            <a href="Email.aspx" onserverclick="GotoMessage_Click" class="nav_link"><i class='bx bx-message-square-detail nav_icon'></i><span class="nav_name">Messages</span> </a>
                            <a href="Profile.aspx" onserverclick="GotoProfile_Click" class="nav_link"><i class='bx bx-user nav_icon'></i><span class="nav_name">Profile</span> </a>
                        </div>
                    </div>
                    <a runat="server" onserverclick="logout_serverClick" class="nav_link"><i class='bx bx-log-out nav_icon'></i><span class="nav_name">SignOut</span> </a>
                </nav>
            </div>
            <!--Container Main start-->
            <div class="height-100 bg-light">
                 <h2 style="padding:10px;">Assignment</h2>
                <br />
                <asp:Button Text="Download Excel file" runat="server" ID="btnExportToExcel" CssClass="btnExptExl" OnClick="btnExportToExcel_Click" Height="52px" Width="240px" />
                <asp:GridView ID="GridApp_Exp" runat="server" Style="width: 100%; margin-top: 100px;" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="GridExp">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>
            <!--Container Main end-->
        </div>
    </form>
</body>

</html>
