package io.jboot.admin.base.rest.datatable;

import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * layui 数据表格
 * @author Rlax
 *
 */
public class DataTable<T> {

    private int code = 0;
    private String msg;
    private int count;

    private List<T> data;

    public DataTable() {}

    public DataTable(Page<T> page) {
        this.count = page.getTotalRow();
        this.data = page.getList();
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
