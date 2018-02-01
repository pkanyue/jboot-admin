var util = {};
util.sendAjax = function(obj) {
    var url = obj.url;
    var data = obj.data;
    var async = obj.async;
    var loadFlag = obj.loadFlag==undefined?false:obj.loadFlag;
    var type = obj.type;
    var cache = obj.cache;
    var successfn = obj.success;
    var unSuccess = obj.unSuccess;
    var completefn = obj.complete;
    var notice = obj.notice;
    async = (async==null || async==="" || typeof(async)=="undefined")? "true" : async;
    cache = (cache==null || cache==="" || typeof(cache)=="undefined")? "false" : cache;
    type = (type==null || type==="" || typeof(type)=="undefined")? "GET" : type.toLocaleUpperCase();
    data = (data==null || data==="" || typeof(data)=="undefined")? {"date": new Date().getTime()} : data;
    notice = (notice==null || notice==="" || typeof(notice)=="undefined")? "true" : notice;

    if (successfn==null || successfn==="" || typeof(successfn)=="undefined") {
        successfn = function (info) {

        }
    }

    if (unSuccess==null || unSuccess==="" || typeof(unSuccess)=="undefined") {
        unSuccess = function (info) {

        }
    }

    if (completefn==null || completefn==="" || typeof(completefn)=="undefined") {
        completefn = function () {

        }
    }

    //POST,PUT 转化成json字符串
    if(type=="POST" || type=="PUT"){

    }
    layui.jquery.ajax({
        type: type,
        async: async,
        data: data,
        url: url,
        cache: cache,
        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
        dataType: 'json',
        timeout:30000,
        beforeSend: function(XMLHttpRequest){
            var token = getCookie('_token');
            if (token) {
                XMLHttpRequest.setRequestHeader("Jwt", token);
            }

            if (loadFlag) {
                layer.load();
            }
        },
        success: function(json, status, xhr){
            if (json.code == '0') {
            	if (notice) {
                    window.top.layer.msg(json.msg, {icon: 1, offset: '30px'});
				}
                successfn(json);
            } else {
                window.top.layer.msg(json.msg, {icon: 2, offset: '30px'});
                unSuccess(json);
            }
        },
        error: function(XMLHttpRequest, status, error) {
            if (XMLHttpRequest.status == 401) {
                layer.msg('请登录后进行操作', {icon: 5});
            } else if (XMLHttpRequest.status == 403) {
                layer.msg('没有权限', {icon: 5});
            } else if (XMLHttpRequest.status == 404) {
                layer.msg('页面未找到', {icon: 5});
            } else if (XMLHttpRequest.status == 500) {
                layer.msg('服务异常，请稍候重试', {icon: 5});
            } else {
                layer.msg('网络异常，请检查网络连接', {icon: 5});
			}
        },
        complete :function(XMLHttpRequest, TS){
            var token = XMLHttpRequest.getResponseHeader("Jwt");
            console.info(token);
            if (token) {
                // 约2小时，小于服务端缓存时间
                setCookie('_token', token, 0.08);
            }

            completefn();
            if (loadFlag) {
            	layer.closeAll('loading');
            }
        }
    });
};


/*set cookie*/
function setCookie(name, value, Days){
    if(Days == null || Days == ''){
        Days = 300;
    }
    var exp  = new Date();
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + "; path=/;expires=" + exp.toGMTString();
}

/*get cookie*/
function getCookie(name) {
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}
