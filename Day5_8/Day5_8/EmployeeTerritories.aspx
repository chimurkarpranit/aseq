<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeTerritories.aspx.cs" Inherits="Day5_8.EmployeeTerritories" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
     <title>Add/Edit/Delete features in the gridview</title>
     <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        .heading
        {
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
        }
        table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
            background-color: #fff;
            width:400px;
            align-content:center;
            margin-left: auto;
            margin-right: auto;
        }
        table th
        {
            background-color: #B8DBFD;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border: 1px solid #ccc;
        }
        table, table table td
        {
            border: 0px solid #ccc;
        }
        </style>
 </head>
    <body>  
        <form id="form1" runat="server">
           <div><h1 class="heading">EmployeeTerritories Details</h1>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" DataKeyNames="EmployeeID,TerritoryID" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="80%" CssClass="auto-style1" AllowPaging="True" PageSize="5">  
                    <Columns>
                        <%--<asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" />
                        <asp:BoundField DataField="TerritoryID" HeaderText="TerritoryID" />--%>
                        <asp:TemplateField HeaderText="EmployeeID">              
                        <ItemTemplate>
                            <asp:Label ID="LblEmployeeID" runat="server" Text='<%# Eval("EmployeeID") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmployeeID" runat="server" Text='<%# Eval("EmployeeID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TerritoryID">              
                        <ItemTemplate>
                            <asp:Label ID="LblTerritoryIDD" runat="server" Text='<%# Eval("TerritoryID") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTerritoryID" runat="server" Text='<%# Eval("TerritoryID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
  <table border="1" style="border-collapse: collapse;" class="auto-style1">
    <tr>
        <td>
            EmployeeID:
            <asp:TextBox ID="textEmployeeID" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="ReqEmployeeID" ControlToValidate="textEmployeeID" ErrorMessage="Enter EmployeeID" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="RegEmployeeID" ControlToValidate="textEmployeeID" ValidationExpression="^[0-9]*$" ErrorMessage="Alphabet Not Allowed as EmployeeID" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
        </td>
        <td>
            TerritoryID:
            <asp:TextBox ID="textTerritoryID" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="ReqTerritoryID" ControlToValidate="textTerritoryID" ErrorMessage="Enter TerritoryID" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="RegTerritoryID" ControlToValidate="textTerritoryID" ValidationExpression="^[0-9]*$" ErrorMessage="Alphabet Not Allowed as TerritoryID" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
        </td>
        <td >
            <asp:Button ID="ButtonAdd" runat="server" Text="Add" OnClick="Insert" />
        </td>
    </tr>
</table>
</div>
</form>
</body>
</html>