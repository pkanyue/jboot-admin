package io.jboot.admin.base.common;

/**
 * 缓存目录 KEY
 * @author Rlax
 *
 */
public class CacheKey {

	/** 基础数据 对应 data 表 keyValue缓存在cache的name */
	public static final String CACHE_KEYVALUE = "keyValue";

	/** 页面数据缓存 */
	public static final String CACHE_PAGE = "pageCache";

	/** 30分钟缓存 */
	public static final String CACHE_H1M30 = "h1m30";
	
	/** 导航目录缓存 */
	public static final String CACHE_MENU = "menuCache";
	
	/** shiro 授权缓存 */
	public static final String CACHE_SHIRO_AUTH = "shiro-authorizationCache";
	
	/** shiro session在线缓存 */
	public static final String CACHE_SHIRO_ACTIVESESSION = "shiro-active-session";

	/** shiro session踢出缓存 */
	public static final String CACHE_SHIRO_KICKOUTSESSION = "shiro-kickout-session";
	
	/** shiro 密码重试缓存 */
	public static final String CACHE_SHIRO_PASSWORDRETRY = "shiro-passwordRetryCache";
	
	/** shiro SESSION KEY 缓存 */
	public static final String CACHE_SHIRO_SESSION = "shiro-session";
	
	/** 验证码 缓存 */
	public static final String CACHE_CAPTCHAR_SESSION = "captchar-cache";

	/** jwt_token */
	public static final String CACHE_JWT_TOKEN = "jwt_token";
}
