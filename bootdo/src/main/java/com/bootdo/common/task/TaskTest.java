package com.bootdo.common.task;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

@Component
public class TaskTest {
	public final Logger log = Logger.getLogger(this.getClass());
	public void run() {
		for (int i = 0; i < 10; i++) {
			log.info(i+"-------计划任务测试---------" + (new Date()));
		}
	}
	public void run1() {
		for (int i = 0; i < 10; i++) {
			log.info(i+" run1......................................" + (new Date()));
		}
	}
}