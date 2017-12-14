package com.bootdo.common.config;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * Created by LaoWang on 2017/11/18.
 * 拦截设置本地线程变量
 */
@Aspect
@Component
@Slf4j
public class DataSourceAop {

    private static final Logger logger = LoggerFactory.getLogger(DataSourceContextHolder.class);

    @Before("execution(* com.bootdo..*.*Dao.get*(..)) || execution(* com.bootdo..*.*Dao.list*(..)) || execution(* com.bootdo..*.*Dao.count*(..))")
    public void setReadDataSourceType() {
        DataSourceContextHolder.read();
        logger.info("dataSource切换到：Read");
    }

    @Before("execution(* com.bootdo..*.*Dao.save*(..)) || execution(* com.bootdo..*.*Dao.update*(..)) || execution(* com.bootdo..*.*Dao.remove*(..)) || execution(* com.bootdo..*.*Dao.batchRemove*(..))")
    public void setWriteDataSourceType() {
        DataSourceContextHolder.write();
        logger.info("dataSource切换到：write");
    }
}