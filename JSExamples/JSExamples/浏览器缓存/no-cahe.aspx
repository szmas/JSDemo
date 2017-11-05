<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="no-cahe.aspx.cs" Inherits="JSExamples.浏览器缓存.no_cache" %>

<%@ OutputCache Duration="30" VaryByParam="*" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%-- <meta http-equiv="Pragma" content="no-cache" />--%>


    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
