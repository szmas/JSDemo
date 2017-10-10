<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uploadIframe.aspx.cs" Inherits="JSExamples.form.uploadIframe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
    <style>
        input[type=text] {
            width: 240px;
        }

        input[type=submit] {
            width: 60px;
        }

        .file {
            position: absolute;
            top: -5px;
            left: 250px;
            display: inline-block;
            background: #D0EEFF;
            border: 1px solid #99D3F5;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            color: #1E88C7;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
        }

            .file input {
                position: absolute;
                width: 100px;
                height: 100px;
                right: 0;
                top: 0;
                opacity: 0;
                filter: alpha(opacity=0);
                font-size: 100px;
            }

            .file:hover {
                background: #AADFFD;
                border-color: #78C3F3;
                color: #004974;
                text-decoration: none;
            }
    </style>
</head>
<body>
    <form id="form1" enctype="multipart/form-data" runat="server" target="_myIframe">
        <div>
            <input type="text" name="txtuser" /><br />
        </div>
        <div>
            <input type="text" name="txtpwd" /><br />
        </div>
        <div>
            <input type="text" name="txtaddr" /><br />
        </div>
        <div style="position: relative;">
            <input type="text" name="txtfileName" />
            <a href="javascript:;" class="file">选择文件<input type="file" multiple="multiple" name="txtfile" /></a>
        </div>
        <div>
            <input type="submit" value="提交" />
        </div>
    </form>
    <script>
        $(function () {
            function clearInputFile(f) {
                if (f.value) {
                    try {
                        f.value = ''; //for IE11, latest Chrome/Firefox/Opera...
                    } catch (err) {
                    }
                    if (f.value) { //for IE5 ~ IE10
                        var form = document.createElement('form'), ref = f.nextSibling, p = f.parentNode;
                        form.appendChild(f);
                        form.reset();
                        p.insertBefore(f, ref);
                    }
                }
            }

            $('input[name=txtfile]').on('change', function () {

                $('#form1').prop('action', '?type=upload');

                $('#form1').submit();

                $('#form1').prop('action', '');

                clearInputFile(this);
            });


            $('#form1').submit(function () {

                $('#myIframe').bind('load', function () {
                    var html = $(this).contents().find('body').html();

                    var data = $.parseJSON(html);

                    if (data.type == 'Success') {
                        $('input[name=txtfileName]').val(data.Message);
                    }
                    console.log(html);
                    $(this).unbind('load');
                });

            });

        });
    </script>
    <iframe id="myIframe" name="_myIframe" src="about:blank" style="display: none;"></iframe>
</body>
</html>
