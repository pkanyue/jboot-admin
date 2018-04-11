package io.jboot.admin.base.plugin.jwt.shiro;

import org.apache.shiro.authc.AuthenticationToken;

/**
 * jwt shiro token
 * @author Rlax
 *
 */
public class JwtAuthenticationToken implements AuthenticationToken {

    /** 用户id */
    private String userId;

    /** token */
    private String token;

    public JwtAuthenticationToken(String userId, String token) {
        this.userId = userId;
        this.token = token;
    }

    @Override
    public Object getPrincipal() {
        return userId;
    }

    @Override
    public Object getCredentials() {
        return token;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
