package io.jboot.admin.base.web.render.error;

import com.jfinal.render.Render;

/**
 * 错误输出基类
 * @author Rlax
 *
 */
public abstract class BaseErrorRender extends Render {

    public BaseErrorRender(int errorCode, String errorMessage) {
        this.errorCode = errorCode;
        this.errorMessage = errorMessage;
    }

    /** 错误码 */
    protected int errorCode;

    /** 错误异常内容 */
    protected String errorMessage;

    public int getErrorCode() {
        return errorCode;
    }

    public String getErrorMessage() {
        return errorMessage;
    }
}
