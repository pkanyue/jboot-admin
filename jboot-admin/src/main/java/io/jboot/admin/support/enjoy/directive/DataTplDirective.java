package io.jboot.admin.support.enjoy.directive;

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
@JFinalDirective("dataTpl")
public class DataTplDirective extends JbootDirectiveBase {

    @JbootrpcService
    private DataService dataApi;

    /** 数据字典类型编码 */
    private String typeCode;
    /** 属性名默认status，laytpl 里 d.attrName */
    private String attrName;

    @Override
    public void exec(Env env, Scope scope, Writer writer) {
        if (exprList.length() > 2) {
            throw new ParseException("Wrong number parameter of #date directive, two parameters allowed at most", location);
        }

        typeCode = getParam(0, scope);
        if (StrKit.isBlank(typeCode)) {
            throw new ParseException("typeCode is null", location);
        }

        if (exprList.length() > 1) {
            attrName = getParam(1, "type", scope);
        }
        List<Data> list = dataApi.getListByTypeOnUse(typeCode);

        write(writer, "<div>");
        for (Data data : list) {
            write(writer, "{{#  if(d." + attrName + " == \\'" + data.getCode() + "\\') { }}");
            write(writer, data.getCodeDesc());
            write(writer, "{{#  } }}");
        }
        write(writer, "</div>");
    }

    @Override
    public void onRender(Env env, Scope scope, Writer writer) {

    }
}
