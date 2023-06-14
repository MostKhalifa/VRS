<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updatePayment.aspx.cs" Inherits="WebApplication2.updatePayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h3>Add Payment Method</h3>
        
        number:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        cvv:&nbsp;
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        expire date:
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
&nbsp;<p>
            &nbsp;</p>
        <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
        <p>
            &nbsp;</p>
        <h3>Remove Payment Method</h3>
        number:&nbsp;
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <p>
            &nbsp;</p>
        <asp:Button ID="Button2" runat="server" Text="Remove" OnClick="Button2_Click" />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" Text="Back" OnClick="Button3_Click" />
    </form>
</body>
</html>
