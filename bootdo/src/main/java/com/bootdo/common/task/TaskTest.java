package com.bootdo.common.task;

import java.util.Date;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import com.bootdo.common.utils.SpringContextHolder;
import com.bootdo.oa.domain.Response;

@Component
public class TaskTest implements Job{
	@Autowired
	SimpMessagingTemplate template;
	public final Logger log = Logger.getLogger(this.getClass());

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		template.convertAndSend("/topic/getResponse", new Response("Welcome,websocket!"));
		
	}
}