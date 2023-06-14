<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rentVehicle.aspx.cs" Inherits="WebApplication2.rentVehicle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Rent a Vehicle</h1>
        Model:<br />
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        Insurance:<br />
        <asp:DropDownList ID="DropDownList2" runat="server" >
        </asp:DropDownList>
        <br />
        <br />
        Time:<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <p>
            Destination:</p>
        <p>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Rent" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" />
    </form>
</body>
</html>
