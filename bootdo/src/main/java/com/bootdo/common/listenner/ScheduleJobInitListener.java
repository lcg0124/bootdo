package com.bootdo.common.listenner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.bootdo.common.service.TaskScheduleJobService;

@Component
@Order(value = 1)
public class ScheduleJobInitListener implements CommandLineRunner {

	@Autowired
	TaskScheduleJobService scheduleJobService;

	@Override
	public void run(String... arg0) throws Exception {
		System.out.println("-----启动定时任务------");
		try {
			scheduleJobService.initSchedule();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}