package io.jboot.admin.support.enjoy.directive;

import com.jfinal.template.Env;
import com.jfinal.template.stat.ParseException;
import com.jfinal.template.stat.Scope;
import io.jboot.admin.base.common.BaseStatus;
import io.jboot.web.directive.annotation.JFinalDirective;
import io.jboot.web.directive.base.JbootDirectiveBase;

import com.jfinal.template.io.Writer;

/**
 * 状态下拉Option指令
 * @author Rlax
 *
 */
@JFinalDirective("statusOption")
public class OptionStatusDirective extends JbootDirectiveBase {

    /** 状态类全路径 例如：com.AbcStatus */
    private BaseStatus status;
    private String value;

    @Override
    public void exec(Env env, Scope scope, Writer writer) {
        if (exprList.length() > 2) {
            throw new ParseException("Wrong number parameter of #date directive, two parameters allowed at most", location);
        }

        status = getParam(0, scope);
        if (status == null) {
            throw new ParseException("status is null", location);
        }

        if (exprList.length() > 1) {
            value = getParam(1, "", scope);
        }

        for (String key : status.all().keySet()) {
            if (value != null && key.equals(value)) {
                write(writer, "<option selected value=\"" + key  + "\">" + status.desc(key) + "</option>");
            } else {
                write(writer, "<option value=\"" + key  + "\">" + status.desc(key) + "</option>");
            }
        }
    }

    @Override
    public void onRender(Env env, Scope scope, Writer writer) {

    }
}
