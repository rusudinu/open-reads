package com.openreads.openreads.config;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import lombok.RequiredArgsConstructor;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.codec.JsonJacksonCodec;
import org.redisson.config.Config;
import org.redisson.spring.cache.CacheConfig;
import org.redisson.spring.cache.RedissonSpringCacheManager;
import org.redisson.spring.data.connection.RedissonConnectionFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Configuration
@EnableCaching
@RequiredArgsConstructor
public class RedisCacheConfig {

    private static final long SECONDS = 1000L;

    private static final long MINUTES = 60L * SECONDS;

    private static final long HOURS = 3600L * SECONDS;

    public static final String MANAGER = "redisCacheManager";

    public static final String BOOK_DATA = "book-data";

    public static final String BOOK_COMMENTS = "book-comments";

    @Value("${open-reads.redis.cachePrefix:}")
    private String cachePrefix;

    @Value("${open-reads.redis.endpoint:}")
    private String redisAddress;

    @Bean(destroyMethod = "shutdown")
    public RedissonClient redisson() throws IOException {

        Config config = Config.fromYAML(getClass().getClassLoader().getResourceAsStream("redisson.yaml"));
        config.useSingleServer().setNameMapper(new RedissonCacheNameMapper(cachePrefix));
        config.useSingleServer().setAddress("redis://" + redisAddress);

        return Redisson.create(config);
    }

    @Bean
    public RedissonConnectionFactory redissonConnectionFactory(RedissonClient redisson) {
        return new RedissonConnectionFactory(redisson);
    }

    @Bean
    public RedisTemplate<String, Object> redisTemplate(RedissonConnectionFactory redissonConnectionFactory) {
        RedisTemplate<String, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(redissonConnectionFactory);
        template.setKeySerializer(new StringRedisSerializer());
        template.setValueSerializer(new StringRedisSerializer());
        return template;
    }

    @Bean(MANAGER)
    @Primary
    CacheManager cacheManager(RedissonClient redissonClient) {
        Map<String, CacheConfig> cacheNamesConfigurationMap = new HashMap<>();
        cacheNamesConfigurationMap.put(BOOK_DATA, getCacheConfig(2 * HOURS));
        cacheNamesConfigurationMap.put(BOOK_COMMENTS, getCacheConfig(10 * MINUTES));

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
        JsonJacksonCodec jsonJacksonCodec = new JsonJacksonCodec(objectMapper);
        return new RedissonSpringCacheManager(redissonClient, cacheNamesConfigurationMap, jsonJacksonCodec);
    }

    private CacheConfig getCacheConfig(long milisec) {
        CacheConfig cacheConfig = new CacheConfig();
        cacheConfig.setTTL(milisec);
        return cacheConfig;
    }
}
