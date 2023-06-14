<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccSub.aspx.cs" Inherits="Part2.AccSub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label2" runat="server" Text="SSN: "></asp:Label>
            <asp:TextBox ID="ssnT" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Vehicle: "></asp:Label>
            <asp:TextBox ID="vehT" runat="server"></asp:TextBox>
        </div>
            <div>
            <asp:Label ID="Label1" runat="server" Text="Describe the accident:"></asp:Label>
            </div>
        <asp:TextBox ID="AccDesc" runat="server" Height="54px" Width="547px"></asp:TextBox>
        <asp:Button ID="AccSubmit" runat="server" Text="Submit" OnClick="AccSubmit_Click" />
 
    </form>
</body>
</html>
