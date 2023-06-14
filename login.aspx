<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication2.login" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please login using your email and password:<br />
            <br />
            E-mail:</div>
        <asp:TextBox ID="emailBox" runat="server" Height="30px" Width="230px"></asp:TextBox>
        <br />
        <br />
        <br />
        Password:<br />
        <asp:TextBox ID="passBox" runat="server" Height="30px" Width="230px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="loginBtn" runat="server" Text="login" Width="79px" OnClick="loginBtn_Click" />
        <br />
        <br />
        <br />
        <br />
        Don&#39;t have an account? Press the below button to sign up<br />
        <asp:Button ID="regBtn" runat="server" Text="Register" Width="79px" OnClick="regBtn_Click" />
        <br />
        <br />
        <br />
        <br />
        <br />
        &nbsp;<asp:Button ID="cusBtn" runat="server"  Text="View all available customers" Width="232px" OnClick="cusBtn_Click" Height="62px" />
        <br />
        <br />
        <br />
        <br />
         &nbsp;Number of available vehicles:
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
&nbsp;Number of total rents:
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <br />
    </form>
</body>
</html>
