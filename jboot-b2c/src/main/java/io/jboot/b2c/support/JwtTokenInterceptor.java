package io.jboot.b2c.support;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import io.jboot.Jboot;
import io.jboot.admin.base.common.CacheKey;
import io.jboot.admin.base.exception.BusinessException;
import io.jboot.admin.base.plugin.jwt.JwtToken;
import io.jboot.utils.StringUtils;
import io.jboot.web.controller.JbootController;

/**
 * jwt 拦截器
 * @author Rlax
 *
 */
public class JwtTokenInterceptor implements Interceptor {

    @Override
    public void intercept(Invocation inv) {

        if (inv.getController() instanceof JbootController) {
            JbootController c = (JbootController) inv.getController();
            String userId = c.getJwtPara("userId");
            String version = c.getJwtPara("version");

            if (StringUtils.isBlank(userId) || StringUtils.isBlank(version) ) {
                throw new BusinessException("not auth");
            }

            // 此处1L 为测试，实际会从服务获取
            if (!"1".equals(userId)) {
                throw new BusinessException("not auth");
            }

            JwtToken jwtToken =  Jboot.me().getCache().get(CacheKey.CACHE_JWT_TOKEN, userId);
            if (jwtToken == null) {
                throw new BusinessException("not auth");
            }

            if (!jwtToken.getVersion().equals(version)) {
                throw new BusinessException("not auth");
            }
        }

        inv.invoke();
    }

}
