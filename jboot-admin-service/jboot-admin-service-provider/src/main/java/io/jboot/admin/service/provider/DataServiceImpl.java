package io.jboot.admin.service.provider;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import io.jboot.aop.annotation.Bean;
import io.jboot.admin.service.api.DataService;
import io.jboot.admin.service.entity.model.Data;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.db.model.Columns;
import io.jboot.service.JbootServiceBase;

import javax.inject.Singleton;
import java.util.List;
import java.util.Map;

@Bean
@Singleton
@JbootrpcService
public class DataServiceImpl extends JbootServiceBase<Data> implements DataService {

    @Override
    public Page<Data> findPage(Data data, int pageNumber, int pageSize) {
        Columns columns = Columns.create();

        if (StrKit.notBlank(data.getType())) {
            columns.like("type", "%"+data.getType()+"%");
        }
        if (StrKit.notBlank(data.getTypeDesc())) {
            columns.like("typeDesc", "%"+data.getTypeDesc()+"%");
        }
        Page<Data> page = DAO.paginateByColumns(pageNumber, pageSize, columns.getList(), "type asc ,orderNo asc");
        return page;
    }

    @Override
    public String getCodeDescByCodeAndType(String code, String type) {
        return null;
    }

    @Override
    public String getCodeByCodeDescAndType(String type, String codeDesc) {
        return null;
    }

    @Override
    public Map<String, String> getMapByTypeOnUse(String type) {
        return null;
    }

    @Override
    public Map<String, String> getMapByType(String type) {
        return null;
    }

    @Override
    public List<Data> getListByTypeOnUse(String type) {
        return null;
    }

    @Override
    public List<Data> getListByType(String type) {
        return null;
    }
}