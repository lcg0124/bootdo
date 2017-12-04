package com.bootdo.activiti.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by liuruijie on 2017/2/21.
 * 一些工具bean
 */
@Configuration
public class Cfg_Util {


    //jackson xml util
    @Bean
    public ObjectMapper objectMapper(){
        return new ObjectMapper();
    }
}
