<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendIframe.aspx.cs" Inherits="JSExamples.SendIframe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server" target="_myIframe">
        <div>
            <input type="text" name="txtuser" /><br />
        </div>
        <div>
            <input type="text" name="txtpwd" /><br />
        </div>
        <div>
            <input type="text" name="txtaddr" /><br />
        </div>
        <div>
            <input type="submit" value="提交" />
        </div>
    </form>
    <script>
        $(function () {

            $('#form1').submit(function () {

                $('#myIframe').bind('load', function () {
                    var html = $(this).contents().find('body').html();
                    alert(html);
                    console.log(html);
                    $(this).unbind('load');
                });

            });

        });
    </script>
    <iframe id="myIframe" name="_myIframe" src="about:blank" style="display: none;"></iframe>
</body>
</html>
