<%@ Page Language="VB" AutoEventWireup="false" CodeFile="VB.aspx.vb" Inherits="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <input type="file" name="FileUpload" />
    <asp:Button ID="Button1" Text="Upload" runat="server" OnClick="Upload" />
    <br />
    <asp:Label ID="lblMessage" Text="File uploaded successfully." runat="server" ForeColor="Green"
        Visible="false" />
    </form>
</body>
