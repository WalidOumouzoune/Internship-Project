<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="CNRST.Email" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href=" https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="css/MasterPage.css" rel="stylesheet" type="text/css" />
    <script src="JS/index.js"></script>
    <title>Send your Email</title>
    <style>
        .form-control{
            width:70%;
            margin-top:3px;
        }
        .login-form{
            margin:20px;
        }
        .auto-style1 {
            font-size: 17px;
        }
        .auto-style2 {
            display: block;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            background-clip: padding-box;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border-radius: .25rem;
            transition: none;
            border: 1px solid #ced4da;
            margin-top: 3px;
            background-color: #fff;
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
                            <a href="Home.aspx" onserverclick="GotoDashboard_Click" class="nav_link "><i class='bx bx-grid-alt nav_icon'></i><span class="nav_name">Dashboard</span> </a>
                            <a href="Profile.aspx" onserverclick="GotoProfile_Click" class="nav_link"><i class='bx bx-user nav_icon'></i><span class="nav_name">Profile</span> </a>
                            <a href="Email.aspx" onserverclick="GotoMessage_Click" class="nav_link active"><i class='bx bx-message-square-detail nav_icon'></i><span class="nav_name">Messages</span> </a>
                        </div>
                    </div>
                    <a causesvalidation="false"  runat="server" onserverclick="logout_serverClick" class="nav_link"><i class='bx bx-log-out nav_icon'></i><span class="nav_name">SignOut</span> </a>
                </nav>
            </div>

            <!--Container Main start-->
            <div class="height-100 bg-light">
                <h2  style="padding:10px;">Messages&nbsp; </h2>
                <h2  style="padding:10px;"><span style="color: rgb(35, 38, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Liberation Sans&quot;, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;" class="auto-style1"><strong>NOTE</strong></span><span style="color: rgb(35, 38, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Liberation Sans&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"> 
                    : Gmail by default prevents access for your e-mail account from custom applications.
                        You can set it up to accept the login from your application <a href="https://myaccount.google.com/lesssecureapps">Click Here</a></span></h2>
                <div class="main">
                        <div class="login-form">
                            <div class="form-group">
                                <label>Email</label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txtform" runat="server" ForeColor="red" />
                                &nbsp;<asp:TextBox ID="txtform" CssClass="form-control" placeholder="Email" runat="server" />
                                <label>Password</label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txtpass" runat="server" ForeColor="red" />
                                <asp:TextBox ID="txtpass" CssClass="form-control" placeholder="Password" runat="server" TextMode="Password"/>
                            </div>
                            <div class="form-group">
                                <label>Mail To&nbsp;&nbsp;&nbsp;&nbsp; </label>
                                <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txtMail" runat="server" ForeColor="red" />
                                &nbsp;<asp:TextBox ID="txtMail" CssClass="form-control" placeholder="Mail to" runat="server" />
                                <label>Subject&nbsp;&nbsp;&nbsp;&nbsp; </label>
                                 <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txtSubject" runat="server" ForeColor="red" />
                                <asp:TextBox ID="txtSubject" CssClass="form-control" placeholder="Subject" runat="server"  />
                                 <label>Message&nbsp;&nbsp;&nbsp;&nbsp; </label>
                                <asp:TextBox placeholder="Message" ID="txtMsg" CssClass="auto-style2 form-control" runat="server" TextMode="MultiLine" />
                                <br />
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <br />
                                <br />
                            </div>
                            <asp:Button Text="Send"  CssClass="btn btn-primary" runat="server" style="width:100px;font-size:20px; margin-top:10px" OnClick="SendMail_Click" />
                            <asp:Label ID="ErrorMsg" Text="" ForeColor="red" runat="server" />
                        &nbsp;&nbsp; <span style="color: rgb(35, 38, 41); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Liberation Sans&quot;, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                            <br />
                            </span></div>
                    <!--Container Main end-->
                </div>
            </div>
        </div>
    </form>
</body>
</html>
