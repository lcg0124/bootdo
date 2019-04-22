package com.bootdo.oa.service.impl;

import com.bootdo.activiti.config.ActivitiConstant;
import com.bootdo.activiti.domain.ActivitiDO;
import com.bootdo.activiti.domain.CustomActivitiesDO;
import com.bootdo.activiti.service.ActTaskService;
import com.bootdo.activiti.service.CustomActivitiesService;
import com.bootdo.activiti.utils.ActivitiUtils;
import com.bootdo.common.config.Constant;
import com.bootdo.common.utils.ShiroUtils;
import com.bootdo.common.utils.UUIDUtils;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.bootdo.oa.dao.LeaveDao;
import com.bootdo.oa.domain.LeaveDO;
import com.bootdo.oa.service.LeaveService;
import org.springframework.transaction.annotation.Transactional;


@Service
public class LeaveServiceImpl implements LeaveService {
    @Autowired
    private LeaveDao leaveDao;

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private IdentityService identityService;

    @Autowired
    HistoryService historyService;

    @Autowired
    TaskService taskService;

    @Autowired
    CustomActivitiesService customActivitiesService;

    @Autowired
    ActTaskService actTaskService;

    @Autowired
    ActivitiUtils activitiUtils;

    @Override
    public LeaveDO get(String id) {
        return leaveDao.get(id);
    }

    @Override
    public List<LeaveDO> list(Map<String, Object> map) {
        List<HistoricProcessInstance> historicProcessInstanceList =
                historyService.createHistoricProcessInstanceQuery()
                        .processDefinitionKey(ActivitiConstant.ACTIVITI_PROCESS_LEAVE)
                        .startedBy(ShiroUtils.getUserId().toString())
                        .unfinished()
                        .list();
        return historicProcessInstanceList
                .stream().map(e -> {
                            LeaveDO leaveDO = leaveDao.get(e.getBusinessKey());
                            leaveDO.setProcessInstanceId(e.getId());
                            return leaveDO;
                        }
                ).collect(Collectors.toList());
    }

    @Override
    public List<LeaveDO> list2(Map<String, Object> map) {
        List<HistoricProcessInstance> historicProcessInstanceList =
                historyService.createHistoricProcessInstanceQuery()
                        .processDefinitionKey(ActivitiConstant.ACTIVITI_PROCESS_LEAVE)
                        .startedBy(ShiroUtils.getUserId().toString())
                        .finished()
                        .list();
        return historicProcessInstanceList
                .stream().map(e -> {
                            LeaveDO leaveDO = leaveDao.get(e.getBusinessKey());
                            return leaveDO;
                        }
                ).collect(Collectors.toList());
    }

    @Override
    public int count(Map<String, Object> map) {
        return leaveDao.count(map);
    }

    @Override
    @Transactional()
    public int save(LeaveDO leave) {
        leave.setId(UUIDUtils.randomUUID());
        int r = leaveDao.save(leave);
        //处理流程
        //这里仅为演示做简单计算，真是场景需要根据考勤规则计算
        long day = (leave.getEndTime().getTime() - leave.getStartTime().getTime()) / (1000 * 60 * 60 * 24);
        // 用来设置启动流程的人员ID，引擎会自动把用户ID保存到activiti:initiator中
        identityService.setAuthenticatedUserId(ShiroUtils.getUserId().toString());
        Map vars = new HashMap();
        vars.put("day", day);
        String title = ShiroUtils.getUser().getName() + "发起请假申请";
        vars.put("title", title);
        ProcessInstance processInstance = actTaskService.startProcess(ActivitiConstant.ACTIVITI_PROCESS_LEAVE, leave.getId(), title,
                vars);
        //根据流程实例
        return r;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public int update(LeaveDO leave, String taskId) {

        String taskKey = taskService.createTaskQuery().taskId(taskId).singleResult().getTaskDefinitionKey();
        LeaveDO leaveDO = new LeaveDO();
        switch (taskKey) {
            case ActivitiConstant.ACTIVITI_PROCESS_LEAVE_DIRECT:
                leaveDO.setDirectOpinion(leave.getUserOpinion());
            case ActivitiConstant.ACTIVITI_PROCESS_LEAVE_LEADER:
                leaveDO.setLeaderOpinion(leave.getUserOpinion());
            case ActivitiConstant.ACTIVITI_PROCESS_LEAVE_HR:
                leaveDO.setHrOpinion(leave.getUserOpinion());
            default:
        }
        int r = leaveDao.update(leaveDO);
        actTaskService.complete(taskId, new HashMap<String, Object>() {{
            put("pass", true);
        }});
        return r;
    }

    @Override
    public int remove(String id) {
        return leaveDao.remove(id);
    }

    @Override
    public int batchRemove(String[] ids) {
        return leaveDao.batchRemove(ids);
    }

    @Override
    public List listCurrentStart() {
        runtimeService.createProcessInstanceQuery().processDefinitionKey("");

        return null;
    }

}
