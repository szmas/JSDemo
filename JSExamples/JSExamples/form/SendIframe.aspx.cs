using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JSExamples
{
    public partial class SendIframe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                Response.Write("{\"isError\":true,\"Message\":\"原密码错误\"}");
                Response.End();
            }
        }
    }
}