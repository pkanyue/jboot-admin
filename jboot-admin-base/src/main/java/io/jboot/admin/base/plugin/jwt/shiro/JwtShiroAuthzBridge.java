package io.jboot.admin.base.plugin.jwt.shiro;

import com.jfinal.core.Controller;
import io.jboot.component.jwt.JwtShiroBridge;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import java.util.Map;

/**
 * jwt shiro bridge
 * @author Rlax
 *
 */
public class JwtShiroAuthzBridge implements JwtShiroBridge {

    private final static String USER_ID = "userId";
    private final static String ROLES = "ROLE_LIST";
    private final static String PERMISSIONS = "PERMISSIONS";

    @Override
    public Subject buildSubject(Map jwtParas, Controller controller) {
        String userId = (String) jwtParas.get(USER_ID);

        JwtAuthenticationToken token = new JwtAuthenticationToken();
        token.setUserId(userId);
        token.setToken(userId);

        Subject subject = SecurityUtils.getSubject();
        subject.login(token);

        return subject;
    }

}
