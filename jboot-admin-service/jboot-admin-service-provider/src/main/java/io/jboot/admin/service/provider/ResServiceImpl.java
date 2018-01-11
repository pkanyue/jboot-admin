package io.jboot.admin.service.provider;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.SqlPara;
import io.jboot.admin.base.common.ZTree;
import io.jboot.admin.service.entity.status.system.ResStatus;
import io.jboot.admin.service.entity.status.system.RoleStatus;
import io.jboot.aop.annotation.Bean;
import io.jboot.admin.service.api.ResService;
import io.jboot.admin.service.entity.model.Res;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.db.model.Columns;
import io.jboot.service.JbootServiceBase;

import javax.inject.Singleton;
import java.util.ArrayList;
import java.util.List;

@Bean
@Singleton
@JbootrpcService
public class ResServiceImpl extends JbootServiceBase<Res> implements ResService {

    @Override
    public Page<Res> findPage(Res sysRes, int pageNumber, int pageSize) {
        Columns columns = Columns.create();

        columns.eq("pid", sysRes.getPid() == null ? 0L : sysRes.getPid());
        if (StrKit.notBlank(sysRes.getName())) {
            columns.like("name", "%"+sysRes.getName()+"%");
        }
        if (StrKit.notBlank(sysRes.getUrl())) {
            columns.like("url", "%"+sysRes.getUrl()+"%");
        }

        return DAO.paginateByColumns(pageNumber, pageSize, columns.getList(), "seq asc");
    }

    @Override
    public List<ZTree> findTreeOnUse() {
        Columns columns = Columns.create();
        columns.eq("status", ResStatus.USED);
        List<Res> list = DAO.findListByColumns(columns, "pid desc, seq asc");

        List<ZTree> zList = new ArrayList<ZTree>();
        for (Res res : list) {
            ZTree ztree = new ZTree(res.getId(), res.getName(), res.getPid());
            zList.add(ztree);
        }
        return zList;
    }

    @Override
    public List<ZTree> findAllTree() {
        List<Res> list = findAll();

        List<ZTree> zList = new ArrayList<ZTree>();
        for (Res res : list) {
            ZTree ztree = new ZTree(res.getId(), res.getName(), res.getPid());
            zList.add(ztree);
        }
        return zList;
    }

    @Override
    public List<ZTree> findTreeOnUseByRoleId(Long id) {
        List<ZTree> allTree = findTreeOnUse();
        List<Res> resList = findByRoleIdAndStatusUsed(id);

        List<Long> idList = new ArrayList<Long>();
        for (Res res : resList) {
            idList.add(res.getId());
        }

        for (ZTree tree : allTree) {
            if (idList.contains(tree.getId())) {
                tree.checked();
            }
        }
        return allTree;
    }

    @Override
    public List<Res> findByRoleIdAndStatusUsed(Long id) {
        SqlPara sp = Db.getSqlPara("system-res.findByRoleIdAndStatusUsed");
        sp.addPara(ResStatus.USED);
        sp.addPara(RoleStatus.USED);
        sp.addPara(id);
        return DAO.find(sp);
    }

    @Override
    public List<Res> findByStatus(String status) {
        return DAO.findListByColumn("status", status);
    }

    @Override
    public List<Res> findByUserNameAndStatusUsed(String name) {
        SqlPara sp = Db.getSqlPara("system-res.findByUserNameAndStatusUsed");
        sp.addPara(ResStatus.USED);
        sp.addPara(RoleStatus.USED);
        sp.addPara(name);
        return DAO.find(sp);
    }

    @Override
    public List<Res> findTopMenuByUserName(String name) {
        SqlPara sp = Db.getSqlPara("system-res.findTopMenuByUserName");
        sp.addPara(ResStatus.USED);
        sp.addPara(RoleStatus.USED);
        sp.addPara(0L);
        sp.addPara(name);
        return DAO.find(sp);
    }

    @Override
    public List<Res> findLeftMenuByUserNameAndPid(String name, Long pid) {
        SqlPara sp = Db.getSqlPara("system-res.findLeftMenuByUserNameAndPid");
        sp.addPara(ResStatus.USED);
        sp.addPara(RoleStatus.USED);
        sp.addPara(pid);
        sp.addPara(name);
        return DAO.find(sp);
    }

    @Override
    public boolean hasChildRes(Long id) {
        return DAO.findFirstByColumn("pid", id) != null;
    }
}