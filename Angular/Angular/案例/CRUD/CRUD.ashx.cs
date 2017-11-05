using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Angular.案例
{
    /// <summary>
    /// CRUD 的摘要说明
    /// </summary>
    public class CRUD : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            if (context.Request.Form["id"] != null)
            {
                context.Response.Write("{\"id\":66,\"name\":\"保时捷\",\"price\":50,\"color\":\"红色\",\"speed\":\"200km/h\"}");
            }
            else if (context.Request.QueryString["delete"] != null)
            {
                context.Response.Write("{}");
            }
            else
            {
                context.Response.Write(
                "[{\"id\":1,\"name\":\"保时捷\",\"price\":50,\"color\":\"红色\",\"speed\":\"200km/h\"},{\"id\":2,\"name\":\"保时捷\",\"price\":50,\"color\":\"红色\",\"speed\":\"200km/h\"},{\"id\":3,\"name\":\"保时捷\",\"price\":50,\"color\":\"红色\",\"speed\":\"200km/h\"}]");
            }
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}