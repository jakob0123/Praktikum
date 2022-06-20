using DAMONE.asdf.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace DAMONE.asdf.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult AddSchulungen()
        {
            return View();
        }
        public IActionResult SeeSchulungen()
        {
            return View();
        }
        public IActionResult AddSignature()
        {
            return View();
        }
        public IActionResult AddPowerPoint()
        {
            return View();
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}