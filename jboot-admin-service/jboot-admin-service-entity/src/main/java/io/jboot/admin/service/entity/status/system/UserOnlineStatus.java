package io.jboot.admin.service.entity.status.system;


import io.jboot.admin.base.common.BaseStatus;

/**
 * 系统用户在线状态类
 * @author Rlax
 *
 */
public class UserOnlineStatus extends BaseStatus {

    public final static String OFFLINE = "0";
    public final static String ONLINE = "1";

    public UserOnlineStatus() {
        add(OFFLINE, "离线");
        add(ONLINE, "在线");
    }

    private static UserOnlineStatus me;

    public static UserOnlineStatus me() {
        if (me == null) {
            me = new UserOnlineStatus();
        }
        return me;
    }
}
