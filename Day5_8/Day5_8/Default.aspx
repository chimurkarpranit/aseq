<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Day5_8._Default" %>

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
           <div><h1 class="heading">Employee Details</h1>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"　HorizontalAlign="Center" DataKeyNames="EmployeeID" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="974px" CssClass="auto-style1">  
                    <Columns>
                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" />
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" />
                        <asp:BoundField DataField="City" HeaderText="City" />
                        <asp:BoundField DataField="Salary" HeaderText="Salary" />
                        <asp:BoundField DataField="Notes" HeaderText="Notes" />
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
            FirstName:
            <asp:TextBox ID="textFirstName" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="ReqFirstName" ControlToValidate="textFirstName" ErrorMessage="Enter FirstName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="RegLastName" ControlToValidate="textFirstName" ValidationExpression="^[^0-9]+$" ErrorMessage="Digit Not Allowed as FirstName" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
        </td>
        <td>
            LastName:
            <asp:TextBox ID="textLastName" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="textLastName" ErrorMessage="Enter LastName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" ControlToValidate="textLastName" ValidationExpression="^[^0-9]+$" ErrorMessage="Digit Not Allowed as LastName" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
        </td>
         <td>
            City:
            <asp:TextBox ID="textCity" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="textCity" ErrorMessage="Enter City" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ControlToValidate="textCity" ValidationExpression="^[^0-9]+$" ErrorMessage="Digit Not Allowed as City" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
        </td>
         <td>
            Salary:
            <asp:TextBox ID="textSalary" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="textSalary" ErrorMessage="Enter Salary" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ControlToValidate="textSalary" ValidationExpression="^[0-9]*$" ErrorMessage="Only Integers are allowed" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
        </td>
        <td>
            Notes:
            <asp:TextBox ID="textNotes" runat="server" />
             <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="textNotes" ErrorMessage="Enter Notes" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>      
        <td >
            <asp:Button ID="BtnAdd" runat="server" Text="Add" OnClick="Insert" />
        </td>
    </tr>
</table>
</div>
</form>
</body>
</html>