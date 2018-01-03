package com.bootdo.activiti.service.impl;

import com.bootdo.activiti.config.ActivitiConstant;
import com.bootdo.common.utils.StringUtils;
import org.activiti.engine.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.bootdo.activiti.dao.SalaryDao;
import com.bootdo.activiti.domain.SalaryDO;
import com.bootdo.activiti.service.SalaryService;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SalaryServiceImpl implements SalaryService {
	@Autowired
	private SalaryDao salaryDao;
	@Autowired
	private ActTaskServiceImpl actTaskService;
	
	@Override
	public SalaryDO get(String id){
		return salaryDao.get(id);
	}
	
	@Override
	public List<SalaryDO> list(Map<String, Object> map){
		return salaryDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return salaryDao.count(map);
	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public int save(SalaryDO salary){
			salary.setId(UUID.randomUUID().toString().replace("-",""));
			actTaskService.startProcess(ActivitiConstant.ACTIVITI_SALARY[0],ActivitiConstant.ACTIVITI_SALARY[1],salary.getId(),salary.getContent(),new HashMap<>());
			return salaryDao.save(salary);
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int update(SalaryDO salary){
		Map<String,Object> vars = new HashMap<>(16);
		vars.put("pass",  salary.getTaskPass() );
		vars.put("title","");
		actTaskService.complete(salary.getTaskId(),vars);
		return salaryDao.update(salary);
	}
	
	@Override
	public int remove(String id){
		return salaryDao.remove(id);
	}
	
	@Override
	public int batchRemove(String[] ids){
		return salaryDao.batchRemove(ids);
	}
	
}
