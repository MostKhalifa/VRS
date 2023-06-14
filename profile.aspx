<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="WebApplication2.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1 >Your Profile</h1>
    <form id="form1" runat="server">
       
        <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click1" Text="Payment Info" />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" Text="Available Vehicles" OnClick="Button3_Click" />
        <br />
        <br />
        <asp:Button ID="Button4" runat="server" Text="My Accidents" OnClick="Button4_Click" />
        <br />
        <br />
        <asp:Button ID="Button5" runat="server" Text="Pending Payment" OnClick="Button5_Click" />
    </form>
</body>
</html>
