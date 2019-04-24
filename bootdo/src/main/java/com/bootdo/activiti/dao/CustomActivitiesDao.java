package com.bootdo.activiti.dao;

import com.bootdo.activiti.domain.CustomActivitiesDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2019-04-16 11:59:25
 */
@Mapper
public interface CustomActivitiesDao {

	CustomActivitiesDO get(Integer id);
	
	List<CustomActivitiesDO> list(Map<String,Object> map);

	CustomActivitiesDO getOne(Map<String, Object> map);
	
	int count(Map<String,Object> map);
	
	int save(CustomActivitiesDO customActivities);
	
	int update(CustomActivitiesDO customActivities);
	
	int remove(Integer Id);
	
	int batchRemove(Integer[] ids);

	int removeByProcessId(String processId);
}
