package com.bootdo.oa.service.impl;

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
        List<Task> tasks = taskService.createTaskQuery().taskAssignee(ShiroUtils.getUser().getUsername()).list();
        List tasksByGroup = taskService.createTaskQuery().taskCandidateGroupIn(ShiroUtils.getUser().getRoleSigns()).list();
        tasks.addAll(tasksByGroup);
        List<TaskVO> taskVOS = new ArrayList<>();
        for (Task task : tasks) {
            TaskVO taskVO = new TaskVO(task);
            HistoricProcessInstance processInstance =
                    historyService.createHistoricProcessInstanceQuery()
                            .processInstanceId(task.getProcessInstanceId()).singleResult();
            taskVO.setProcessName(processInstance.getName());
            String userName = userDao.get(Long.valueOf(processInstance.getStartUserId())).getName();
            taskVO.setProcessStartUserName(userName);
            taskVOS.add(taskVO);
        }
        return taskVOS;
    }
}
