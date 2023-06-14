<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdKm.aspx.cs" Inherits="Part2.UpdKm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label2" runat="server" Text="Vehicle ID: "></asp:Label>
            <asp:TextBox ID="vehID" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Type: "></asp:Label>

            <asp:DropDownList ID="Typeddl" runat="server">
                <asp:ListItem>Motor</asp:ListItem>
                <asp:ListItem>Scooter</asp:ListItem>
            </asp:DropDownList>
        </div>

            <asp:Label ID="Label1" runat="server" Text="Update Kilometers left/Battery: "></asp:Label>
            <asp:TextBox ID="upV" runat="server"></asp:TextBox>
            <asp:Button ID="UpB" runat="server" Text="update" OnClick="UpB_Click" />


    </form>
</body>
</html>
