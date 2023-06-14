<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateVehicle.aspx.cs" Inherits="WebApplication2.updateVehicle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            All vehicles:<br />
            <br />
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <br />
            <br />
            Enter the id of a vehicle:<asp:TextBox ID="idBox" runat="server" ></asp:TextBox>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status:<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Width="138px">
                <asp:ListItem>available</asp:ListItem>
                <asp:ListItem>rented</asp:ListItem>
                <asp:ListItem>maintenance</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="updBtn" runat="server" Text="Update" Width="83px" OnClick="updBtn_Click" />
        </div>
    </form>
</body>
</html>
