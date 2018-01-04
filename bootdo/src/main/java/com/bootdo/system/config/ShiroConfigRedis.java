//package com.bootdo.system.config;
//
//import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
//import com.bootdo.system.shiro.UserRealm;
//import org.apache.shiro.mgt.SecurityManager;
//import org.apache.shiro.session.SessionListener;
//import org.apache.shiro.session.mgt.eis.SessionDAO;
//import org.apache.shiro.spring.LifecycleBeanPostProcessor;
//import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
//import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
//import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
//import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
//import org.crazycake.shiro.RedisCacheManager;
//import org.crazycake.shiro.RedisManager;
//import org.crazycake.shiro.RedisSessionDAO;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//import java.util.ArrayList;
//import java.util.Collection;
//import java.util.LinkedHashMap;
//
///**
// * @author bootdo 1992lcg@163.com
// */
//@Configuration
//public class ShiroConfigRedis{
//    @Value("${spring.redis.host}")
//    private String host;
//    @Value("${spring.redis.password}")
//    private String password;
//    @Value("${spring.redis.port}")
//    private int port;
//    @Value("${spring.redis.timeout}")
//    private int timeout;
//
//    @Bean
//    public static LifecycleBeanPostProcessor getLifecycleBeanPostProcessor() {
//        return new LifecycleBeanPostProcessor();
//    }
//
//    /**
//     * ShiroDialect，为了在thymeleaf里使用shiro的标签的bean
//     * @return
//     */
//    @Bean
//    public ShiroDialect shiroDialect() {
//        return new ShiroDialect();
//    }
//
//	@Bean
//    ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager) {
//		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
//		shiroFilterFactoryBean.setSecurityManager(securityManager);
//		shiroFilterFactoryBean.setLoginUrl("/login");
//		shiroFilterFactoryBean.setSuccessUrl("/index");
//		shiroFilterFactoryBean.setUnauthorizedUrl("/403");
//		LinkedHashMap<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
//		filterChainDefinitionMap.put("/css/**", "anon");
//		filterChainDefinitionMap.put("/js/**", "anon");
//		filterChainDefinitionMap.put("/fonts/**", "anon");
//		filterChainDefinitionMap.put("/img/**", "anon");
//		filterChainDefinitionMap.put("/docs/**", "anon");
//		filterChainDefinitionMap.put("/druid/**", "anon");
//		filterChainDefinitionMap.put("/upload/**", "anon");
//		filterChainDefinitionMap.put("/files/**", "anon");
//		filterChainDefinitionMap.put("/logout", "logout");
//		filterChainDefinitionMap.put("/", "anon");
//		filterChainDefinitionMap.put("/blog", "anon");
//		filterChainDefinitionMap.put("/blog/open/**", "anon");
//		filterChainDefinitionMap.put("/**", "authc");
//		shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
//		return shiroFilterFactoryBean;
//	}
//
//
//    @Bean
//    public SecurityManager securityManager(){
//        DefaultWebSecurityManager securityManager =  new DefaultWebSecurityManager();
//        //设置realm.
//        securityManager.setRealm(userRealm());
//        // 自定义缓存实现 使用redis
//        securityManager.setCacheManager(cacheManager());
//        // 自定义session管理 使用redis
//        securityManager.setSessionManager(sessionManager());
//        return securityManager;
//    }
//
//	@Bean
//    UserRealm userRealm() {
//		UserRealm userRealm = new UserRealm();
//		return userRealm;
//	}
//    /**
//     * 凭证匹配器
//     * （由于我们的密码校验交给Shiro的SimpleAuthenticationInfo进行处理了
//     *  所以我们需要修改下doGetAuthenticationInfo中的代码;
//     * ）
//     * @return
//     */
////    @Bean
////    public HashedCredentialsMatcher hashedCredentialsMatcher(){
////        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
////
////        hashedCredentialsMatcher.setHashAlgorithmName("md5");//散列算法:这里使用MD5算法;
////        hashedCredentialsMatcher.setHashIterations(2);//散列的次数，比如散列两次，相当于 md5(md5(""));
////
////        return hashedCredentialsMatcher;
////    }
//
//
//    /**
//     *  开启shiro aop注解支持.
//     *  使用代理方式;所以需要开启代码支持;
//     * @param securityManager
//     * @return
//     */
//    @Bean
//    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager){
//        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
//        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
//        return authorizationAttributeSourceAdvisor;
//    }
//
//    /**
//     * 配置shiro redisManager
//     * 使用的是shiro-redis开源插件
//     * @return
//     */
//    @Bean
//    public RedisManager redisManager() {
//        RedisManager redisManager = new RedisManager();
//        redisManager.setHost(host);
//        redisManager.setPort(port);
//        redisManager.setExpire(1800);// 配置缓存过期时间
//        //redisManager.setTimeout(1800);
//        redisManager.setPassword(password);
//        return redisManager;
//    }
//
//    /**
//     * cacheManager 缓存 redis实现
//     * 使用的是shiro-redis开源插件
//     * @return
//     */
//    public RedisCacheManager cacheManager() {
//        RedisCacheManager redisCacheManager = new RedisCacheManager();
//        redisCacheManager.setRedisManager(redisManager());
//        return redisCacheManager;
//    }
//
//
//    /**
//     * RedisSessionDAO shiro sessionDao层的实现 通过redis
//     * 使用的是shiro-redis开源插件
//     */
//    @Bean
//    public RedisSessionDAO redisSessionDAO() {
//        RedisSessionDAO redisSessionDAO = new RedisSessionDAO();
//        redisSessionDAO.setRedisManager(redisManager());
//        return redisSessionDAO;
//    }
//
//    @Bean
//    public SessionDAO sessionDAO(){
//        return redisSessionDAO();
//    }
//
//    /**
//     * shiro session的管理
//     */
//    @Bean
//    public DefaultWebSessionManager sessionManager() {
//        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
//        sessionManager.setSessionDAO(redisSessionDAO());
//        Collection<SessionListener> listeners = new ArrayList<SessionListener>();
//        listeners.add(new BDSessionListener());
//        sessionManager.setSessionListeners(listeners);
//        return sessionManager;
//    }
//
//}
