<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdLoc.aspx.cs" Inherits="Part2.UpdLoc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Vehicle ID: "></asp:Label>
            <asp:TextBox ID="vid" runat="server"></asp:TextBox>
        </div>
        <asp:Label ID="Label2" runat="server" Text="Location: "></asp:Label>
        <asp:TextBox ID="newLoc" runat="server"></asp:TextBox>
        <asp:Button ID="submit" runat="server" Text="update" OnClick="submit_Click" />
    </form>
</body>
</html>
