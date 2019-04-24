package com.bootdo.common.utils;

import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;

import java.io.StringWriter;
import java.util.Map;

/**
 * @author lichunguang
 */
public class VelocityUtils {
    public static String RenderData(String source, Map parameter) {
        // 初始化并取得Velocity引擎
        VelocityEngine ve = new VelocityEngine();
        ve.init();
        VelocityContext context = new VelocityContext(parameter);
        // 输出流
        StringWriter writer = new StringWriter();
        ve.evaluate(context, writer, "", source);
        return writer.toString();
    }
}
