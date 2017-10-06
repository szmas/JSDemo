<%@ Page Language="C#" AutoEventWireup="true" %>

<%
    string callBack = Request.QueryString["callback"];
    if (!string.IsNullOrEmpty(callBack))
    {
        Response.Write(callBack + "({\"weatherinfo\":{\"city\":\"北京\",\"cityid\":\"101010100\",\"temp\":\"18\",\"WD\":\"东南风\",\"WS\":\"1级\",\"SD\":\"17%\",\"WSE\":\"1\",\"time\":\"17:05\",\"isRadar\":\"1\",\"Radar\":\"JC_RADAR_AZ9010_JB\",\"njd\":\"暂无实况\",\"qy\":\"1011\",\"rain\":\"0\"}})");
    }
    else
    {
        Response.Write("{\"weatherinfo\":{\"city\":\"北京\",\"cityid\":\"101010100\",\"temp\":\"18\",\"WD\":\"东南风\",\"WS\":\"1级\",\"SD\":\"17%\",\"WSE\":\"1\",\"time\":\"17:05\",\"isRadar\":\"1\",\"Radar\":\"JC_RADAR_AZ9010_JB\",\"njd\":\"暂无实况\",\"qy\":\"1011\",\"rain\":\"0\"}}");
    }
%>