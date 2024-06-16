Public Class ListOfProducts
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnAddProduct_Click(sender As Object, e As EventArgs) Handles btnAddProduct.Click
        Response.Redirect("AddProduct.aspx")
    End Sub

    Protected Sub grdProducts_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdProducts.RowCommand
        Dim ProductID As Int32
        ProductID = e.CommandArgument
        If e.CommandName = "Edit" Then
            Response.Redirect("ViewProduct.aspx?qsProductID=" & ProductID)
        End If
    End Sub
End Class