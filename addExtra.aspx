<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addExtra.aspx.cs" Inherits="WebApplication2.addExtra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add new Extra Item:<br />
            <br />
            Type:<br />
            <asp:TextBox ID="typeBox" runat="server" Height="31px" Width="209px"></asp:TextBox>
            <br />
            <br />
            Rate:<br />
            <asp:TextBox ID="rateBox" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add" Width="97px" OnClick="Button1_Click" />
            <br />
        </div>
    </form>
</body>
</html>
