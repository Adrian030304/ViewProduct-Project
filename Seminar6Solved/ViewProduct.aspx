<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ViewProduct.aspx.vb" Inherits="Seminar6Solved.ViewProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 800px;
        }
        .auto-style2 {
            width: 800px;
            border-collapse: collapse;
        }
        .auto-style3 {
            font-family: Arial;
            font-style: italic;
            font-size: 14px;
            color: #003399;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DetailsView ID="dvProduct" runat="server" AutoGenerateRows="False" DataSourceID="sqlDSProduct" Height="50px" Width="125px">
                <Fields>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <table class="auto-style1">
                                <tr>
                                    <td>Product ID</td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Product Name</td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Measure unit</td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("MeasureUnit") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Unit price</td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("UnitPrice") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Category</td>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("CategoryID") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="btnEdit" runat="server" CommandArgument='<%# Eval("ProductID") %>' CommandName="Edit" ImageUrl="~/IMG/edit.png" />
                                    </td>
                                    <td>
                                        <asp:ImageButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("ProductID") %>' CommandName="Delete" ImageUrl="~/IMG/delete.png" OnClientClick="return confirm(&quot;Are  you sure you want to delete this product?&quot;); " />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="sqlDSProduct" runat="server" ConnectionString="<%$ ConnectionStrings:ctString %>" DeleteCommand="Delete from Product Where ProductID=@ProductID" SelectCommand="SELECT ProductID, ProductName, MeasureUnit, UnitPrice, CategoryID FROM Product WHERE (ProductID = @ProductID)">
                <DeleteParameters>
                    <asp:QueryStringParameter Name="ProductID" QueryStringField="qsProductID" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="ProductID" QueryStringField="qsProductID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3" colspan="2" style="background-color: #00FF99; text-align: center; font-family: Arial; font-size: large;">Edit the product</td>
                </tr>
                <tr>
                    <td class="auto-style2" style="font-family: Arial; font-size: 14px">Product Name</td>
                    <td class="auto-style2" style="font-family: Arial; font-size: 14px">
                        <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-family: Arial; font-size: 14px">Measure unit</td>
                    <td style="font-family: Arial; font-size: 14px">
                        <asp:DropDownList ID="cmbMeasureUnit" runat="server">
                            <asp:ListItem>Kg</asp:ListItem>
                            <asp:ListItem>L</asp:ListItem>
                            <asp:ListItem>Piece</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="font-family: Arial; font-size: 14px">Unit price</td>
                    <td style="font-family: Arial; font-size: 14px">
                        <asp:TextBox ID="txtUnitPrice" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-family: Arial; font-size: 14px">Category</td>
                    <td style="font-family: Arial; font-size: 14px">
                        <asp:DropDownList ID="cmbCategories" runat="server" datasourceid="sqlDSCategories0" DataTextField="CategoryName" DataValueField="CategoryID" Height="17px" Width="298px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sqlDSCategories0" runat="server" ConnectionString="<%$ ConnectionStrings:ctString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td style="font-family: Arial; font-size: 14px">&nbsp;</td>
                    <td style="font-family: Arial; font-size: 14px">
                        <asp:ImageButton ID="btnSave" runat="server" Height="79px" ImageUrl="~/IMG/Save.png" Width="95px" />
                        <asp:SqlDataSource ID="sqlDSProductsEdit" runat="server" ConnectionString="<%$ ConnectionStrings:ctString %>" InsertCommand="INSERT INTO Product(ProductName, MeasureUnit, UnitPrice, CategoryID) VALUES (@ProductName, @MU, @UP, @CatID)" SelectCommand="Select * from Product" UpdateCommand="UPDATE Product SET ProductName =@PN, MeasureUnit =@MU, UnitPrice =@UP, CategoryID =@CatID
Where ProductID=@ProductID">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txtProductName" Name="ProductName" PropertyName="Text" />
                                <asp:ControlParameter ControlID="cmbMeasureUnit" Name="MU" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtUnitPrice" Name="UP" PropertyName="Text" />
                                <asp:ControlParameter ControlID="cmbCategories" Name="CatID" PropertyName="SelectedValue" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txtProductName" Name="PN" PropertyName="Text" />
                                <asp:ControlParameter ControlID="cmbMeasureUnit" Name="MU" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtUnitPrice" Name="UP" PropertyName="Text" />
                                <asp:ControlParameter ControlID="cmbCategories" Name="CatID" PropertyName="SelectedValue" />
                                <asp:QueryStringParameter Name="ProductID" QueryStringField="qsProductID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
