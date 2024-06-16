<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ListOfProducts.aspx.vb" Inherits="Seminar6Solved.ListOfProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Select a category:"></asp:Label>
&nbsp;
            <asp:DropDownList ID="cmbCategories" runat="server" AutoPostBack="True" DataSourceID="sqlDSCategories" DataTextField="CategoryName" DataValueField="CategoryID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="sqlDSCategories" runat="server" ConnectionString="<%$ ConnectionStrings:ctString %>" ProviderName="<%$ ConnectionStrings:ctString.ProviderName %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Category]"></asp:SqlDataSource>
            <br />
            List of products from the selected category<br />
            <asp:GridView ID="grdProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="sqlDSProducts">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                    <asp:BoundField DataField="MeasureUnit" HeaderText="MeasureUnit" SortExpression="MeasureUnit" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="btnEdit" runat="server" CommandArgument='<%# Eval("ProductID") %>' CommandName="Edit" ImageUrl="~/IMG/edit.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqlDSProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ctString %>" SelectCommand="SELECT * FROM [Product] where CategoryID=@CatID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cmbCategories" Name="CatID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Button ID="btnAddProduct" runat="server" Text="Add a new product" />
            <br />
        </div>
    </form>
</body>
</html>
