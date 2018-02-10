package com.bootdo.testDemo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.concurrent.TimeUnit;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestDemo {
    @Autowired
    RedisTemplate redisTemplate;
    @Test
    public void jTestDemo(){
        // 从缓存中获取城市信息
        String key = "f" ;
        ValueOperations operations = redisTemplate.opsForValue();

        // 缓存存在
        boolean hasKey = redisTemplate.hasKey(key);
        if (hasKey) {
            Object city = operations.get(key);

            System.out.println("CityServiceImpl.findCityById() : 从缓存中获取了城市 >> " + city.toString());
        }

        // 从 DB 中获取城市信息
        String city = "ffsff";

        // 插入缓存
        operations.set(key, city, 120, TimeUnit.SECONDS);
        System.out.println("CityServiceImpl.findCityById() : 城市插入缓存 >> " + city.toString());
        System.out.println("ok");
    }
}
