package com.bootdo.activiti.service.impl;

import com.bootdo.system.dao.UserDao;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.RepositoryServiceImpl;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.bootdo.activiti.dao.CustomActivitiesDao;
import com.bootdo.activiti.domain.CustomActivitiesDO;
import com.bootdo.activiti.service.CustomActivitiesService;


@Service
public class CustomActivitiesServiceImpl implements CustomActivitiesService {
    @Autowired
    private CustomActivitiesDao customActivitiesDao;

    @Autowired
    RepositoryService repositoryService;


    @Autowired
    TaskService taskService;

    @Autowired
    UserDao userDao;

    @Override
    public CustomActivitiesDO get(Integer id) {
        CustomActivitiesDO customActivitiesDO = customActivitiesDao.get(id);
        return setName(customActivitiesDO);
    }

    @Override
    public List<CustomActivitiesDO> list(Map<String, Object> map) {
        return customActivitiesDao.list(map).stream().peek(this::setName).collect(Collectors.toList());
    }

    CustomActivitiesDO setName(CustomActivitiesDO customActivitiesDO) {
        customActivitiesDO.setAssigneeName(userDao.getNameByUserId(customActivitiesDO.getAssignee()));
        if(customActivitiesDO.getCandidateUser()!=null){
            String[] users = customActivitiesDO.getCandidateUser().split(",");
            if (users.length > 0) {
                StringBuilder userNames = new StringBuilder();
                for (String user : users) {
                    userNames.append(userDao.getNameByUserId(user)).append(",");
                }
                customActivitiesDO.setCandidateUserName(userNames.toString());
            }
        }
        return customActivitiesDO;
    }

    @Override
    public int count(Map<String, Object> map) {
        return customActivitiesDao.count(map);
    }

    @Override
    public int save(CustomActivitiesDO customActivities) {
        return customActivitiesDao.save(customActivities);
    }

    @Override
    public int update(CustomActivitiesDO customActivities) {
        return customActivitiesDao.update(customActivities);
    }

    @Override
    public int remove(Integer id) {
        return customActivitiesDao.remove(id);
    }

    @Override
    public int batchRemove(Integer[] ids) {
        return customActivitiesDao.batchRemove(ids);
    }

    @Override
    public int synchroActivity(String processKey, int processVersion) {

        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
                .processDefinitionKey(processKey).processDefinitionVersion(processVersion).singleResult();
        ProcessDefinitionEntity processDefinitionEntity = (ProcessDefinitionEntity) ((RepositoryServiceImpl) repositoryService)
                .getDeployedProcessDefinition(processDefinition.getId());
        List<ActivityImpl> list = processDefinitionEntity.getActivities();
        list.forEach(
                e -> {
                    //查询本次版本是否有数据
                    Map query = new HashMap();
                    query.put("processDefinitionKey", processKey);
                    query.put("processVersion", processVersion);
                    query.put("activityId", e.getId());
                    List listThis = customActivitiesDao.list(query);
                    if (listThis.size() > 0) {
                        return;
                    }
                    //获取之前最后一个版本的数据
                    List<CustomActivitiesDO> customActivitiesDOs = customActivitiesDao.list(new HashMap() {{
                        put("processDefinitionKey", processKey);
                        put("activityId", e.getId());
                    }});
                    //保存activity
                    CustomActivitiesDO customActivitiesDO = new CustomActivitiesDO();
                    customActivitiesDO.setActivityId(e.getId());
                    customActivitiesDO.setProcessDefinitionId(processDefinitionEntity.getId());
                    customActivitiesDO.setProcessDefinitionKey(processKey);
                    customActivitiesDO.setProcessVersion(processVersion);
                    Map map = e.getProperties();
                    if (map != null && map.get("name") != null) {
                        customActivitiesDO.setActivityName(map.get("name").toString());
                    }
                    if (map != null && map.get("type") != null) {
                        customActivitiesDO.setActivityType(map.get("type").toString());
                    }
                    //复制上一个版本数据
                    customActivitiesDOs.stream()
                            .max(Comparator.comparing(CustomActivitiesDO::getProcessVersion))
                            .ifPresent(customActivitiesDO1 -> {
                                        customActivitiesDO.setAssignee(customActivitiesDO1.getAssignee());
                                        customActivitiesDO.setCandidateGroup(customActivitiesDO1.getCandidateGroup());
                                        customActivitiesDO.setCandidateUser(customActivitiesDO1.getCandidateUser());
                                    }
                            );
                    customActivitiesDao.save(customActivitiesDO);
                }

        );
        return 1;
    }

    @Override
    public int removeByProcessId(String processId) {
        return customActivitiesDao.removeByProcessId(processId);
    }
}
