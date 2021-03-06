package com.soho.shiro.cache.imp;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.soho.shiro.cache.CacheManager;
import com.soho.web.domain.ProjectInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Collection;
import java.util.Set;

/**
 * Shiro缓存实现类
 *
 * @author shadow
 */
public class ShiroDataCache<K, V> implements Cache<Object, V> {

    @Autowired(required = false)
    private CacheManager cacheManager;
    @Autowired(required = false)
    private ProjectInfo projectInfo;

    public void clear() throws CacheException {
        getCache().clear();
    }

    public V get(Object key) throws CacheException {
        return getCache().get(getProjectCode() + CacheManager.SHIRO_DATA_CACHE + key);
    }

    public Set<Object> keys() {
        return getCache().keys();
    }

    public V put(Object key, V value) throws CacheException {
        getCache().put(getProjectCode() + CacheManager.SHIRO_DATA_CACHE + key, value);
        return value;
    }

    public V remove(Object key) throws CacheException {
        V v = getCache().get(getProjectCode() + CacheManager.SHIRO_DATA_CACHE + key);
        getCache().remove(getProjectCode() + CacheManager.SHIRO_DATA_CACHE + key);
        return v;
    }

    public int size() {
        return (int) getCache().size();
    }

    public Collection<V> values() {
        return getCache().values();
    }

    private com.soho.shiro.cache.Cache getCache() {
        com.soho.shiro.cache.Cache cache = cacheManager.getCache(CacheManager.SHIRO_DATA_CACHE);
        if (cache == null) {
            System.out.println("cache is null");
        }
        return cache;
    }

    private String getProjectCode() {
        if (projectInfo != null && !StringUtils.isEmpty(projectInfo.getCode())) {
            return projectInfo.getCode() + "_";
        }
        return "";
    }

    public CacheManager getCacheManager() {
        return cacheManager;
    }

    public void setCacheManager(CacheManager cacheManager) {
        this.cacheManager = cacheManager;
    }

}
