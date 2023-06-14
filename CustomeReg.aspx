<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeR.aspx.cs" Inherits="Part2.EmployeeR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Acc" runat="server" Text="Submit Accident" OnClick="AccC"  />
            <asp:Button ID="Ext" runat="server" Text="Extras" OnClick="Ext_Click" />
            <asp:Button ID="Eval" runat="server" Text="Evaluate Vehicle" OnClick="Eval_Click" />
            <asp:Button ID="UpLoc" runat="server" Text="Update Location" OnClick="UpLoc_Click" />
            <asp:Button ID="UpBK" runat="server" Text="Update Battery/Km" OnClick="UpBK_Click" />
        </div>
    </form>
</body>
</html>
