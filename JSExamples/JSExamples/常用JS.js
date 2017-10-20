//Dom选择器
function $$(id) {
    return !id ? null : document.getElementById(id);
}


//浏览器版本
var BROWSER = {}
function getBrowserVersion() {
    var Sys = {};
    var ua = navigator.userAgent.toLowerCase();
    var s;
    (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
    (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
    (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
    (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
    (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] :
    (s = ua.match(/rv:([\d.]+)\) like gecko/)) ? Sys.ie = s[1] : 0;
    return Sys;
};
BROWSER = getBrowserVersion();

//cookie
function setcookie(cookieName, cookieValue, options) {

    options = options || {};

    if (cookieValue == '' || options.expires < 0) {
        cookieValue = '';
        options.expires = -2592000;
    }
    if (options.expires) {
        var t = new Date();
        t.setTime(t.getTime() + options.expires * 1000);
        options.expires = t;
    }
    var cookiepre = 'uyo6_5a1c_';

    //options.domain = !options.domain ? document.domain : options.domain;
    options.path = !options.path ? '/' : options.path;
    document.cookie = escape(cookiepre + cookieName) + '=' + escape(cookieValue)
		+ (options.expires ? '; expires=' + options.expires.toUTCString() : '')
		+ (options.path ? '; path=' + options.path : '/')
		+ (options.domain ? '; domain=' + options.domain : '')
		+ (options.secure ? '; secure' : '');
}

function getcookie(name, nounescape) {
    var cookiepre = 'uyo6_5a1c_';
    name = cookiepre + name;
    var cookie_start = document.cookie.indexOf(name);
    var cookie_end = document.cookie.indexOf(";", cookie_start);
    if (cookie_start == -1) {
        return undefined;
    } else {
        var v = document.cookie.substring(cookie_start + name.length + 1, (cookie_end > cookie_start ? cookie_end : document.cookie.length));
        return !nounescape ? unescape(v) : v;
    }
}



//收藏夹
function addFavorite(title, url) {
    try {
        window.external.addFavorite(url, title);//ie
    } catch (e) {
        try {
            window.sidebar.addPanel(title, url, '');//firefox
        } catch (e) {
            console.log("请按 Ctrl+D 键添加到收藏夹", 'notice');//chrome opera safari
        }
    }
}

//设为首页
function setHomepage(sURL) {
    if (BROWSER.ie) {
        document.body.style.behavior = 'url(#default#homepage)';
        document.body.setHomePage(sURL);
    } else {
        console.log("非 IE 浏览器请手动将本站设为首页", 'notice');
    }
}

//页面离开事件
window.onbeforeunload = function (e) {
    //判断是否出现提示
    if (false) {
        if (BROWSER.ie) {
            // 兼容IE8和Firefox 4之前的版本
            event.returnValue = "确认离开当前页面吗？未保存的数据将会丢失！！";
        } else {
            // Chrome, Safari, Firefox 4+, Opera 12+ , IE 9+
            return "确认离开当前页面吗？未保存的数据将会丢失！";
        }
    }
}

//是否移动端访问
function mobileplayer() {
    var platform = navigator.platform;
    var u = navigator.userAgent;

    var browser = {
        trident: u.indexOf('Trident') > -1, //IE内核
        presto: u.indexOf('Presto') > -1, //opera内核
        webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
        gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1,//火狐内核
        mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
        ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
        android: u.indexOf('Android') > -1 || u.indexOf('Adr') > -1, //android终端
        iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
        iPad: u.indexOf('iPad') > -1, //是否iPad
        webApp: u.indexOf('Safari') == -1, //是否web应该程序，没有头部与底部
        weixin: u.indexOf('MicroMessenger') > -1, //是否微信 （2015-01-22新增）
        qq: u.match(/\sQQ/i) == " qq" //是否QQ
    };

    if (browser.ios || browser.android) {
        return true;
    } else {
        return false;
    }
}

function getCurrentStyle(obj, cssproperty, csspropertyNS) {
    if (obj.style[cssproperty]) {
        return obj.style[cssproperty];
    }
    if (obj.currentStyle) {
        return obj.currentStyle[cssproperty];
    } else if (document.defaultView.getComputedStyle(obj, null)) {
        var currentStyle = document.defaultView.getComputedStyle(obj, null);
        var value = currentStyle.getPropertyValue(csspropertyNS);
        if (!value) {
            value = currentStyle[cssproperty];
        }
        return value;
    } else if (window.getComputedStyle) {
        var currentStyle = window.getComputedStyle(obj, "");
        return currentStyle.getPropertyValue(csspropertyNS);
    }
}