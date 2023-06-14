<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="availableVehicles.aspx.cs" Inherits="WebApplication2.availableVehicles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Available Vehicles</h1>
            <asp:Button ID="Button1" runat="server" Text="Sort by Brand" OnClick="Button1_Click" />
&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Sort by Class" OnClick="Button2_Click" />
&nbsp;
            <asp:Button ID="Button3" runat="server" Text="Sort by Rate" OnClick="Button3_Click" />
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
        <asp:GridView ID="GridView2" runat="server">
        </asp:GridView>
        <br />
        <br />
        <asp:Button ID="Button4" runat="server" Text="Not Rented Before" OnClick="Button4_Click" />
        <br />
        <br />
        <asp:Button ID="Button5" runat="server" Text="Available Insurance" OnClick="Button5_Click" />
        <br />
        <br />
        <asp:Button ID="Button6" runat="server" Text="Rent a Vehicle" OnClick="Button6_Click" />
        <br />
        <br />
        <asp:Button ID="Button7" runat="server" Text="Back" OnClick="Button7_Click" />
    </form>
</body>
</html>
