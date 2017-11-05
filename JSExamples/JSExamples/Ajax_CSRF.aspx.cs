using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JSExamples
{
    public partial class Ajax_CSRF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
            {
                Response.Write(Request.Headers["X-CSRF-TOKEN"]);
                Response.End();
            }

        }
    }
}