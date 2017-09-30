package com.bootdo.common.service.impl;

import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bootdo.common.dao.TaskScheduleJobMapper;
import com.bootdo.common.domain.ScheduleJob;
import com.bootdo.common.domain.TaskScheduleJobDO;
import com.bootdo.common.quartz.utils.QuartzManager;
import com.bootdo.common.service.TaskScheduleJobService;
import com.bootdo.common.utils.ScheduleJobUtils;

@Service
public class TaskScheduleJobServiceImpl implements TaskScheduleJobService {
	
	@Autowired
	private TaskScheduleJobMapper taskScheduleJobMapper;
//	@Autowired
//	QuartzManager quartzManager;

	@Override
	public TaskScheduleJobDO get(Long id) {
		return taskScheduleJobMapper.get(id);
	}

	@Override
	public List<TaskScheduleJobDO> list(Map<String, Object> map) {
		return taskScheduleJobMapper.list(map);
	}

	@Override
	public int count(Map<String, Object> map) {
		return taskScheduleJobMapper.count(map);
	}

	@Override
	public int save(TaskScheduleJobDO taskScheduleJob) {
		return taskScheduleJobMapper.save(taskScheduleJob);
	}

	@Override
	public int update(TaskScheduleJobDO taskScheduleJob) {
		return taskScheduleJobMapper.update(taskScheduleJob);
	}

	@Override
	public int remove(Long id) {
		QuartzManager quartzManager = new QuartzManager();
		try {
			TaskScheduleJobDO scheduleJob = get(id);
			quartzManager.deleteJob(ScheduleJobUtils.entityToData(scheduleJob));
			return taskScheduleJobMapper.remove(id);
		} catch (SchedulerException e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public int batchRemove(Long[] ids) {
		QuartzManager quartzManager = new QuartzManager();
		for (Long id : ids) {
			try {
				TaskScheduleJobDO scheduleJob = get(id);
				quartzManager.deleteJob(ScheduleJobUtils.entityToData(scheduleJob));
			} catch (SchedulerException e) {
				e.printStackTrace();
				return 0;
			}
		}
		return taskScheduleJobMapper.batchRemove(ids);
	}

	@Override
	public void initSchedule() throws SchedulerException {
		// 这里获取任务信息数据
		QuartzManager quartzManager = new QuartzManager();
		List<TaskScheduleJobDO> jobList = taskScheduleJobMapper.list(new HashMap());
		for (TaskScheduleJobDO scheduleJob : jobList) {
			quartzManager.addJob(ScheduleJobUtils.entityToData(scheduleJob));
		}
	}
	@Override
	public void changeStatus(Long jobId, String cmd) throws SchedulerException {
		QuartzManager quartzManager = new QuartzManager();
		TaskScheduleJobDO scheduleJob = get(jobId);
		if (scheduleJob == null) {
			return;
		}
		if ("stop".equals(cmd)) {
			quartzManager.deleteJob(ScheduleJobUtils.entityToData(scheduleJob));
			scheduleJob.setJobStatus(ScheduleJob.STATUS_NOT_RUNNING);
		} else if ("start".equals(cmd)) {
			scheduleJob.setJobStatus(ScheduleJob.STATUS_RUNNING);
			quartzManager.addJob(ScheduleJobUtils.entityToData(scheduleJob));
		}
		 update(scheduleJob);
	}
	
	@Override
	public void updateCron(Long jobId) throws SchedulerException {
		QuartzManager quartzManager = new QuartzManager();
		TaskScheduleJobDO scheduleJob = get(jobId);
		if (scheduleJob == null) {
			return;
		}
		if (ScheduleJob.STATUS_RUNNING.equals(scheduleJob.getJobStatus())) {
			quartzManager.updateJobCron(ScheduleJobUtils.entityToData(scheduleJob));
		}
		 update(scheduleJob);
	}

}
