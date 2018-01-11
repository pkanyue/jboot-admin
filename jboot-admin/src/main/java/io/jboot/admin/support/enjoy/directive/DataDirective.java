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
 * 根据data的type和value获取对应的字典描述
 */
@JFinalDirective("data")
public class DataDirective extends JbootDirectiveBase {

    @JbootrpcService
    private DataService dataApi;

    /** 数据字典类型编码 */
    private String typeCode;
    /**需要查询的字典代码*/
    private String code;

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
            code = getParam(1,scope);
        }



        List<Data> list = dataApi.getListByTypeOnUse(typeCode);

        if (StrKit.isBlank(code)) {
            write(writer, "");
        } else {
            for (Data data : list) {
                if(code.equals(data.getCode())) {
                    write(writer,data.getCodeDesc());
                }
            }
        }
    }

    @Override
    public void onRender(Env env, Scope scope, Writer writer) {

    }
}
