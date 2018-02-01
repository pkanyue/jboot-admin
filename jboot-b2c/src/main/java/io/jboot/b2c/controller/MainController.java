package io.jboot.b2c.controller;

import com.jfinal.aop.Before;
import com.jfinal.kit.Ret;
import io.jboot.Jboot;
import io.jboot.admin.base.common.CacheKey;
import io.jboot.admin.base.common.RestResult;
import io.jboot.admin.base.exception.BusinessException;
import io.jboot.admin.base.interceptor.NotNullPara;
import io.jboot.admin.base.plugin.jwt.JwtToken;
import io.jboot.admin.base.web.base.BaseController;
import io.jboot.b2c.support.JwtTokenInterceptor;
import io.jboot.web.controller.annotation.RequestMapping;


/**
 * 主控制器
 * @author Rlax
 *
 */
@RequestMapping("/")
public class MainController extends BaseController {

    @Before(JwtTokenInterceptor.class)
    public void index() {
        renderJson(RestResult.buildSuccess(Ret.create("userId", getJwtPara("userId")).set("version", getJwtPara("version"))));
    }

    /**
     * 调转登录页面
     */
    public void login() {

    }

    /**
     * 登录 基于 jwt
     */
    @NotNullPara({"loginName", "pwd"})
    public void postLogin(String loginName, String pwd) {

        // 实际项目这里应该调用service
        if ("user1".equals(loginName) && "123123".equals(pwd)) {
            // 此处1 为用户id，实际项目中，使用服务查询id
            JwtToken jwtToken =  Jboot.me().getCache().get(CacheKey.CACHE_JWT_TOKEN, String.valueOf(1L));
            if (jwtToken == null) {
                // 新创建 jwt token，此处为 demo
                jwtToken = new JwtToken(String.valueOf(1L), String.valueOf(System.currentTimeMillis()));
                // token 缓存 默认 2小时
                Jboot.me().getCache().put(CacheKey.CACHE_JWT_TOKEN, jwtToken.getUserId(), jwtToken, 2 * 60 * 60);
            }

            setJwtAttr("userId", jwtToken.getUserId());
            setJwtAttr("version", jwtToken.getVersion());
        } else {
            throw new BusinessException("用户名密码错误");
        }

        renderJson(RestResult.buildSuccess("登录成功"));
    }

    @Before(JwtTokenInterceptor.class)
    public void logout() {
        Jboot.me().getCache().remove(CacheKey.CACHE_JWT_TOKEN, getJwtPara("userId"));
        renderJson(RestResult.buildSuccess("退出成功"));
    }
}
