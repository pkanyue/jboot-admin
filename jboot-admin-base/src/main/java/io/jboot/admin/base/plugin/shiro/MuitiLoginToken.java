package io.jboot.admin.base.plugin.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 多用途登录 token 支持用户名/密码 与 app token 登录模式 如需添加其他模式，请在对应Realm中实现对应认证策略
 * <br>当为token 模式时候，token 传入到 password 属性中
 * @author Rlax
 * 
 */
public class MuitiLoginToken extends UsernamePasswordToken {

	private static final long serialVersionUID = 13810646381777514L;

	/** 用户名密码登录模式 */
	public final static String USERPASSWORD_MODE = "userpassword_mode";
	/** token登录模式 */
	public final static String TOKEN_MODE = "token_mode";
	
	/**
	 * 登录类型  默认为用户名密码登录模式
	 */
	private String loginType = USERPASSWORD_MODE;

	public String getLoginType() {
		return this.loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	/**
	 * 构造方法
	 */
	public MuitiLoginToken(String username, String password) {
		super(username, password);
	}

}
