package com.bootdo.common.utils;

import javax.servlet.http.HttpServletRequest;

public class HttpServletUtils {
    public static boolean jsAjax(HttpServletRequest req){
        //判断是否为ajax请求，默认不是
        boolean isAjaxRequest = false;
        if (!StringUtils.isBlank(req.getHeader("x-requested-with")) && "XMLHttpRequest".equals(req.getHeader("x-requested-with"))) {
            isAjaxRequest = true;
        }
        return isAjaxRequest;
    }
}
