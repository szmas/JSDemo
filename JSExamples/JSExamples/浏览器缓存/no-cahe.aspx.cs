using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JSExamples.浏览器缓存
{
    public partial class no_cache : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Cache.SetETag("");


            //某次HTTP的响应结果应该缓存多少秒
            //Date + max-age = Expires

            Response.Cache.SetMaxAge(TimeSpan.FromSeconds(300));//HTTP 1.1
            //某次HTTP的响应结果应缓存到什么时候过期，此时间是一个UTC时间
            Response.Cache.SetExpires(DateTime.UtcNow.AddSeconds(300)); //HTTP 1.0

            Response.Cache.SetMaxAge(TimeSpan.FromSeconds(300));//HTTP 1.1

            Response.Expires = 300;//HTTP 1.0



            //Response.Cache.SetLastModified();

            //Response.AddHeader("Last-Modified", DateTime.UtcNow.Add(TimeSpan.FromSeconds(-300)).ToString("r"));
        }
    }
}