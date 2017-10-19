using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text.RegularExpressions;

namespace JSExamples
{
    public partial class Regexs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            #region 贪婪与懒惰

            string _reg = @"a\w*b";

            Regex _pattern = new Regex(_reg, RegexOptions.IgnoreCase);

            var _result = _pattern.Match("acccccccccccb").Value; //acccccccccccb


            _reg = @"a\w*?b";

            _pattern = new Regex(_reg, RegexOptions.IgnoreCase);

            _result = _pattern.Match("abcccccccccccb").Value; //ab


            #endregion


            #region 命名捕获

            //命名捕获组

            string reg = @"(?<mas>\d)\w{1,3}\1";

            string reg2 = @"(?<mas>\d)\w{1,3}\k<mas>";

            Regex r1 = new Regex(reg2, RegexOptions.IgnoreCase);

            var result = r1.Match("1abc1").Value;//1abc1


            #endregion



            #region 零宽断言

            //零宽断言 
            //用于查找在某些内容(但并不包括这些内容)之前或之后的东西，像\b,^,$那样用于指定一个位置，这个位置应该满足一定的条件(即断言)，因此它们也被称为零宽断言。

            //(?=exp)正向断言	     匹配exp前面的位置

            string reg3 = "java(?=script)";

            Regex r2 = new Regex(reg3, RegexOptions.IgnoreCase);

            var result2 = r2.Match("javascript").Value;//java



            //(?<=exp)反向断言	 匹配exp后面的位置

            string reg4 = "(?<=java)script";

            Regex r3 = new Regex(reg4, RegexOptions.IgnoreCase);

            var result3 = r3.Match("javascript").Value;//script



            //(?!exp)正向否定断言	  匹配后面跟的不是exp的位置

            string reg5 = "java(?!script)";

            Regex r4 = new Regex(reg5, RegexOptions.IgnoreCase);

            var result4 = r4.Match("javaEE").Value;//java



            //(?<!exp)反向否定断言	 匹配前面不是exp的位置

            string reg6 = "(?<!java)script";

            Regex r5 = new Regex(reg6, RegexOptions.IgnoreCase);

            var result5 = r5.Match("Jscript").Value;//script


            //(?<!comment) 这种类型的分组不对正则表达式的处理产生任何影响

            string reg7 = "(?#备注)script";

            Regex r6 = new Regex(reg7, RegexOptions.IgnoreCase);

            var result6 = r6.Match("Jscript").Value;//script

            #endregion



            #region 平衡组/递归匹配


            string regg = @"(?'group'()(?'-group'()(?(group)\d|\w)(?!)";

            Regex r = new Regex(regg, RegexOptions.IgnoreCase);




            #endregion

        }
    }
}