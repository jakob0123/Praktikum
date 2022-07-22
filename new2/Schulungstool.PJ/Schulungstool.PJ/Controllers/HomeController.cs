using Schulungstool.PJ.Models.Formula;
using Syncfusion.OfficeChartToImageConverter;
using Syncfusion.Presentation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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
        public ActionResult AddPowerPoint(int irgendeineId)//List<string> picturelist
        {
            string workingDirectory = Environment.CurrentDirectory;
            //Open PowerPoint Presentation with SYNCFUSION!
            List<string> picturelist = new List<string>();
            string targetPath = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/wwwroot/Images"), irgendeineId.ToString());
            using (var pptxDoc = Presentation.Open(targetPath))
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
                return View();
            }
        }
        #endregion
        #region HomeADPage
        public ActionResult HomeAD()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UploadContent(SchulungsModel Schulung)
        {
            string schulungscreator = Schulung.Schulungscreator;
            string schulungsname = Schulung.Schulungsname;
            string typ = Schulung.Typ;
            List<string> picturelist = new List<string>();
            Random rd = new Random();
            int irgendeineId = rd.Next(0, 1000000);

            string fileName = Request.Headers["file-name"];
            if (string.IsNullOrWhiteSpace(fileName) == false)
            {
                string targetPath = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/wwwroot/Images/"), irgendeineId.ToString());//"C:\\Users\\rene.jahn\\Desktop\\Praktikant\\Schulungstool.PJ\\Schulungstool.PJ\\App_Data\\EntryContents\\Content_1.pptx";//Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/App_Data/EntryContents"), "Content_" + 1);
                using (var fileStream = System.IO.File.Create(targetPath + ".pptx"))
                {
                    Request.InputStream.CopyTo(fileStream);
                }
            }
            ViewData["pictureList"] = picturelist;
            Dictionary<string, string> link = new Dictionary<string, string>();
            link.Add(@"https://www.youtube.com/watch?v=pa6scmN9bQc", "Folie1");
            //ViewData["folderName"] = folderName;
            //return View("AddSchulungen");
            return View();
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
