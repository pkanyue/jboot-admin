package io.jboot.admin.support.auth;

import io.jboot.Jboot;
import io.jboot.admin.base.plugin.shiro.auth.MuitiAuthenticatied;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import java.util.ArrayList;
import java.util.List;

/**
 * 管理端认证授权
 * @author Rlax
 *
 */
public class LoginAuth implements MuitiAuthenticatied {

    @Override
    public boolean hasToken(AuthenticationToken authenticationToken) {
        return false;
    }

    @Override
    public boolean wasLocked(AuthenticationToken authenticationToken) {
        return false;
    }

    @Override
    public AuthenticationInfo buildAuthenticationInfo(AuthenticationToken authenticationToken) {

        return null;
    }

    @Override
    public AuthorizationInfo buildAuthorizationInfo(PrincipalCollection principals) {

        return null;
    }
}
