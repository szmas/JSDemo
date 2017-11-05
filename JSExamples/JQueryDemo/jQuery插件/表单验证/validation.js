; (function ($) {
    $.fn.extend({
        checkForm: function (options) {

            $(':text,:password', this).blur(function () {

                var _validate = $(this).attr("check");
                if (_validate) {
                    var arr = _validate.split(" ");
                    for (var i = 0; i < arr.length; i++) {
                        check($(this), arr[i], $(this).val())
                    }
                }
                $(this).parent().next('.msg').remove();

                if ($(this).val() == "") {
                    var html = "<span class='msg'>不能为空</span>";
                    $(this).parent().after(html);
                }
            });

            $(this).submit(function () {
                var isPass = true;
                $(':text,:password', this).each(function () {
                    if ($(this).val() == "") {
                        isPass = false;
                    }
                    $(this).blur();
                });

                options.callback.call(this,isPass);
				return false;
            });

            // 验证方法
            var check = function (obj, _match, _val) {
                switch (_match) {
                    case 'required':
                        return _val ? showMsg(obj, defaults.tip_success, true) : showMsg(obj, defaults.tip_required, false);
                    case 'email':
                        return chk(_val, defaults.reg_email) ? showMsg(obj, defaults.tip_success, true) : showMsg(obj, defaults.tip_email, false);
                    case 'chinese':
                        return chk(_val, defaults.reg_chinese) ? showMsg(obj, defaults.tip_success, true) : showMsg(obj, defaults.tip_user, false);
                    case 'pw1':
                        return pwd = _val;  //实时储存
                    case 'pw2':
                        return pwdEqual(_val, pwd) ? showMsg(obj, defaults.tip_success, true) : showMsg(obj, defaults.tips_pwdequal, false);
                    case 'phone':
                        return chk(_val, defaults.reg_phone) ? showMsg(obj, defaults.tip_success, true) : showMsg(obj, defaults.tip_phone, false);
                        defaults:
                            return true;
                }
            }

            //判断两次密码是否一致
            var pwdEqual = function (val1, val2) {
                return val1 == val2 ? true : false;
            }

            //正则验证
            var chk = function (str, reg) {
                return reg.test(str);
            }

            //显示信息
            var showMsg = function (obj, msg, mark) {
                $(obj).next("#errormsg").remove();
                var _html = "<span id='errormsg' style='font-size:12px;color:red;'>" + msg + "</span>"
                $(obj).after(_html);
                return mark;
            }
        }
    });
})(jQuery);