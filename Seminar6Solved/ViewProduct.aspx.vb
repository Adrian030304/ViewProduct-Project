Imports System.Data.SqlClient

Public Class ViewProduct
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub dvProduct_ItemCommand(sender As Object, e As DetailsViewCommandEventArgs) Handles dvProduct.ItemCommand
        Dim ProductID As Int32 = e.CommandArgument
        If e.CommandName = "Edit" Then
            Dim con As New SqlConnection
            con.ConnectionString = ConfigurationManager.ConnectionStrings("ctString").ConnectionString
            con.Open()
            Dim cmd As New SqlCommand
            cmd.Connection = con
            cmd.CommandType = CommandType.Text
            cmd.CommandText = "Select * from Product where ProductId=" & ProductID
            Dim adp As New SqlDataAdapter
            adp.SelectCommand = cmd
            Dim dt As New DataTable
            adp.Fill(dt)
            Dim dr As DataRow
            dr = dt.Rows(0)

            With dr
                txtProductName.Text = dr.Item("ProductName")
                cmbMeasureUnit.SelectedValue = dr.Item("MeasureUnit")
                cmbCategories.SelectedValue = dr.Item("CategoryID")
                txtUnitPrice.Text = dr.Item("UnitPrice")

            End With
        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As ImageClickEventArgs) Handles btnSave.Click
        sqlDSProductsEdit.Update()
        Response.Redirect("ListOfProducts.aspx")
    End Sub
End Class