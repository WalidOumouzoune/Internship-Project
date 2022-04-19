<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="CNRST._404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/main.css" rel="stylesheet" />
    <style> 
        #Button404 {
            height: 60px;
            width: 260px;
            position: absolute;
            top: 40%;
            left: 50%;
            transform: translate(-50%, -50%);
            outline: none;
            border: none;
            font-size: 30px;
            z-index:999;
            cursor:pointer;
}
    </style>
</head>
<body id="ErrorPage">
    <form id="form1" runat="server">
        <asp:Button ID="Button404" runat="server" Text="GO Back Home" OnClick="Button404_Click" />
    <div class="cont_principal">
        <div class="cont_error">
            <h1>Oops</h1>
            <p>The Page you're looking for isn't here.</p>
        </div>
        <div class="cont_aura_1"></div>
        <div class="cont_aura_2"></div>
    </div>
    </form>
</body>
    <script>
        window.onload = function () {
            document.querySelector('.cont_principal').className= "cont_principal cont_error_active";
        }
</script>
</html>
