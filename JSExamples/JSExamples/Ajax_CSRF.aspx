<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ajax_CSRF.aspx.cs" Inherits="JSExamples.Ajax_CSRF" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>

    <script>
        $(function () {
            $.ajax({
                type: 'get',
                url: 'Ajax_CSRF.aspx',
                data: { username: 'mas', money: 1000 },
                dataType: 'json',
                contentType: 'application/x-www-form-urlencoded',
                //一个额外的"{键:值}"对映射到请求一起发送。
                headers: {
                    'X-CSRF-TOKEN': $('input[name=__RequestVerificationToken]').val()
                },
                beforeSend: function (jqXHR, settings) {

                },
                success: function (data, textStatus, jqXHR) {

                },
                error: function (jqXHR, textStatus, errorThrown) {

                },
                complete: function (jqXHR, textStatus) {
                }
            });

        });
    </script>
</body>
</html>
