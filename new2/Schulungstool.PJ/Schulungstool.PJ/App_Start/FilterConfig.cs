using System.Web;
using System.Web.Mvc;

namespace DAMONE.Schulungstool.Version7._1
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
