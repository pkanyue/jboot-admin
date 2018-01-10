package io.jboot.admin.base.plugin.shiro.auth;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.subject.PrincipalCollection;

/**
 * 多用途认证器，针对不同认证方式提供公共接口，实现对应接口即可
 * @author Rlax
 *
 */
public interface MuitiAuthenticatied {

    /**
     * token 是否存在，如果不存在将抛出异常
     * @param authenticationToken 认证token
     * @return 存在则返回 true
     */
    public boolean hasToken(AuthenticationToken authenticationToken);

    /**
     * token 是否被锁定，如果锁定将抛出异常
     * @param authenticationToken
     * @return 锁定则返回true
     */
    public boolean wasLocked(AuthenticationToken authenticationToken);

    /**
     * 构建认证信息，提供shiro进行认证
     * @param authenticationToken
     * @return
     */
    public AuthenticationInfo buildAuthenticationInfo(AuthenticationToken authenticationToken);

    /**
     * 构建授权信息
     * @param principals
     * @return
     */
    public AuthorizationInfo buildAuthorizationInfo(PrincipalCollection principals);
}
