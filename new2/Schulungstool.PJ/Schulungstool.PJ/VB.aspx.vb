Imports System.IO

Partial Class VB
    Inherits System.Web.UI.Page
    Protected Sub Upload(ByVal sender As Object, ByVal e As EventArgs)
        'Access the File using the Name of HTML INPUT File.
        Dim postedFile As HttpPostedFile = Request.Files("FileUpload")
        'Check if File is available.
        If postedFile IsNot Nothing And postedFile.ContentLength > 0 Then
            'Save the File.
            Dim filePath As String = Server.MapPath("~/Uploads/") + Path.GetFileName(postedFile.FileName)
            postedFile.SaveAs(filePath)
            lblMessage.Visible = True
        End If
    End Sub
End Class
