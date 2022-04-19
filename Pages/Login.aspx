<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CNRST.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrapCss"/>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="css/Login.css" rel="stylesheet" type="text/css" />
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidenav">
            <div class="login-main-text">
                <h2>Application<br />
                    Login Page</h2>
                <p>Login or register from here to access your account</p>
            </div>
        </div>
        <div class="main">
            <div class="col-md-6 col-sm-12">
                <div class="login-form">
                    <div class="form-group">
                        <label>User Name</label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="UserText" runat="server" ForeColor="red" />
                        &nbsp;<asp:TextBox ID="UserText" CssClass="form-control" placeholder="User Name" runat="server" />
                        <asp:RegularExpressionValidator ID="validateEmail"
                            runat="server" ErrorMessage="Invalid email."
                            ControlToValidate="UserText"
                            ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Style="color: red;" />
                    </div>
                    <div class="form-group">
                        <label>Password&nbsp;&nbsp;&nbsp;&nbsp; </label>
                        <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="PassText" runat="server" ForeColor="red"/>
                    &nbsp;<asp:TextBox ID="PassText" CssClass="form-control"  placeholder="Password" runat="server" TextMode="Password"/>
                   
                    </div>
                    <asp:Button ID="SignServer" Text="Login" CssClass="btn btn-primary" runat="server" OnClick="SignServer_Click" />
                    <asp:Button Text="Register" ID="Btnregister" CssClass="btn btn-secondary" runat="server" causesvalidation="false" OnClick="Btnregister_Click"/>
                    <asp:Label Text="" ID="LblEmailPass" ForeColor="red" runat="server" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
