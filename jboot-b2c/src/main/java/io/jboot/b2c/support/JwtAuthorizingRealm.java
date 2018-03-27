package io.jboot.b2c.support;

import io.jboot.Jboot;
import io.jboot.admin.base.common.CacheKey;
import io.jboot.admin.base.plugin.jwt.shiro.JwtAuthenticationToken;
import io.jboot.admin.base.plugin.shiro.ShiroCacheUtils;
import io.jboot.utils.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

/**
 * JwtAuthorizingRealm
 * @author Rlax
 *
 */
public class JwtAuthorizingRealm extends AuthorizingRealm {

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JwtAuthenticationToken;
    }

    @Override
    public void setCacheManager(CacheManager cacheManager) {
        super.setCacheManager(cacheManager);
        ShiroCacheUtils.setCacheManager(cacheManager);
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        JwtAuthenticationToken jwtToken = (JwtAuthenticationToken) token;
        String uid = (String) jwtToken.getPrincipal();

        String uidCache = Jboot.me().getCache().get(CacheKey.CACHE_JWT_TOKEN, uid);
        if (StringUtils.isNotBlank(uidCache)) {
            /** 说明改 token 已被加入黑名单 */
            throw new UnknownAccountException();
        }

        return new SimpleAuthenticationInfo(uid, jwtToken.getCredentials(), this.getName());
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        return null;
    }
}
