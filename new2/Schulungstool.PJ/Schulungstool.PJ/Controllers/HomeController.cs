﻿using Syncfusion.OfficeChartToImageConverter;
using Syncfusion.Presentation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace Schulungstool.PJ.Controllers
{
    public class HomeController : Controller
    {
        #region IndexPage
        public ActionResult Index()
        {
            return View();
        }
        #endregion
        #region LogInPage
        [HttpPost]
        public void LogIn(string UserName, string Password)
        {
            int test;
        }
        #endregion
        #region AddSchulungsPage
        public ActionResult AddSchulungen(string folderName)
        {
            ViewData["folderName"] = folderName;

            return View();
        }
        #endregion
        #region SeeSchulungsPage
        public ActionResult SeeSchulungen()
        {
            return View();
        }
        #endregion
        #region AddSignaturesPage
        public ActionResult AddSignature()
        {
            return View();
        }
        #endregion
        #region showPowerPointPage
        public ActionResult showPowerPoint()
        {
            return View();
        }
        #endregion
        #region AddPowerPointPage
        public ActionResult AddPowerPoint()//List<string> picturelist
        {
            string workingDirectory = Environment.CurrentDirectory;
            //Open PowerPoint Presentation with SYNCFUSION!
            List<string> picturelist = new List<string>();
            using (var pptxDoc = Presentation.Open(@"C:\Users\Jakob Prem\Desktop\Backup - Kopie (2)\new2\Schulungstool.PJ\Schulungstool.PJ\wwwroot\Images\ABSCHLUSS-KLASSE VON.pptx"))
            {

                var result = Path.GetFileName(pptxDoc.ToString());
                pptxDoc.ChartToImageConverter = new ChartToImageConverter();
                pptxDoc.ChartToImageConverter.ScalingMode = Syncfusion.OfficeChart.ScalingMode.Best;
                for (int i = 0; i < pptxDoc.Slides.Count(); i++)
                {
                    //Converts the first slide into image
                    var image = pptxDoc.Slides[i].ConvertToImage(Syncfusion.Drawing.ImageType.Metafile);
                    //Define Foldername
                    string slideName = "slide" + i.ToString() + ".png";
                    //Create directory
                    string path = @"C:\Users\Jakob Prem\Desktop\Backup - Kopie (2)\new2\Schulungstool.PJ\Schulungstool.PJ\wwwroot\Images\" + result + @"\";
                    DirectoryInfo di = Directory.CreateDirectory(path);
                    //Saves the image as file
                    image.Save(@"C:\Users\Jakob Prem\Desktop\Backup - Kopie (2)\new2\Schulungstool.PJ\Schulungstool.PJ\wwwroot\Images\" + result + @"\" + slideName);
                    picturelist.Add("/wwwroot/Images/" + result + "/" + slideName);
                }
                pptxDoc.Close();
                ViewData["pictureList"] = picturelist;
                Dictionary<string, string> link = new Dictionary<string, string>();
                link.Add(@"https://www.youtube.com/watch?v=D3exfwkmdrU", "Folie1");
                link.Add(@"https://www.youtube.com/watch?v=CfZdOcPkdp4", "Folie2");
                link.Add("", "");

                ViewData["linQ"] = link;
                return View("HomeAD");
            }
        }
        #endregion
        #region HomeADPage
        public ActionResult HomeAD()
        {
            return View("HomeAD");
        }
        public async Task<HttpResponseMessage> PostFormData()
        {
            if (!Request.Content.IsMimeMultipartContent())
            {
                throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);
            }

            string root = HttpContext.Current.Server.MapPath("~/App_Data");
            var provider = new MultipartFormDataStreamProvider(root);

            try
            {
                await Request.Content.ReadAsMultipartAsync(provider);

                // Show all the key-value pairs.
                foreach (var key in provider.FormData.AllKeys)
                {
                    foreach (var val in provider.FormData.GetValues(key))
                    {
                        Trace.WriteLine(string.Format("{0}: {1}", key, val));
                    }
                }

                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (System.Exception e)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e);
            }
        }
        #endregion

        //[HttpPost]
        //public ActionResult HomeAD(string FileName, string Schulungscreator, string Schulungsname)
        //{
        //    //ViewData["FileName"] = FileName;
        //    return View();
        //}
    }
}