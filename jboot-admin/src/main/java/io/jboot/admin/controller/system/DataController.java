package io.jboot.admin.controller.system;

import com.jfinal.plugin.activerecord.Page;
import io.jboot.admin.base.rest.datatable.DataTable;
import io.jboot.admin.base.web.base.BaseController;
import io.jboot.admin.service.api.DataService;
import io.jboot.admin.service.entity.model.Data;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.web.controller.annotation.RequestMapping;

/**
 * 数据字典管理
 * @author Rlax
 *
 */
@RequestMapping("/system/data")
public class DataController extends BaseController {

    @JbootrpcService
    private DataService dataService;

    /**
     * index
     */
    public void index() {
        render("main.html");
    }

    /**
     * 表格数据
     */
    public void tableData() {
        int pageNumber = getParaToInt("pageNumber", 1);
        int pageSize = getParaToInt("pageSize", 30);

        Data data = new Data();
        data.setType(getPara("type"));
        data.setTypeDesc(getPara("typeDesc"));

        Page<Data> dataPage = dataService.findPage(data, pageNumber, pageSize);
        renderJson(new DataTable<Data>(dataPage));
    }

    /**
     * add
     */
    public void add() {
        render("add.html");
    }

    /**
     * 保存提交
     */
    public void postAdd() {

    }

}
