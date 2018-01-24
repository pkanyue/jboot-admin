/*弹出层*/
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
function pop_show(title,url,w,h,f){
	if (title == null || title == '') {
		title=false;
	};
	if (url == null || url == '') {
		url="404.html";
	};
	if (w == null || w == '') {
		w=800;
	};
	if (h == null || h == '') {
		h=($(window).height() - 50);
	};
	layer.open({
		type: 2,
		area: [w+'px', h +'px'],
		fix: false, //不固定
		maxmin: true,
		shadeClose: true,
		shade:0.4,
		title: title,
		content: url,
		end: f
	});
}

/*关闭弹出框口*/
function pop_close(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}

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
    $.ajax({
        type: type,
        async: async,
        data: data,
        url: url,
        cache: cache,
        contentType : "application/x-www-form-urlencoded;charset=UTF-8",
        dataType: 'json',
        timeout:30000,
        beforeSend: function(XMLHttpRequest){
            if (loadFlag) {
                layer.load();
            }
        },
        success: function(json){
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
            completefn();
            if (loadFlag) {
            	layer.closeAll('loading');
            }
        }
    });
};



//移动电话验证，已做限制
util.isMobile = function(val) {
    var str = val.trim();
    if(str.length!=0){
        reg= /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if(!reg.test(str)){
            return false;
        }else{
            return true;
        }
    }else{
        return false;
    }
}

//邮箱验证
util.isEmail = function(val) {
    var str = val.trim();
    if(str.length!=0){
        reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if(!reg.test(str)){
            return false;
        }else{
            return true;
        }
    }else{
        return false;
    }
}

//邮编验证
util.isPostNo = function(val) {
    var str = val.trim();
    if(str.length!=0){
        reg=/^[1-9]d{5}(?!d)$/;
        if(!reg.test(str)){
            return false;
        }else{
            return true;
        }
    }else{
        return false;
    }
}