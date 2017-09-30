package com.bootdo.common.service;

import com.bootdo.common.domain.TaskScheduleJobDO;

import java.util.List;
import java.util.Map;

import org.quartz.SchedulerException;

/**
 * 
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-09-26 20:53:48
 */
public interface TaskScheduleJobService {
	
	TaskScheduleJobDO get(Long id);
	
	List<TaskScheduleJobDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(TaskScheduleJobDO taskScheduleJob);
	
	int update(TaskScheduleJobDO taskScheduleJob);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);

	void initSchedule() throws SchedulerException;

	void changeStatus(Long jobId, String cmd) throws SchedulerException;

	void updateCron(Long jobId) throws SchedulerException;
}
