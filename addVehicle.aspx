<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addVehicle.aspx.cs" Inherits="WebApplication2.addVehicle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add a new vehicle:<br />
            <br />
            Class:<br />
            <asp:DropDownList ID="DropDownList1" runat="server" Width="117px">
                <asp:ListItem>regular</asp:ListItem>
                <asp:ListItem>tricycle</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Brand:<br />
            <asp:TextBox ID="brandBox" runat="server" Height="34px" Width="181px"></asp:TextBox>
            <br />
            <br />
            Model:<br />
            <asp:TextBox ID="modelBos" runat="server" Height="34px" Width="181px"></asp:TextBox>
            <br />
            <br />
            GPS location:<br />
            <asp:TextBox ID="gpsBox" runat="server" Height="78px" Width="343px"></asp:TextBox>
            <br />
            <br />
            Rate:<br />
            <asp:TextBox ID="rateBox" runat="server" Height="25px" Width="176px"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add" Width="97px" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
