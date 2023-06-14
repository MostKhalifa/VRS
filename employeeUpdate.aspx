<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employeeUpdate.aspx.cs" Inherits="WebApplication2.employeeUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Update here your information:<br />
            <br />
            <br />
            Name:<br />
            <asp:TextBox ID="nameBox" runat="server" Height="32px" Width="233px"></asp:TextBox>
            <br />
            <br />
            Address:<br />
            <asp:TextBox ID="addBox" runat="server" Height="32px" Width="233px" ></asp:TextBox>
            <br />
            <br />
            Hours per week:<br />
            <asp:TextBox ID="WPHBox" runat="server"></asp:TextBox>
            <br />
            <br />
            Email:<br />
            <asp:TextBox ID="emailBox" runat="server" Height="32px" Width="233px"></asp:TextBox>
            <br />
            <br />
            Password:<br />
            <asp:TextBox ID="passBox" runat="server" Height="32px" Width="233px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="updBtn" runat="server" Text="Update" Width="92px" OnClick="updBtn_Click" />
            <br />
        </div>
    </form>
</body>
</html>
