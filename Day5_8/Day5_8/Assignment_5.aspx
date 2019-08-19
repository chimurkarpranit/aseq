<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Assignment_5.aspx.cs" Inherits="Day5_8.Assignment_5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assignment_5</title>
    <style type="text/css">
    .table
    {
        background-color:#A9A9A9;
        margin-top: 100px;
        margin-bottom: 100px;
        margin-right: 150px;
        margin-left: 50px;
        border: 2px solid black;        
    }    
</style>
</head>
<body>
    <form id="form1" runat="server" defaultfocus="DdlEmployeeID">
    <div align="center">
    <table width="30%" cellpadding="3" class="table">       
    <caption><h3 align="center">ADD Employee Territories</h3></caption>
        <tr>
        <td></td>
        <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>&nbsp;&nbsp;</td>
            <td colspan="2">
                <asp:Label ID="LblEmployeeID" runat="server" Text="EmployeeID"
                    style="font-weight: 700"></asp:Label>
            </td>
            <td></td>
            <td>
                <asp:DropDownList ID="DdlEmployeeID" runat="server">
                </asp:DropDownList>
            </td>
            </tr>
            <tr>
            <td>&nbsp;&nbsp;</td>
            <td></td>
            <td></td>            
                <td colspan="2">
                <asp:Label ID="LblTerritoryID" runat="server" Text="TerritoryID" 
                    style="font-weight: 700"></asp:Label>
            </td>
            <td></td>
            <td>
                <br />
                <asp:TextBox ID="TxtTerritoryID" runat="server" MaxLength="6" Width="120px"></asp:TextBox>
                <br />
                         <asp:RegularExpressionValidator ID="RgxvTerritoryID" runat="server" 
                        ControlToValidate="TxtTerritoryID" ErrorMessage="Invalid TerritoryID" ForeColor="Red" 
                        ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
            </td>
            <td><asp:RequiredFieldValidator ID="rfvTerritoryID" runat="server" 
                        ErrorMessage="Enter TerritoryID" ControlToValidate="TxtTerritoryID" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                         <br />
             </td>
            </tr>                        
            <tr>
            <td></td>
            <td></td>
            <td></td>
            <td colspan="4" align="center">
                    <asp:Button ID="BtnInsert" runat="server" Text="Insert" 
                        style="font-weight: 700" onclick="BtnInsert_Click" Width="150px" /></td>
        </tr>
        <tr><td></td></tr>
    </table>        
    </div>
    </form>
</body>
</html>