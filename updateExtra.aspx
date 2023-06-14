<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateExtra.aspx.cs" Inherits="WebApplication2.updateExtra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            All Extras:<br />
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
            Update the Rate of a specific extra Item<br />
            <br />
            <br />
            ID of the Extra item:<br />
            <asp:TextBox ID="idBox" runat="server"></asp:TextBox>
            <br />
            <br />
            New Rate:<br />
            <asp:TextBox ID="rateBox" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="speUpBtn" runat="server" Text="update this item by that rate" Width="226px" Height="38px" OnClick="speUpBtn_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;<br />
            <br />
            -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------<br />
            <br />
            <br />
            Increament all Extras of a specific type by a value<br />
            <br />
            <br />
            Type:<br />
            <asp:TextBox ID="typeBox" runat="server" Height="37px" Width="198px"></asp:TextBox>
            <br />
            <br />
            Increament by:<br />
            <asp:TextBox ID="valBox" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="allUpBtn" runat="server" Text="update all extras by that rate" Width="226px" Height="38px" OnClick="allUpBtn_Click"/>
            <br />
        </div>
    </form>
</body>
</html>
