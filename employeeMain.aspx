<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employeeMain.aspx.cs" Inherits="WebApplication2.employeeMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="profileBtn" runat="server" Height="72px" Text="My Profile" Width="222px" OnClick="profileBtn_Click" />
            <br />
            <br />
            <br />
            <br />
            Add new:<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="19px" Width="151px">
                <asp:ListItem>Extra</asp:ListItem>
                <asp:ListItem>Vehicle</asp:ListItem>
                <asp:ListItem>Location</asp:ListItem>
                <asp:ListItem>Insurance</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text="Add" OnClick="Button4_Click1" Width="65px" />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Height="36px" Text="Update the status of a vehicle" Width="248px" OnClick="Button3_Click" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Height="64px" Width="248px" Text="List all currently rented vehicles" OnClick="Button1_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server"  Height="64px" Width="248px" Text="customers renting vehicles" OnClick="Button2_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button6" runat="server" Height="64px" Width="248px" Text="Unavailable Vehicles" OnClick="Button6_Click" />
            <br />
            <br />
            <asp:Button ID="updateExtra" runat="server" Height="64px" Text="Update an Extra" Width="248px" OnClick="updateExtra_Click" />
            <br />
            <br />
             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;(MM/DD/YYYY)&nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" Text="Remove Payment" OnClick="Button5_Click" />
            <br />
            <br />
            <asp:Button ID="listSuperCustomers" runat ="server" Height="64px" Text ="View customers who have rented all vehicles" Width="248px" OnClick="custRentAll_Click" />    
        </div>
    </form>
</body>
</html>
