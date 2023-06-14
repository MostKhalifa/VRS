<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addLocation.aspx.cs" Inherits="WebApplication2.addLocation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add new location:<br />
            <br />
            Pin number:<br />
            <asp:TextBox ID="pinNoBox" runat="server"></asp:TextBox>
            <br />
            <br />
            GPS location:<br />
            <asp:TextBox ID="gpsBox" runat="server" Height="78px" Width="343px"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add" Width="97px" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
