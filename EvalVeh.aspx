<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EvalVeh.aspx.cs" Inherits="Part2.EvalVeh" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="EvalV" runat="server">
        <asp:Label ID="SSN" runat="server" Text="SSN: "></asp:Label>
        <asp:TextBox ID="ssnT" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Vehicle" runat="server" Text="Vehicle ID: "></asp:Label>
            <asp:TextBox ID="vehicleT" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="Rate" runat="server" Text="Rate (0-10):"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="0">0</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
            <asp:ListItem Value="6">6</asp:ListItem>
            <asp:ListItem Value="7">7</asp:ListItem>
            <asp:ListItem Value="8">8</asp:ListItem>
            <asp:ListItem Value="9">9</asp:ListItem>
            <asp:ListItem Value="10">10</asp:ListItem>
        </asp:DropDownList>
        <p>
            <asp:Button ID="RaterB" runat="server" style="margin-left: 200px" Text="Evaluate" Width="87px" OnClick="RaterB_Click" />
        </p>
    </form>
</body>
</html>
