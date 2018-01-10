package io.jboot.admin.base.exception;

import io.jboot.exception.JbootException;

/**
 * 系统异常
 * @author Rlax
 *
 */
public class SystemException extends JbootException {

	public SystemException() {
		super();
	}

	public SystemException(String message) {
		super(message);
	}

	public SystemException(String message, Throwable cause) {
		super(message, cause);
	}

	public SystemException(Throwable cause) {
		super(cause);
	}

	protected SystemException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}
}
