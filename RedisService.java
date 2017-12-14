package com.bootdo.common.cache;

import com.bootdo.common.utils.MD5Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * 对 Redis 客户端的包装
 * created at 2016/8/30
 *
 * @author LaoWang
 */
@Service
public class RedisService implements Cache {


    public static final Random r = new Random();

    static final Logger logger = LoggerFactory.getLogger(RedisService.class);

    @Autowired
    private JedisPool jedisPool;

    @Override
    public Jedis getResource() {
        return jedisPool.getResource();
    }

    @SuppressWarnings("deprecation")
    @Override
    public void returnResource(Jedis jedis) {
        if(jedis != null){
            jedisPool.returnResourceObject(jedis);
        }
    }

    /**
     * 设置缓存
     * @param key
     * @param value
     */
    @Override
    public void set(String key, String value) {
        Jedis jedis=null;
        try{
            jedis = getResource();
            jedis.set(key, value);
            logger.info("Redis set success - " + key + ", value:" + value);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Redis set error: "+ e.getMessage() +" - " + key + ", value:" + value);
        }finally{
            returnResource(jedis);
        }
    }

    /**
     * 获取缓存值
     * @param key
     * @return
     */
    @Override
    public String get(String key) {
        String result = null;
        Jedis jedis=null;
        try{
            jedis = getResource();
            result = jedis.get(key);
            logger.info("Redis get success - " + key + ", value:" + result);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Redis set error: "+ e.getMessage() +" - " + key + ", value:" + result);
        }finally{
            returnResource(jedis);
        }
        return result;
    }

    /**
     * 设置缓存+过期时间
     * @param key
     * @param value
     */
    public void set(String key, String value, int timeout, TimeUnit unit) {
        Jedis jedis=null;
        if (null == value) {
            logger.error("Setting null value: ", new IllegalArgumentException());
            return;
        }
        try{
            jedis = getResource();
            jedis.setex(key, (int) unit.toSeconds(timeout), value);
            logger.info("Redis set success - " + key + ", value:" + value);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Redis set error: "+ e.getMessage() +" - " + key + ", value:" + value);
        }finally{
            returnResource(jedis);
        }
    }

    public boolean setIfNotExists(String key, String value) {
        int result = 0;
        Jedis jedis=null;
        try{
            jedis = getResource();
            result = jedis.setnx(key, value).intValue();
            logger.info("Redis get success - " + key + ", value:" + result);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Redis set error: "+ e.getMessage() +" - " + key + ", value:" + result);
        }finally{
            returnResource(jedis);
        }
        return result > 0;
    }

    /**
     * 增加值，返回增加后的值
     * @param key
     * @param incre
     * @return
     */
    public long increment(String key, long incre) {
        Jedis jedis=null;
        try{
            jedis = getResource();
            return jedis.incrBy(key, incre);
        } catch (Exception e) {
            e.printStackTrace();
            jedis.del(key).intValue();
            jedis.set(key, String.valueOf(incre));
            logger.error("Redis increment error: "+ e.getMessage() +" - " + key);
            return incre;
        }finally{
            returnResource(jedis);
        }
    }

    /**
     * 删除键
     * @param key
     */
    public void delete(String key) {
        Jedis jedis=null;
        try{
            jedis = getResource();
            jedis.del(key).intValue();
            logger.info("Redis delete success - " + key);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Redis delete error: "+ e.getMessage() +" - " + key);
        }finally{
            returnResource(jedis);
        }
    }

    /**
     * 设置key过期时间
     * @param key
     * @param time
     * @param timeUnit
     */
    public void expire(String key, int time, TimeUnit timeUnit) {
        Jedis jedis=null;
        try{
            jedis = getResource();
            jedis.expire(key, (int) timeUnit.toSeconds(time));
            logger.info("Redis expire success - " + key);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Redis expire error: "+ e.getMessage() +" - " + key);
        }finally{
            returnResource(jedis);
        }
    }

    /**
     * 返回key是否存在
     * @param key
     * @return
     */
    public boolean keyExists(String key) {
        Jedis jedis=null;
        try{
            jedis = getResource();
            logger.info("Redis keyExists success - " + key);
            return jedis.exists(key);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Redis keyExists error: "+ e.getMessage() +" - " + key);
            return true;
        }finally{
            returnResource(jedis);
        }
    }

    public int countBetween(String key,String min,String max) {
        Jedis jedis=null;
        try{
            jedis = getResource();
            logger.info("Redis countBetween success - " + key);
            return jedis.zcount(key, min, max).intValue();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Redis countBetween error: "+ e.getMessage() +" - " + key);
            return 0;
        }finally{
            returnResource(jedis);
        }
    }

    public int add(String key,String member,double score) {
        int result = 0;
        Jedis jedis=null;
        try{
            jedis = getResource();
            result = jedis.zadd(key, score, member).intValue();
            logger.info("Redis add success - " + key + ", value:" + result);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Redis add error: "+ e.getMessage() +" - " + key + ", value:" + result);
        }finally{
            returnResource(jedis);
        }
        return result;
    }

    /**
     * 判断键值类型是否为hash
     * @param key
     * @return
     */
    public boolean isHash(String key) {
        boolean result = false;
        Jedis jedis=null;
        try{
            jedis = getResource();
            result = jedis.type(key).equals("hash");
            logger.info("Redis get success - " + key + ", value:" + result);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Redis set error: "+ e.getMessage() +" - " + key + ", value:" + result);
        }finally{
            returnResource(jedis);
        }
        return result;
    }

    /**
     * 取消同步锁
     * @param lockName
     */
    public void releaseLock(String lockName) {
        Jedis jedis=null;
        try{
            jedis = getResource();
            String md5Key = MD5Utils.sign("lock" + "" + lockName, "", "utf-8");
            jedis.del(md5Key);
            logger.info("Redis releaseLock success - " + lockName);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Redis releaseLock error: "+ e.getMessage() +" - " + lockName);
        }finally{
            returnResource(jedis);
        }
    }

    /**
     * 设置同步锁
     * @param cacheKey
     * @param lockTimeSec
     */
    public void acquireLock(String cacheKey, int lockTimeSec) {
        Jedis jedis=null;
        try{
            jedis = getResource();
            long start = System.currentTimeMillis();
            String md5Key = MD5Utils.sign("lock" + "" + cacheKey, "", "utf-8");
            int i = 0;
            int maxCount = (lockTimeSec * 1000) / 2;
            int sleepTime = 4;
            // 在获取到锁之前一直等待
            while (true) {

                if (System.currentTimeMillis() - start > lockTimeSec * 1000) {
                    break;
                }
                synchronized (Boolean.TRUE) {
                    if (jedis.setnx(md5Key, "LOCKED") == 1) {
                        jedis.expire(md5Key, lockTimeSec);
                        break;
                    }
                }

                // 短暂休眠，nano避免出现活锁
                try {
                    Thread.sleep(sleepTime, r.nextInt(500));
                } catch (InterruptedException e) {
                    logger.error(e.getMessage(), e);
                }
                i++;

                if ((maxCount * 0.3) < i) {
                    sleepTime = 3;
                }

                if ((maxCount * 0.5) < i) {
                    sleepTime = 2;
                }

                if (maxCount * 0.8 < i) {
                    sleepTime = 1;
                }
            }
            logger.info("Redis acquireLock success - " + cacheKey);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Redis acquireLock error: "+ e.getMessage() +" - " + cacheKey);
        }finally{
            returnResource(jedis);
        }
    }

    /**
     * 多个服务器之间的同步锁
     *
     * @param lockName    锁名字
     * @param lockTimeSec 锁存在的最长时间
     * @param runnable    获取锁之后要执行的内容
     */
    public void lockAndRun(String lockName, int lockTimeSec, Runnable runnable) {
        Jedis jedis=null;
        try{
            jedis = getResource();
            String md5Key = MD5Utils.sign("lock" + "" + lockName, "", "utf-8");
            int i = 0;
            int maxCount = (lockTimeSec * 1000) / 2;
            int sleepTime = 4;

            // 在获取到锁之前一直等待
            while (true) {
                synchronized (Boolean.TRUE) {
                    if (jedis.setnx(md5Key, "LOCKED") == 1) {
                        jedis.expire(md5Key, lockTimeSec);
                        break;
                    }
                }
                // 短暂休眠，nano避免出现活锁
                try {
                    Thread.sleep(sleepTime, r.nextInt(500));
                } catch (InterruptedException e) {
                    logger.error(e.getMessage(), e);
                }

                i++;

                if ((maxCount * 0.3) < i) {
                    sleepTime = 3;
                }

                if ((maxCount * 0.5) < i) {
                    sleepTime = 2;
                }

                if (maxCount * 0.8 < i) {
                    sleepTime = 1;
                }
            }

            try {
                runnable.run();
            } finally {
                jedis.del(md5Key);
            }
            logger.info("Redis lockAndRun success - " + lockName);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("Redis lockAndRun error: "+ e.getMessage() +" - " + lockName);
        }finally{
            returnResource(jedis);
        }
    }
}
