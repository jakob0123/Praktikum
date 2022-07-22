using Syncfusion.OfficeChartToImageConverter;
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
using Schulungstool.PJ.Models.Formula;

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
        public ActionResult AddPowerPoint(string path4)//List<string> picturelist
        {
            string workingDirectory = Environment.CurrentDirectory;
            //Open PowerPoint Presentation with SYNCFUSION!
            List<string> picturelist = new List<string>();
            using (var pptxDoc = Presentation.Open(path4))
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
                    string path2 = Path.Combine(System.Web.HttpContext.Current.Server.MapPath(@"~\wwwroot\Images\"));
                    string path = path2 + result + @"\";
                    DirectoryInfo di = Directory.CreateDirectory(path);
                    //Saves the image as file
                    image.Save(path2 + result + @"\" + slideName);
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
        [HttpGet]
        public ActionResult HomeAD()
        {
            return View();
        }

        [HttpPost]
        public ActionResult HomeAD(SchulungsModel Schulung, HttpPostedFileBase postedFile)
        {
            string schulungscreator = Schulung.Schulungscreator;
            string schulungsname = Schulung.Schulungsname;
            string typ = Schulung.Typ;
            string path = Server.MapPath("~/Uploads/");
            var path1="";
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            if (postedFile != null)
            {
                string fileName = Path.GetFileName(postedFile.FileName);
                path1 = path+ fileName;
                postedFile.SaveAs(path1);
                ViewBag.Message += string.Format("<b>{0}</b> uploaded.<br />", fileName);
                
            }

            AddPowerPoint(path1);


            return View("AddPowerPoint");
        }
        #endregion
    }
}    
