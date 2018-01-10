package io.jboot.admin.base.plugin.shiro.cache;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * 封装shiro manager 扩展使用 redis/ehcache
 * @author Rlax
 *
 */
public class ShiroCacheManager implements CacheManager {

	private final ConcurrentMap<String, Cache> caches = new ConcurrentHashMap<String, Cache>();

	@Override
    public <K, V> Cache<K, V> getCache(String name) throws CacheException {
		Cache c = caches.get(name);
		if (c == null) {
			c = new ShiroCache<K, V>(name);
			caches.put(name, c);
		}
		return c;
	}

}
