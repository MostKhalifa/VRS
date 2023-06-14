<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="WebApplication2.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Social security number:<br />
            <asp:TextBox ID="ssnBox" runat="server"  Width="261px"></asp:TextBox>
            <br />
            <br />
            <br />
            Name :<br />
            <asp:TextBox ID="nameBox" runat="server" Height="35px" Width="242px"></asp:TextBox>
            <br />
            <br />
            <br />
            E-mail:<br />
            <asp:TextBox ID="emailRegBox" runat="server" Height="35px" Width="242px"></asp:TextBox>
            <br />
            <br />
            <br />
            Password:<br />
            <asp:TextBox ID="passRegBox" runat="server" Height="35px" Width="242px"></asp:TextBox>
            <br />
            <br />
            <br />
            Address:<br />
            <asp:TextBox ID="addBox" runat="server" Height="35px" Width="272px"></asp:TextBox>

            <br />
            <br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True">
                <asp:ListItem>Customer</asp:ListItem>
                <asp:ListItem>Employee</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            If you&#39;re an employee, Enter your working hours:<br />
            <asp:TextBox ID="HPWbox" runat="server"></asp:TextBox>
            Hours/week<br />
            <br />
            <br />
            <asp:Button ID="regDoneBtn" runat="server" Height="54px" Text="Register" Width="100px" OnClick="regDoneBtn_Click" />
            <br />
        </div>
    </form>
</body>
</html>
