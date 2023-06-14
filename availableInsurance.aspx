<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="availableInsurance.aspx.cs" Inherits="WebApplication2.availableInsurance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <h1>Available Insurance</h1>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Sort by Rate" />
            <br />
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
        <asp:GridView ID="GridView2" runat="server">
        </asp:GridView>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" />
    </form>
</body>
</html>
