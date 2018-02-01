package io.jboot.admin.base.plugin.jwt;

import java.io.Serializable;

/**
 * JwtToken
 * @author Rlax
 *
 */
public class JwtToken implements Serializable {

    public JwtToken() {

    }

    public JwtToken(String userId, String version) {
        this.userId = userId;
        this.version = version;
    }

    /** 用户id */
    private String userId;
    /** 版本号 */
    private String version;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }
}
