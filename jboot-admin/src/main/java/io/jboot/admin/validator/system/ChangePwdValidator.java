package io.jboot.admin.validator.system;

import com.jfinal.core.Controller;
import io.jboot.admin.base.web.base.JsonValidator;
import io.jboot.admin.service.entity.model.User;
import io.jboot.admin.support.auth.AuthUtils;


/**
 * 修改密码校验器
 * @author Rlax
 *
 */
public class ChangePwdValidator extends JsonValidator {

    @Override
    protected void validate(Controller c) {
        String pwd =  c.getPara("user.pwd");
        String newPwd =  c.getPara("newPwd");
        String rePwd =  c.getPara("rePwd");

        validateRequiredString("user.pwd", "旧密码不能为空");
        validateRequiredString("newPwd", "新密码不能为空");
        validateRequiredString("rePwd", "确认密码不能为空");

        if(!newPwd.equals(rePwd)){
            addError("两次输入密码不一致，请重新输入！");
        }

        User user = AuthUtils.getLoginUser();

        if(!AuthUtils.checkPwd(pwd, user.getPwd(), user.getSalt2())){
            addError("原密码不正确！");
        }
    }
}
