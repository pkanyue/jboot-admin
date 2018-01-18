package io.jboot.wechat.controller.wechat;

import com.jfinal.kit.JsonKit;
import com.jfinal.weixin.sdk.api.ApiResult;
import io.jboot.web.controller.annotation.RequestMapping;
import io.jboot.wechat.controller.JbootWechatController;

/**
 *
 * @author Rlax
 *
 */
@RequestMapping("/wechat/user")
public class UserController extends JbootWechatController {

    /**
     * index
     */
    public void index() {
        String userJson = (String) getSessionAttr(SESSION_WECHAT_USER_JSON);
        System.out.println(userJson);
        renderJson(userJson);
    }

    @Override
    public Object doGetUserByOpenId(String openid) {
        // 根据自己需求扩展，可以根据openId 得到内部用户
        System.out.println(openid);
        return null;
    }

    @Override
    public Object doSaveOrUpdateUserByApiResult(ApiResult apiResult) {
        // 根据自己需求扩展，比如保存微信用户信息，与内部用户做关联
        System.out.println(JsonKit.toJson(apiResult));
        return apiResult;
    }
}
