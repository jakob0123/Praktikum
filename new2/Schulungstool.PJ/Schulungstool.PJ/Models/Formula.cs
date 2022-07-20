using System;
using System.Web;

namespace Schulungstool.PJ.Models.Formula
{
    public class SchulungsModel
    {
        ///<summary>
        /// Gets or sets PersonId.
        ///</summary>
        public string Schulungscreator { get; set; }

        ///<summary>
        /// Gets or sets Name.
        ///</summary>
        public string Schulungsname { get; set; }

        ///<summary>
        /// Gets or sets Gender.
        ///</summary>
        public string Typ { get; set; }
        public HttpPostedFile ImageFile { get; set; }
    }
}