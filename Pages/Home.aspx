<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CNRST.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/Style.css" rel="stylesheet" type="text/css" />
    <title>Dashboard</title>
    <link href=" https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/js/bootstrap-multiselect.min.js"></script>
    <script type="text/javascript">  
        $(function () {
            $('#ListBox1').multiselect({
                includeSelectAllOptions: true
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="css/MasterPage.css" rel="stylesheet" type="text/css" />
    <script src="JS/index.js"></script>
    <style>
        .dropd-container {
            display: flex;
            justify-content: space-around;
        }
            .dropd-container div {
                width: 33%;
                display: inline-block;
            }

        .auto-style1 {
            font-size: x-large;
        }

        .auto-style2 {
            height: 77px;
        }

        .auto-style4 {
            width: 48%;
        }
        .upcontainer {
           
        }

        .auto-style6 {
            font-size: large;
        }
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
            width: 200px;
        }

    </style>
</head>
<body id="body-pd">
    <form id="form1" runat="server" enctype="multipart/form-data">
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
                            <a href="Profile.aspx" onserverclick="GotoProfile_Click" class="nav_link"><i class='bx bx-user nav_icon'></i><span class="nav_name">Profile</span> </a>
                            <a href="Email.aspx" onserverclick="GotoMessage_Click" class="nav_link"><i class='bx bx-message-square-detail nav_icon'></i><span class="nav_name">Messages</span> </a>
                        </div>
                    </div>
                    <a runat="server" onserverclick="logout_serverClick" class="nav_link"><i class='bx bx-log-out nav_icon'></i><span class="nav_name">SignOut</span> </a>
                </nav>
            </div>
            <!--Container Main start-->
            <div class="height-100 bg-light">
                <h2 style="padding:10px;">Dashboard  </h2>
                <br />
                <div class="upcontainer">
                    <div class="upfile1">
                        <strong>
                        <asp:Label ID="Label1" runat="server" Text="Projects: " CssClass="auto-style6"></asp:Label>
                        </strong>
                        <asp:FileUpload ID="FileUpload1" runat="server" Style="margin-bottom: 15px;" Width="261px" accept=".xlsx, .xls" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.xls|.xlsx)$"
                            ControlToValidate="FileUpload1" runat="server" ForeColor="Red" ErrorMessage="Please select a valid Excle file."
                            Display="Dynamic" />
                        <asp:Button ID="BtnUpload" runat="server" OnClick="BtnUpload_Click" Style="margin-bottom: 15px;" Text="Upload" Width="109px" />
                        <asp:Label ID="LblUp1" runat="server" Text="" ForeColor="red"></asp:Label>
                    </div>
                    <div class="auto-style2">
                         <strong>
                         <asp:Label ID="Label2" runat="server" Text="Experts:  " CssClass="auto-style6"></asp:Label>
                         &nbsp;</strong><asp:FileUpload ID="FileUpload2" runat="server" Width="261px" accept=".xlsx, .xls" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.xls|.xlsx)$"
                            ControlToValidate="FileUpload2" runat="server" ForeColor="Red" ErrorMessage="Please select a valid Excle file."
                            Display="Dynamic" />
                        <asp:Button ID="BtnUpload2" runat="server" OnClick="BtnUpload2_Click" Style="margin-bottom: 15px;" Text="Upload" Width="109px" />
                        <asp:Label ID="LblUp2" runat="server" Text="" ForeColor="red"></asp:Label>
                        <br />
                        <br />
                        <br />
                    </div>
                </div>
                <div style="text-align: center; font-size: 20px; color: red; margin-bottom: 10px">
                    <asp:Label Text="" runat="server" ID="lblSelect" />
                </div>
                <div class="dropd-container">
                    <div>
                        <asp:DropDownList ID="DropdApp" runat="server" Height="25px" Width="231px" >
                            <Items>
                                <asp:ListItem Text="--Select Project--" Selected="True" Value="--Select--" />
                            </Items>
                        </asp:DropDownList>
                    </div>
                    <div>
                        <asp:DropDownList ID="DropdComp" runat="server" Height="25px" Width="231px" >
                            <Items>
                                <asp:ListItem Text="--Select--" Selected="True" Value="--Select--" />

                                <asp:ListItem Text="Contains" Value="Contains" />
                            </Items>
                             <Items>
                                <asp:ListItem Text="Not Contains" Value="Not Contains" />
                            </Items>
                        </asp:DropDownList>
                    </div>
                    <div>
                        <asp:DropDownList  ID="DropdExp" runat="server" Height="25px" Width="231px" >
                            <Items>
                                <asp:ListItem Text="--Select Expert--" Selected="True" Value="--Select--" />
                            </Items>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnreset" runat="server" OnClick="btnreset_Click" Text="Reset" Width="67px" />
                        &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnAddToGrid" runat="server" Text="Add" Width="67px" OnClick="btnAddTooCriteriaTable_Click" />
                    </div>
                    <br />
                    <br />
                </div>
                <asp:GridView ID="GridDropDown" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <br />
                <div>
<%--                    <asp:Button ID="btnfilter" runat="server" Height="34px" Text="Filter" Style="margin: 20px 0px;" Width="135px" OnClick="btnfilter_Click" />--%>
                    &nbsp;<asp:Button ID="BtnfilterV2" runat="server" Height="34px" Text="Filter" Style="margin: 20px 0px;" Width="224px" OnClick="BtnfilterFiles_Click" />
                    <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" Height="38px"></asp:ListBox>
                </div>
                <div class="grid-container" style="display: flex;">
                    <div class="auto-style4" style="margin-right: 4%;">
                        <strong><span class="auto-style1">Projects:</span></strong>
                        <asp:GridView ID="GridExl" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" Height="200px">
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
                    <div class="second-grid" style="width: 48%;">
                        <strong><span class="auto-style1">Experts: </span></strong>
                        <asp:GridView ID="SecGrid" runat="server" CellPadding="4" Width="100%" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <!--Container Main end-->
        </div>
    </form>
</body>


</html>
