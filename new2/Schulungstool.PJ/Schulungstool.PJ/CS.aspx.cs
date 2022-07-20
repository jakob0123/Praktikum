using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class CS : System.Web.UI.Page
{
    protected void Upload(object sender, EventArgs e)
    {
        //Access the File using the Name of HTML INPUT File.
        HttpPostedFile postedFile = Request.Files["FileUpload"];

        //Check if File is available.
        if (postedFile != null && postedFile.ContentLength > 0)
        {
            //Save the File.
            string filePath = Server.MapPath("~/Uploads/") + Path.GetFileName(postedFile.FileName);
            postedFile.SaveAs(filePath);
            lblMessage.Visible = true;
        }
    }
}