package io.jboot.admin.service.entity.status.system;

import io.jboot.admin.base.common.BaseStatus;

/**
 * 系统用户状态类
 * @author Rlax
 *
 */
public class UserStatus extends BaseStatus {

    public final static String REGISTER = "0";
    public final static String USED = "1";
    public final static String LOCKED = "2";

    public UserStatus() {
        add(REGISTER, "注册");
        add(USED, "在用");
        add(LOCKED, "锁定");
    }

    private static UserStatus me;

    public static UserStatus me() {
        if (me == null) {
            me = new UserStatus();
        }
        return me;
    }
}
