Public Class AddProduct
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As ImageClickEventArgs) Handles btnSave.Click
        sqlDSProducts.Insert()
        'will have to redirect to the list of products after insert
        Response.Redirect("ListOfProducts.aspx")
    End Sub
End Class