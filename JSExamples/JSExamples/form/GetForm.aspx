<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetForm.aspx.cs" Inherits="JSExamples.GetForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="button" id="btn" value="back" />
            <input type="button" id="btn2" value="back" />
            <input type="button" id="btn3" value="go" />
            <input type="button" id="btn4" value="go" />
            <script>
                document.getElementById('btn').onclick = function () {
                    history.back();
                }
                document.getElementById('btn2').onclick = function () {
                    history.back(-1);
                }
                document.getElementById('btn3').onclick = function () {
                    history.go(-1);
                }
                document.getElementById('btn4').onclick = function () {
                    history.go(1);
                }
            </script>
        </div>
    </form>
</body>
</html>
