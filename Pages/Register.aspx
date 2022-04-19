<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CNRST.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Resgister</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrapCss"/>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="css/Login.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidenav">
            <div class="login-main-text">
                <h2>Application<br />
                    Register Page</h2>
                <p>Login or register from here to access your account</p>
            </div>
        </div>
        <div class="main">
            <div class="col-md-6 col-sm-12">
                <div class="login-form">
                    <div class="form-group">
                        <label>Name</label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="TxtName" runat="server" ForeColor="red" />
                        &nbsp;<asp:TextBox ID="TxtName" CssClass="form-control" placeholder="Name" runat="server" />
                        <label>User Name</label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="UserText" runat="server" ForeColor="red" />
                        &nbsp;<asp:TextBox ID="UserText" CssClass="form-control" placeholder="User Name" runat="server" />
                        <asp:RegularExpressionValidator ID="validateEmail"
                            runat="server" ErrorMessage="Invalid email."
                            ControlToValidate="UserText"
                            ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" Style="color: red;" />
                    </div>
                    <div class="form-group">
                        <label>Password&nbsp;&nbsp;&nbsp;&nbsp; </label>
                        <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="PassText" runat="server" ForeColor="red" />

                        &nbsp;<asp:TextBox ID="PassText" CssClass="form-control" placeholder="Password" runat="server" TextMode="Password" />
                        <asp:RegularExpressionValidator ID="RegExp1" runat="server" ErrorMessage="Password length must be between 7 to 14 characters"
                            ControlToValidate="PassText" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{7,14}$" ForeColor="red" />

                    </div>
                    <asp:Button Text="Register" ID="Btnregister" CssClass="btn btn-secondary" runat="server" OnClick="Btnregister_Click"  />
                    <asp:Button Text="Login" CssClass="btn btn-primary" runat="server" CausesValidation="false" OnClick="BtnSign_Click"/>
                    <asp:Label ID="ErrorMsg" Text="" ForeColor="red" runat="server" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
