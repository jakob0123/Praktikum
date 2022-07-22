




<!DOCTYPE html>
<html>
<head>
    @section scripts{
        <script src="~/wwwroot/js/ConfigEdit.js"></script>
    }
    <script src="~/wwwroot/js/getfileName.js"></script>
    <script src="~/wwwroot/js/Select.js"></script>
    <link rel="stylesheet" href="~/wwwroot/css/bootstrap.css">
    <style>
        input[type=text], select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit]:hover {
            background-color: #424242;
            color: white;
        }

        input[type=submit] {
            transition-duration: 0.4s;
            float: right;
        }

        input[type=file] {
        }

        p.auto {
            overflow: auto;
            border-style: groove;
            color: black;
        }

        p {
            border: 2px #e7e7e7;
            padding: 12px;
            width: 250px;
            height: 150px;
            float: left;
            margin: 5px;
        }

        select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .gee {
            background-color: white;
            color: black;
            border: 2px solid #e7e7e7;
        }
    </style>






































<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CS.aspx.cs" Inherits="CS" %>
    <% @model Schulungstool.PJ.Models.Formula.SchulungsModel
@{
    ViewBag.Title = "Schulung bearbeiten";
    var picturelist = ViewData["picturelist"] as List<string>;
    var folderName = ViewData["folderName"] as string;
    if (folderName == null)
    {
        folderName = "nix";
    }

}
@*@{
        var filename = ViewData["FileName"];
        var schulungcreator = ViewData["Schulungname"];
        var schulungname = ViewData["Schulungscreator"];
    }*@
        %>
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
    <asp:Button Text="Upload" runat="server" OnClick="Upload" />
    <br />
    <asp:Label ID="lblMessage" Text="File uploaded successfully." runat="server" ForeColor="Green"
        Visible="false" />
    </form>
     
    @using (Html.BeginForm("UploadContent", "Home", FormMethod.Post))
    {
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th colspan="2" align="center">Schulung anlegen</th>
            </tr>
            <tr>
                <td>Name: </td>
                <td>
                    @Html.TextBoxFor(m => m.Schulungscreator)
                </td>
            </tr>
            <tr>
                <td>Name der Schulung </td>
                <td>
                    @Html.TextBoxFor(m => m.Schulungsname)
                </td>
            </tr>
            <tr>
                <td>Typ der Schulung </td>
                <td>
                    @Html.DropDownListFor(m => m.Typ, new List<SelectListItem>
                   { new SelectListItem{Text="Schulung"},
                     new SelectListItem{Text="Unterweisung"}}, "Please select")
                </td>
            </tr>
            <tr>
                <td>


                </td>
            </tr>

            <tr>
                <td></td>
                <input type="file" />
                <button type="button" title="Schulung auswählen" onclick="document.getElementById('addContentSelectorA').click();">
                    <i class="fas fa-plus-circle"></i>
                    Anhang hinzufügen

                </button>
                <td><input type="submit" value="Submit" onclick="location.href = '@Url.Action("UploadContent", "Home", new { picturelist = picturelist})'" /></td>
            </tr>
        </table>


        <br />

        <hr />
        <table>
            <tr>
                Benutzer:
                <td>
                    <p class="auto">
                <td>
                </td>
                <input name="whishlist[]" type="checkbox">  Krug Nikolaus
                <br>
                <input name="whishlist[]" type="checkbox">  Rene Jahn
                <br>
                <input name="whishlist[]" type="checkbox">  Beate Wallner
                <br>
                <input name="whishlist[]" type="checkbox">  Robert Fandler
                <br>
                <input name="whishlist[]" type="checkbox">  Dietmar Nederl
                <br>
                <input name="whishlist[]" type="checkbox">  Praktikant
                <br>
                <input name="whishlist[]" type="checkbox">  Krug Nikolaus
                <br>
                <input name="whishlist[]" type="checkbox">  Rene Jahn
                <br>
                <input name="whishlist[]" type="checkbox">  Beate Wallner
                <br>
                <input name="whishlist[]" type="checkbox">  Robert Fandler
                <br>
                <input name="whishlist[]" type="checkbox">  Dietmar Nederl
                <br>
                <input name="whishlist[]" type="checkbox">  Praktikant
                <br>
                </p>
                </td>
            </tr>
        </table>
        <hr />
        <!-- Der Kodierungstyp enctype MUSS wie dargestellt angegeben werden -->
        <!--<form enctype="multipart/form-data" action="__URL__" method="POST">-->
        <!-- MAX_FILE_SIZE muss vor dem Datei-Eingabefeld stehen -->
        <!--<input type="hidden" name="MAX_FILE_SIZE" value="30000" />-->
        <!-- Der Name des Eingabefelds bestimmt den Namen im $_FILES-Array -->
        <!--Diese Datei hochladen: <input name="userfile" type="file" />
            <input type="submit" value="Send File" />
        </form>-->
        <input type="file" id="addContentSelector" style="display: none;" accept=".pptx"
               data-upload-url="@Url.Action("UploadContent", "Home", new { folderName = "folderName"})" data-entry-id="1" data- /> <!--<== Foldername sollte irgendeine Variable werden-->

        @*<button class="btn btn-primary" onclick="location.href = '@Url.Action("HomeAD", "Home", new { picturelist = picturelist})'">Load Powerpoint </button>*@

    }

</body>
</html>
