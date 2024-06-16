<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AddProduct.aspx.vb" Inherits="Seminar6Solved.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 800px;
            border-collapse: collapse;
            border-style: solid;
            border-width: 1px;
        }
        .auto-style2 {
            height: 18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td colspan="2" style="font-family: Arial; font-size: 14px; font-style: italic; color: #003399; background-color: #99CCFF; text-align: center;">Add a new product</td>
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
                        <asp:DropDownList ID="cmbCategories" runat="server" DataSourceID="sqlDSCategories" DataTextField="CategoryName" DataValueField="CategoryID" Height="17px" Width="298px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sqlDSCategories" runat="server" ConnectionString="<%$ ConnectionStrings:ctString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td style="font-family: Arial; font-size: 14px">&nbsp;</td>
                    <td style="font-family: Arial; font-size: 14px">
                        <asp:ImageButton ID="btnSave" runat="server" Height="79px" ImageUrl="~/IMG/Save.png" Width="95px" />
                        <asp:SqlDataSource ID="sqlDSProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ctString %>" InsertCommand="INSERT INTO Product(ProductName, MeasureUnit, UnitPrice, CategoryID) VALUES (@ProductName, @MU, @UP, @CatID)" SelectCommand="Select * from Product">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txtProductName" Name="ProductName" PropertyName="Text" />
                                <asp:ControlParameter ControlID="cmbMeasureUnit" Name="MU" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txtUnitPrice" Name="UP" PropertyName="Text" />
                                <asp:ControlParameter ControlID="cmbCategories" Name="CatID" PropertyName="SelectedValue" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
