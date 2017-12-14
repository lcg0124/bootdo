package com.bootdo.common.cache;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
/**
 * Created by LaoWang on 2017/5/4.
 * 使用CacheBuilder本地缓存用以缓解大数据量的查询
 */
@Service("CacheService")
public class CacheService {
    private static final Logger LOGGER = LoggerFactory.getLogger(CacheService.class);

//    @Autowired
//    AppConfigMapper appConfigMapper;
//
//
//    public AppConfig selectAppConfig(final String appkey) throws ExecutionException {
//        LOGGER.info("使用本地缓存加载APP权限....");
//        return CacheBuilder.get(new Object[]{"selectAppConfigByAppKey", appkey}, 3, TimeUnit.MINUTES, new Callable<AppConfig>() {
//            @Override
//            public AppConfig call() throws Exception {
//                AppConfig appConfig = appConfigMapper.selectAppConfigByAppKey(appkey);
//                return appConfig;
//            }
//        });
//    }
}
