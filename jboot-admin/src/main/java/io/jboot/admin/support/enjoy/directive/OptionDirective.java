package io.jboot.admin.support.enjoy.directive;

import com.jfinal.kit.LogKit;
import com.jfinal.kit.StrKit;
import com.jfinal.template.Env;
import com.jfinal.template.io.Writer;
import com.jfinal.template.stat.ParseException;
import com.jfinal.template.stat.Scope;
import io.jboot.admin.service.api.DataService;
import io.jboot.admin.service.entity.model.Data;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.web.directive.annotation.JFinalDirective;
import io.jboot.web.directive.base.JbootDirectiveBase;

import java.util.List;

/**
 * 下拉Option指令
 */
@JFinalDirective("option")
public class OptionDirective extends JbootDirectiveBase {

    @JbootrpcService
    private DataService dataApi;

    private String typeCode;
    private String value;

    @Override
    public void exec(Env env, Scope scope, Writer writer) {
        LogKit.info("option====="+typeCode);
        if (exprList.length() > 2) {
            throw new ParseException("Wrong number parameter of #date directive, two parameters allowed at most", location);
        }

        typeCode = getParam(0, scope);
        if (StrKit.isBlank(typeCode)) {
            throw new ParseException("typeCode is null", location);
        }

        if (exprList.length() > 1) {
            value = getParam(1, "", scope);
        }

        List<Data> list = dataApi.getListByTypeOnUse(typeCode);
        for (Data data : list) {
            if (value != null && data.getCode().equals(value)) {
                write(writer, "<option selected value=\"" + data.getCode()  + "\">" + data.getCodeDesc() + "</option>");
            } else {
                write(writer, "<option value=\"" + data.getCode()  + "\">" + data.getCodeDesc() + "</option>");
            }
        }
    }

    @Override
    public void onRender(Env env, Scope scope, Writer writer) {

    }
}
