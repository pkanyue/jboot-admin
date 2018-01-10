package io.jboot.admin.base.plugin.shiro.cache;

import io.jboot.Jboot;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.util.CollectionUtils;

import java.util.*;

/**
 * Shiro 缓存，使用jboot cache
 * @author Rlax
 *
 * @param <K>
 * @param <V>
 */
public class ShiroCache<K, V> implements Cache<K, V> {

	public ShiroCache(String cacheName) {
		this.cacheName = cacheName;
	}
	
	private String cacheName;
	
	@Override
    public V get(K key) throws CacheException {
		return Jboot.me().getCache().get(cacheName, key);
	}

	@Override
    public V put(K key, V value) throws CacheException {
		Jboot.me().getCache().put(cacheName, key, value);
		return value;
	}

	@Override
    public V remove(K key) throws CacheException {
		V value = Jboot.me().getCache().get(cacheName, key);
		Jboot.me().getCache().remove(cacheName, key);
		return value;
	}

	@Override
    public void clear() throws CacheException {
		Jboot.me().getCache().removeAll(cacheName);		
	}

	@Override
    public int size() {
		return Jboot.me().getCache().getKeys(cacheName).size();
	}

	@Override
    public Set<K> keys() {
		return (Set<K>) Jboot.me().getCache().getKeys(cacheName);
	}

	@Override
    public Collection<V> values() {
		Collection<V> values = Collections.emptyList();
		List keys = Jboot.me().getCache().getKeys(cacheName);

		if (!CollectionUtils.isEmpty(keys)) {
			values = new ArrayList<V>(keys.size());
			for (Object key : keys) {
				V value = Jboot.me().getCache().get(cacheName, key);
				if (value != null) {
					values.add(value);
				}
			}
		}

		return values;
	}

}
