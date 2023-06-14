<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateInfo.aspx.cs" Inherits="WebApplication2.updateInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Update your information</h1>
        <p>
            New Name:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
        <p>
            New Address:&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
        <p>
            New Password:
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </p>
        <p>
            New Email:
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </p>
        <p>
            New Phone:
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        </p>
        <br />
        <asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" />
    </form>
</body>
</html>
