package com.openreads.openreads.config;

import org.apache.commons.lang3.StringUtils;
import org.redisson.api.NameMapper;

public class RedissonCacheNameMapper implements NameMapper {

    public static final String PREFIX_SEPARATOR = "#";

    String keyPrefix;

    public RedissonCacheNameMapper(String cachePrefix) {
        keyPrefix = PREFIX_SEPARATOR + cachePrefix + PREFIX_SEPARATOR;
    }

    @Override
    public String map(String name) {
        return keyPrefix + name;
    }

    @Override
    public String unmap(String name) {
        return StringUtils.substringAfter(name, keyPrefix);
    }
}

