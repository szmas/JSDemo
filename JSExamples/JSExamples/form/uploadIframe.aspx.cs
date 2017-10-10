using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JSExamples.form
{
    public partial class uploadIframe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

                if (Request.QueryString["type"] == "upload" && Request.Files.Count > 0 && Request.Files[0].ContentLength > 0)
                {
                    string fileName = Request.Files[0].FileName;
                    string location = Server.MapPath("/uploadfiles/") + fileName;

                    Request.Files[0].SaveAs(location);

                    Response.Write("{\"type\":\"Success\",\"Message\":\"/uploadfiles/" + fileName + "\"}");
                    Response.End();
                }
                else
                {
                    Response.Write("{\"isError\":true,\"Message\":\"原密码错误\"}");
                    Response.End();

                }
            }
        }
    }
}