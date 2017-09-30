package com.bootdo.common.quartz.factory;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.bootdo.common.domain.ScheduleJob;
import com.bootdo.common.quartz.utils.TaskUtils;



/**
 * 
 * All rights Reserved, Designed By www.jeeweb.cn
 * @title:  QuartzJobFactory.java   
 * @package cn.jeeweb.core.quartz.factory   
 * @description:   计划任务执行处 无状态
 * @author: 王存见   
 * @date:   2017年5月10日 上午12:24:41   
 * @version V1.0 
 * @copyright: 2017 www.jeeweb.cn Inc. All rights reserved. 
 *
 */
public class QuartzJobFactory implements Job {
	public final Logger log = Logger.getLogger(this.getClass());

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		ScheduleJob scheduleJob = (ScheduleJob) context.getMergedJobDataMap().get("scheduleJob");
		TaskUtils.invokMethod(scheduleJob);
	}
}