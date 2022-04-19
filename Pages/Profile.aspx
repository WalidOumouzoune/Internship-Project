<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="CNRST.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href=" https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="css/MasterPage.css" rel="stylesheet" type="text/css" />
    <script src="JS/index.js"></script>
    <title>Profile Settings</title>
    <style>
        .form-control{
            width:70%;
            margin-bottom:8px;
        }
        .login-form{
            margin:20px;
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
                    <a href="https://www.cnrst.ma/">
                    <a href="https://www.cnrst.ma/"><img src="https://www.cnrst.ma/images/CNRST/logo_cnrst_2018.png" alt="Logo"/></a>
                </div>
            </header>
            <div class="l-navbar" id="nav-bar">
                <nav class="nav">
                    <div>
                        <a href="#" class="nav_logo"><i class='bx bx-home nav_logo-icon'></i><span class="nav_logo-name">CNRST</span> </a>
                        <div class="nav_list">
                            <a href="Home.aspx" onserverclick="GotoDashboard_Click" class="nav_link "><i class='bx bx-grid-alt nav_icon'></i><span class="nav_name">Dashboard</span> </a>
                            <a href="Profile.aspx" onserverclick="GotoProfile_Click" class="nav_link active"><i class='bx bx-user nav_icon'></i><span class="nav_name">Profile</span> </a>
                            <a href="Email.aspx" onserverclick="GotoMessage_Click" class="nav_link"><i class='bx bx-message-square-detail nav_icon'></i><span class="nav_name">Messages</span> </a>
                        </div>
                    </div>
                    <a causesvalidation="false" runat="server" onserverclick="logout_serverClick" class="nav_link"><i class='bx bx-log-out nav_icon'></i><span class="nav_name">SignOut</span> </a>
                </nav>
            </div>
            <!--Container Main start-->
            <div class="height-100 bg-light">
                <h2 style="padding: 10px;">Profile&nbsp; </h2>
                <div class="main">
                    <div class="login-form">
                        <div class="form-group">
                            <label>Email</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email" runat="server" Enabled="False" />

                            Current Password&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="CurrentPass" runat="server" ForeColor="red" />
                            <asp:TextBox ID="CurrentPass" CssClass="form-control" placeholder="Password" runat="server" TextMode="Password" />
                        </div>
                        <div class="form-group">
                            <label>New Password&nbsp;&nbsp;&nbsp;&nbsp; </label>
                            &nbsp;<label><asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txtNewPass" runat="server" ForeColor="red" />
                                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password length must be between 7 to 14 characters"
                                    ControlToValidate="txtNewPass" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,14}$" ForeColor="red" />
                            </label>
                            <asp:TextBox ID="txtNewPass" CssClass="form-control" placeholder="New Password" runat="server" />
                            <label>
                                Confirm Password&nbsp;&nbsp;&nbsp;&nbsp; 
                                <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txtCofirmPass" runat="server" ForeColor="red" />
                            </label>
                            <asp:TextBox ID="txtCofirmPass" CssClass="form-control" placeholder="Confirm Password" runat="server" />
                            <br />
                            <asp:CompareValidator ID="comparePasswords" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtCofirmPass" ErrorMessage="Your passwords do not match up!" ForeColor="red" />
                            
                        </div>
                        <asp:Button Text="Save" CssClass="btn btn-primary" runat="server" Style="width: 100px; font-size: 20px; margin-top: 10px" ID="SaveUserInfo" OnClick="SaveUserInfo_Click" />
                        &nbsp;<asp:Label ID="ErrorMsg" Text="" ForeColor="red" runat="server" />
                        &nbsp;&nbsp; <span style="color: rgb(35, 38, 41); font-family: -apple-system, BlinkMacSystemFont, &quot; segoe ui&quot; , &quot; liberation sans&quot; , sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                            <br />
                        </span>
                    </div>
                    <!--Container Main end-->
                </div>
            </div>
        </div>
    </form>
</body>
</html>
