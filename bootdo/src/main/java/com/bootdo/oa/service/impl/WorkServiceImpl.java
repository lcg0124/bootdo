package com.bootdo.oa.service.impl;

import com.bootdo.activiti.config.ActivitiConstant;
import com.bootdo.activiti.vo.TaskVO;
import com.bootdo.common.utils.ShiroUtils;
import com.bootdo.oa.service.WorkService;
import com.bootdo.system.dao.UserDao;
import org.activiti.engine.HistoryService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * @author lichunguang
 */
@Service
public class WorkServiceImpl implements WorkService {
    @Autowired
    TaskService taskService;

    @Autowired
    HistoryService historyService;

    @Autowired
    UserDao userDao;

    @Override
    public List listTodoWork() {
        List<Task> tasks = taskService.createTaskQuery()
                .processDefinitionKey(ActivitiConstant.ACTIVITI_PROCESS_LEAVE)
                .taskAssignee(ShiroUtils.getUserId().toString()).list();
        List tasksByGroup = taskService.createTaskQuery()
                .processDefinitionKey(ActivitiConstant.ACTIVITI_PROCESS_LEAVE)
                .taskCandidateGroupIn(ShiroUtils.getUser().getRoleSigns()).list();
        tasks.addAll(tasksByGroup);
        List<TaskVO> taskVOS = new ArrayList<>();
        for (Task task : tasks) {
            TaskVO taskVO = new TaskVO(task);
            HistoricProcessInstance processInstance =
                    historyService.createHistoricProcessInstanceQuery()
                            .processInstanceId(task.getProcessInstanceId()).singleResult();
            taskVO.setProcessDefinitionKey(processInstance.getProcessDefinitionKey());
            taskVO.setProcessDefinitionName(processInstance.getProcessDefinitionName());
            taskVO.setProcessStartUserName(userDao.getNameByUserId(processInstance.getStartUserId()));
            taskVOS.add(taskVO);
        }
        return taskVOS;
    }
}
