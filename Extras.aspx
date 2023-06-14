<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Extras.aspx.cs" Inherits="Part2.Extras" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="ExtraF" runat="server">
        <div>
            <asp:Button ID="SortR" runat="server" Text="Sort by Rate" OnClick="SortR_Click" />
    
            <asp:Button ID="SortO" runat="server" Text="View Minimum Item Per Type
                " OnClick="SortO_Click" Width="227px" />
    
           <asp:Panel ID="Panel1" runat="server">
           </asp:Panel>


        </div>
        <div>

            <br />
            <br />
            <br />
            <br />
            <asp:Panel ID="Panel2" runat="server">
           </asp:Panel>
        </div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="SSN: "></asp:Label>
            <asp:TextBox ID="ssnT" runat="server"></asp:TextBox>
        </div>
        <asp:Label ID="Label2" runat="server" Text="Extra ID: "></asp:Label>
        <asp:TextBox ID="ExtraID" runat="server"></asp:TextBox>
        <asp:Button ID="RentB" runat="server" Text="Rent" OnClick="RentB_Click" />
    </form>
</body>
</html>
