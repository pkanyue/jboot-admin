package io.jboot.admin.service.entity.status.system;


import io.jboot.admin.base.common.BaseStatus;

/**
 * 系统角色状态类
 * @author Rlax
 *
 */
public class RoleStatus extends BaseStatus {

    public final static String UNUSED = "0";
    public final static String USED = "1";

    public RoleStatus() {
        add(UNUSED, "停用");
        add(USED, "启用");
    }

    private static RoleStatus me;

    public static RoleStatus me() {
        if (me == null) {
            me = new RoleStatus();
        }
        return me;
    }
}
