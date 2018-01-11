package io.jboot.admin.service.provider;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import io.jboot.Jboot;
import io.jboot.admin.base.common.CacheKey;
import io.jboot.admin.service.entity.status.system.DataStatus;
import io.jboot.aop.annotation.Bean;
import io.jboot.admin.service.api.DataService;
import io.jboot.admin.service.entity.model.Data;
import io.jboot.core.cache.annotation.Cacheable;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.db.model.Columns;
import io.jboot.service.JbootServiceBase;

import javax.inject.Singleton;
import java.util.LinkedHashMap;
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
        return DAO.paginateByColumns(pageNumber, pageSize, columns.getList(), "type asc ,orderNo asc");
    }

    @Cacheable(name = CacheKey.CACHE_KEYVALUE)
    @Override
    public String getCodeDescByCodeAndType(String code, String type) {
        Columns columns = Columns.create();
        columns.eq("type", type).eq("code", code);
        Data data = DAO.findFirstByColumns(columns);

        String codeDesc = "";
        if (data != null) {
            codeDesc = data.getCodeDesc();
        }
        return codeDesc;
    }

    @Cacheable(name = CacheKey.CACHE_KEYVALUE)
    @Override
    public String getCodeByCodeDescAndType(String type, String codeDesc) {
        Columns columns = Columns.create();
        columns.eq("type", type).eq("codeDesc", codeDesc);
        Data data = DAO.findFirstByColumns(columns);

        String code = "";
        if (data != null) {
            code = data.getCode();
        }
        return code;
    }

    @Cacheable(name = CacheKey.CACHE_KEYVALUE)
    @Override
    public Map<String, String> getMapByTypeOnUse(String type) {
        Columns columns = Columns.create();
        columns.eq("type", type).eq("status", DataStatus.USED);
        List<Data> dataList = DAO.findListByColumns(columns);

        Map<String, String> map = new LinkedHashMap<String, String>();
        for (Data data : dataList) {
            map.put(data.getCodeDesc(), data.getCode());
        }
        return map;
    }

    @Cacheable(name = CacheKey.CACHE_KEYVALUE)
    @Override
    public Map<String, String> getMapByType(String type) {
        Columns columns = Columns.create();
        columns.eq("type", type);
        List<Data> dataList = DAO.findListByColumns(columns);

        Map<String, String> map = new LinkedHashMap<String, String>();
        for (Data data : dataList) {
            map.put(data.getCodeDesc(), data.getCode());
        }
        return map;
    }

    @Cacheable(name = CacheKey.CACHE_KEYVALUE)
    @Override
    public List<Data> getListByTypeOnUse(String type) {
        Columns columns = Columns.create();
        columns.eq("type", type).eq("status", DataStatus.USED);
        return DAO.findListByColumns(columns);
    }

    @Cacheable(name = CacheKey.CACHE_KEYVALUE)
    @Override
    public List<Data> getListByType(String type) {
        Columns columns = Columns.create();
        columns.eq("type", type);
        return DAO.findListByColumns(columns);
    }

    @Override
    public void refreshCache() {
        Jboot.me().getCache().removeAll(CacheKey.CACHE_KEYVALUE);
    }
}