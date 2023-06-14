<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addInsurance.aspx.cs" Inherits="WebApplication2.addInsurance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add an Insurance:<br />
            <br />
            Insurance number:<br />
            <asp:TextBox ID="insuBox" runat="server"></asp:TextBox>
            <br />
            <br />
            Rate:<br />
            <asp:TextBox ID="rateBox" runat="server"></asp:TextBox>
            <br />
            <br />
            Choose it&#39;s type:<br />
            <asp:DropDownList ID="DropDownList2" runat="server" Width="121px" AutoPostBack="True" >
                <asp:ListItem>Basic</asp:ListItem>
                <asp:ListItem>Advanced</asp:ListItem>
                <asp:ListItem>Premium</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            if you chose the Advanced system, Add a liability amount:<br />
            <asp:TextBox ID="LABox" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add" Width="97px" OnClick="Button1_Click" />
            <br />
        </div>
    </form>
</body>
</html>

