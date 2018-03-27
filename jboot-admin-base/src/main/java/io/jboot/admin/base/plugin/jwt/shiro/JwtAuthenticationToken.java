package io.jboot.admin.base.plugin.jwt.shiro;

import org.apache.shiro.authc.AuthenticationToken;

import java.util.List;

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

    /** 角色 */
    private List<String> roles;

    /** 权限 */
    private List<String> permissions;

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

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }

    public List<String> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<String> permissions) {
        this.permissions = permissions;
    }
}
