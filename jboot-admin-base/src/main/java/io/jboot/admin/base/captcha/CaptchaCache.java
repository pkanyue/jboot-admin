package io.jboot.admin.base.captcha;

import com.jfinal.captcha.Captcha;
import com.jfinal.captcha.ICaptchaCache;
import io.jboot.Jboot;
import io.jboot.admin.base.common.CacheKey;

/**
 * 验证码 redis 集群
 * @author Rlax
 *
 */
public class CaptchaCache implements ICaptchaCache {

	@Override
	public void put(Captcha captcha) {
		Jboot.me().getCache().put(CacheKey.CACHE_CAPTCHAR_SESSION, captcha.getKey(), captcha, (int) (captcha.getExpireAt() - System.currentTimeMillis()) / 1000);
	}

	@Override
	public Captcha get(String key) {
		return Jboot.me().getCache().get(CacheKey.CACHE_CAPTCHAR_SESSION, key);
	}

	@Override
	public void remove(String key) {
		Jboot.me().getCache().remove(CacheKey.CACHE_CAPTCHAR_SESSION, key);
	}

	@Override
	public void removeAll() {
		Jboot.me().getCache().removeAll(CacheKey.CACHE_CAPTCHAR_SESSION);
	}

}
