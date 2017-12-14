package com.bootdo.common.cache;


import redis.clients.jedis.Jedis;

/**
 * Created by LaoWang on 2017/11/18.
 */
public interface Cache {
    public Jedis getResource();

    public void returnResource(Jedis jedis);

    public void set(String key, String value);

    public String get(String key);


}