package io.jboot.admin.service.provider;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.SqlPara;
import io.jboot.admin.service.api.RoleResService;
import io.jboot.admin.service.entity.model.RoleRes;
import io.jboot.admin.service.entity.status.system.RoleStatus;
import io.jboot.aop.annotation.Bean;
import io.jboot.admin.service.api.RoleService;
import io.jboot.admin.service.entity.model.Role;
import io.jboot.core.rpc.annotation.JbootrpcService;
import io.jboot.db.model.Columns;
import io.jboot.service.JbootServiceBase;

import javax.inject.Inject;
import javax.inject.Singleton;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Bean
@Singleton
@JbootrpcService
public class RoleServiceImpl extends JbootServiceBase<Role> implements RoleService {

    @Inject
    private RoleResService roleResService;

    @Override
    public Page<Role> findPage(Role sysRole, int pageNumber, int pageSize) {
        Columns columns = Columns.create();

        if (StrKit.notBlank(sysRole.getName())) {
            columns.like("name", "%"+sysRole.getName()+"%");
        }

        return DAO.paginateByColumns(pageNumber, pageSize, columns.getList(), "seq asc");
    }

    @Override
    public List<Role> findByUserName(String name) {
        SqlPara sp = Db.getSqlPara("system-role.findByUserName");
        sp.addPara(name);
        return DAO.find(sp);
    }

    @Override
    public boolean auth(Long id, String resIds) {
        List<RoleRes> roleResList = new ArrayList<RoleRes>();

        return Db.tx(new IAtom() {
            @Override
            public boolean run() throws SQLException {
                roleResService.deleteByRoleId(id);

                if (StrKit.notBlank(resIds)) {
                    String[] ress = resIds.split(",");

                    for (String resId : ress) {
                        RoleRes roleRes = new RoleRes();
                        roleRes.setRoleId(id);
                        roleRes.setResId(Long.parseLong(resId));
                        roleResList.add(roleRes);
                    }

                    int[] rets = Db.batchSave(roleResList, roleResList.size());
                    for (int ret : rets) {
                        if (ret < 1) {
                            return false;
                        }
                    }
                }

                return true;
            }
        });
    }

    @Override
    public List<Role> findByStatusUsed() {
        return DAO.findListByColumn("status", RoleStatus.USED);
    }
}