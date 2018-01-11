package io.jboot.admin.validator.system;

import com.jfinal.core.Controller;
import io.jboot.admin.base.web.base.JsonValidator;

/**
 * 系统资源校验器
 * @author Rlax
 *
 */
public class ResValidator extends JsonValidator {

    @Override
    protected void validate(Controller c) {
        String methodName = getActionMethod().getName();
        if ("postAdd".equals(methodName)) {
            validateRequiredString("pid", "父资源编码为空");
            validateRequiredString("res.name", "资源名称为空");
            validateRequiredString("res.url", "资源URL为空");
            validateRequiredString("res.des", "资源描述为空");
            validateRequiredString("res.type", "资源类型为空");
            validateRequiredString("res.seq", "排序号为空");
            validateRequiredString("res.status", "资源状态为空");
        } else if ("postUpdate".equals(methodName)) {
            validateRequiredString("pid", "父资源编码为空");
            validateRequiredString("res.name", "资源名称为空");
            validateRequiredString("res.url", "资源URL为空");
            validateRequiredString("res.des", "资源描述为空");
            validateRequiredString("res.type", "资源类型为空");
            validateRequiredString("res.seq", "排序号为空");
            validateRequiredString("res.status", "资源状态为空");
        }
    }
}
