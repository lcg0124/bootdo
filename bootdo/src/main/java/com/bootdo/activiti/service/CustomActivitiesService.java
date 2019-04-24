package com.bootdo.activiti.service;

import com.bootdo.activiti.domain.CustomActivitiesDO;

import java.util.List;
import java.util.Map;

/**
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2019-04-16 11:59:25
 */
public interface CustomActivitiesService {

    CustomActivitiesDO get(Integer id);

    List<CustomActivitiesDO> list(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(CustomActivitiesDO customActivities);

    int update(CustomActivitiesDO customActivities);

    int remove(Integer id);

    int batchRemove(Integer[] ids);

    /**
     * 同步节点信息
     *
     * @param processKey     流程标识
     * @param processVersion 流程版本
     * @return
     */
    int synchroActivity(String processKey, int processVersion);

    int removeByProcessId(String processId);

}
