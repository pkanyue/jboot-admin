package io.jboot.admin.base.common;

import java.io.Serializable;

/**
 * 错误返回
 * @author Rlax
 *
 */
public class ErrorResult implements Serializable {

    public final static Integer NORMAL_ERROR = 0;
    public final static Integer VALIDATOR_ERROR = 1;
    public final static Integer BUSINESS_ERROR = 2;
    public final static Integer FALL_BACK_ERROR = 100;
    public final static Integer SYSTEM_ERROR = 500;

    private Integer code;
    private String msg;

    public ErrorResult() {

    }

    public ErrorResult(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
