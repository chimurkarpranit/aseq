<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sample_3.aspx.cs" Inherits="Day5_8.Sample_3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer_Details</title>
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
    <form id="form2" runat="server">
     <div><h1 class="heading">Customer Details</h1>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" DataKeyNames="CustomerID" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="80%" CssClass="auto-style1" AllowPaging="True" PageSize="5">  
                    <Columns>
                        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" />
                        <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" />
                        <asp:BoundField DataField="City" HeaderText="City" />
                        <asp:BoundField DataField="Country" HeaderText="Country" />
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
            Customer ID:
            <asp:TextBox ID="textCustID" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="ReqCustID" ControlToValidate="textCustID" ErrorMessage="Enter Customer ID" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="RegCustID" ControlToValidate="textCustID" ValidationExpression="^[^0-9]+$" ErrorMessage="Digit Not Allowed as Customer ID" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
        </td>
        <td>
            Company Name:
            <asp:TextBox ID="textCompanyName" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="ReqCompanyName" ControlToValidate="textCompanyName" ErrorMessage="Enter Company Name" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="RegCompanyName" ControlToValidate="textCompanyName" ValidationExpression="^[^0-9]+$" ErrorMessage="Digit Not Allowed as Company Name" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
        </td>
        <td>
            City:
            <asp:TextBox ID="textCity" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="ReqCity" ControlToValidate="textCity" ErrorMessage="Enter City" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="RegCity" ControlToValidate="textCity" ValidationExpression="^[^0-9]+$" ErrorMessage="Digit Not Allowed as City" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
        </td>
         <td>
            Country:
            <asp:TextBox ID="textCountry" runat="server" />
            <asp:RequiredFieldValidator runat="server" ID="ReqCountry" ControlToValidate="textCountry" ErrorMessage="Enter Country" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator runat="server" ID="RegCountry" ControlToValidate="textCountry" ValidationExpression="^[^0-9]+$" ErrorMessage="Digit Not Allowed as Country" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
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