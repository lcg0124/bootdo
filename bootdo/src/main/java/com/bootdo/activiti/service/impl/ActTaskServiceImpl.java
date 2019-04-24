package com.bootdo.activiti.service.impl;

import com.bootdo.activiti.config.ActivitiConstant;
import com.bootdo.activiti.dao.CustomActivitiesDao;
import com.bootdo.activiti.domain.ActivitiDO;
import com.bootdo.activiti.domain.CustomActivitiesDO;
import com.bootdo.activiti.service.ActTaskService;
import com.bootdo.activiti.service.CustomActivitiesService;
import com.bootdo.activiti.service.ProcessService;
import com.bootdo.activiti.vo.HisTaskDTO;
import com.bootdo.common.utils.ShiroUtils;
import com.bootdo.common.utils.StringUtils;
import com.bootdo.common.utils.VelocityUtils;
import com.bootdo.system.dao.UserDao;
import com.bootdo.system.domain.UserDO;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.impl.RepositoryServiceImpl;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.image.ProcessDiagramGenerator;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.*;

/**
 *
 */
@Service
public class ActTaskServiceImpl implements ActTaskService {
    @Autowired
    TaskService taskService;
    @Autowired
    IdentityService identityService;
    @Autowired
    RuntimeService runtimeService;
    @Autowired
    FormService formService;

    @Autowired
    RepositoryService repositoryService;

    @Autowired
    private ProcessEngineFactoryBean processEngineFactory;

    @Autowired
    private ProcessEngine processEngine;

    @Autowired
    private HistoryService historyService;

    @Autowired
    CustomActivitiesService customActivitiesService;

    @Autowired
    private SimpMessagingTemplate template;

    @Autowired
    UserDao userDao;

    @Autowired
    ProcessService processService;

    @Autowired
    CustomActivitiesDao customActivitiesDao;

    @Override
    public List<ActivitiDO> listTodo(ActivitiDO act) {
        String userId = String.valueOf(ShiroUtils.getUserId());
        List<ActivitiDO> result = new ArrayList<ActivitiDO>();
        return result;
    }

    @Override
    public void beforeComplete(String taskKey) {

    }


    @Override
    public void complete(String taskId, Map<String, Object> vars) {
        Task task = taskService.createTaskQuery()
                .taskId(taskId).singleResult();
        String processDefinitionId = task.getProcessDefinitionId();
        List<Task> lbefores = taskService.createTaskQuery().processDefinitionId(processDefinitionId).list();
        taskService.complete(taskId, vars);
        //处理任务完成后的自定义行为
        afterComplete(task.getTaskDefinitionKey());
        this.setAssigneeByTaskId(processDefinitionId);
        List<Task> lafters = taskService.createTaskQuery().processDefinitionId(processDefinitionId).list();
        //处理任务开始的自定义行为，如待办提醒等
        lafters.stream().filter(lafter ->
                lbefores.stream().noneMatch(lbefore ->
                        lbefore.getId().equals(lafter.getId())
                )
        ).forEach(task1 -> {
            String message = Optional.ofNullable(customActivitiesDao.getOne(new HashMap() {{
                put("processDefinitionId", processDefinitionId);
                put("activityId", task1.getTaskDefinitionKey());
            }})).map(u -> u.getTodoMessage()).orElse("");
            message = VelocityUtils.RenderData(message, new HashMap() {{
                put("taskName", task1.getName());
            }});
            template.convertAndSendToUser(userDao.get(Long.valueOf(task1.getAssignee())).toString(), "/queue/notifications", message);
        });
    }

    @Override
    public void afterComplete(String taskKey) {

    }

    /**
     * 启动流程
     *
     * @param procDefKey 流程定义KEY
     * @param businessId 业务表编号
     * @param title      流程标题，显示在待办任务标题
     * @param vars       流程变量
     * @return 流程实例ID
     */
    @Override
    public ProcessInstance startProcess(String procDefKey, String businessId, String title, Map<String, Object> vars) {
        String userId = ShiroUtils.getUserId().toString();//ObjectUtils.toString(UserUtils.getUser().getId())
        // 用来设置启动流程的人员ID，引擎会自动把用户ID保存到activiti:initiator中
        identityService.setAuthenticatedUserId(userId);
        // 设置流程变量
        if (vars == null) {
            vars = new HashMap();
        }
        // 设置流程标题
        if (StringUtils.isNotBlank(title)) {
            vars.put("title", title);
        }
        List<Task> lbefores = taskService.createTaskQuery().processDefinitionKey(procDefKey).list();
        // 启动流程
        ProcessInstance procIns = runtimeService.startProcessInstanceByKey(procDefKey, businessId, vars);
        this.setAssignee(ActivitiConstant.ACTIVITI_PROCESS_LEAVE);
        List<Task> lafters = taskService.createTaskQuery().processDefinitionKey(procDefKey).list();
        lafters.stream().filter(lafter ->
                lbefores.stream().noneMatch(lbefore ->
                        lbefore.getId().equals(lafter.getId())
                )
        ).forEach(task1 -> {
            //发待办通知等
            template.convertAndSendToUser(userDao.get(Long.valueOf(task1.getAssignee())).toString(), "/queue/notifications", "新待办：" + task1.getName());
        });
        return procIns;
    }

    /**
     * 获取流程表单（首先获取任务节点表单KEY，如果没有则取流程开始节点表单KEY）
     *
     * @return
     */
    @Override
    public String getFormKey(String procDefId, String taskDefKey) {
        String formKey = "";
        if (StringUtils.isNotBlank(procDefId)) {
            if (StringUtils.isNotBlank(taskDefKey)) {
                try {
                    formKey = formService.getTaskFormKey(procDefId, taskDefKey);
                } catch (Exception e) {
                    formKey = "";
                }
            }
            if (StringUtils.isBlank(formKey)) {
                formKey = formService.getStartFormKey(procDefId);
            }
            if (StringUtils.isBlank(formKey)) {
                formKey = "/404";
            }
        }
        return formKey;
    }

    @Override
    public InputStream tracePhoto(String xx, String pProcessInstanceId) {
////		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(executionId).singleResult();
//        BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinitionId);
//
//        List<String> activeActivityIds = new ArrayList();
//        if (runtimeService.createExecutionQuery().executionId(executionId).count() > 0){
//            activeActivityIds = runtimeService.getActiveActivityIds(executionId);
//        }
//
//        // 不使用spring请使用下面的两行代码
//        // ProcessEngineImpl defaultProcessEngine = (ProcessEngineImpl)ProcessEngines.getDefaultProcessEngine();
//        // Context.setProcessEngineConfiguration(defaultProcessEngine.getProcessEngineConfiguration());
//
//        // 使用spring注入引擎请使用下面的这行代码
//        Context.setProcessEngineConfiguration(processEngineFactory.getProcessEngineConfiguration());
////		return ProcessDiagramGenerator.generateDiagram(bpmnModel, "png", activeActivityIds);
//        return processEngine.getProcessEngineConfiguration().getProcessDiagramGenerator()
//                .generateDiagram(bpmnModel, "png", activeActivityIds);

        //  获取历史流程实例
        HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery()
                .processInstanceId(pProcessInstanceId).singleResult();

        if (historicProcessInstance != null) {
            // 获取流程定义
            ProcessDefinitionEntity processDefinition = (ProcessDefinitionEntity) ((RepositoryServiceImpl) repositoryService)
                    .getDeployedProcessDefinition(historicProcessInstance.getProcessDefinitionId());

            // 获取流程历史中已执行节点，并按照节点在流程中执行先后顺序排序
            List<HistoricActivityInstance> historicActivityInstanceList = historyService.createHistoricActivityInstanceQuery()
                    .processInstanceId(pProcessInstanceId).orderByHistoricActivityInstanceId().asc().list();

            // 已执行的节点ID集合
            List<String> executedActivityIdList = new ArrayList<String>();
            int index = 1;
            //获取已经执行的节点ID
            for (HistoricActivityInstance activityInstance : historicActivityInstanceList) {
                executedActivityIdList.add(activityInstance.getActivityId());
                index++;
            }

            // 已执行的线集合
            List<String> flowIds = new ArrayList<String>();
            // 获取流程走过的线
            flowIds = getHighLightedFlows(processDefinition, historicActivityInstanceList);


            BpmnModel bpmnModel = repositoryService
                    .getBpmnModel(historicProcessInstance.getProcessDefinitionId());
            // 获取流程图图像字符流
            ProcessDiagramGenerator pec = processEngine.getProcessEngineConfiguration().getProcessDiagramGenerator();
            //配置字体

            InputStream imageStream = pec.generateDiagram(bpmnModel, "png", executedActivityIdList, flowIds, "宋体", "微软雅黑", "黑体", null, 2.0);
            return imageStream;
        }
        return null;
    }

    @Override
    public void setAssignee(String processKey) {
        List<Task> list = taskService.createTaskQuery().processDefinitionKey(processKey).list();
        list.forEach(e -> {
            List<CustomActivitiesDO> activities = customActivitiesService.list(new HashMap() {{
                put("processDefinitionKey", processKey);
                put("activityId", e.getTaskDefinitionKey());
            }});
            if (activities.size() > 0) {
                CustomActivitiesDO customActivitiesDO = activities.get(0);
                taskService.setAssignee(e.getId(), customActivitiesDO.getAssignee());
            }
        });
    }

    @Override
    public void setAssigneeByTaskId(String processDefId) {
        List<Task> list = taskService.createTaskQuery().processDefinitionId(processDefId).list();
        list.forEach(e -> {
            List<CustomActivitiesDO> activities = customActivitiesService.list(new HashMap() {{
                put("processDefinitionId", processDefId);
                put("activityId", e.getTaskDefinitionKey());
            }});
            if (activities.size() > 0) {
                CustomActivitiesDO customActivitiesDO = activities.get(0);
                taskService.setAssignee(e.getId(), customActivitiesDO.getAssignee());
            }
        });
    }

    @Override
    public List listHisTaskByTaskId(String taskId) {

        String processInstanceId =
                taskService.createTaskQuery().taskId(taskId).singleResult().getProcessInstanceId();
        return processService.listHisTaskByInstanceId(processInstanceId);
    }


    /**
     * 获取需要高亮的线
     *
     * @param processDefinitionEntity
     * @param historicActivityInstances
     * @return
     */
    private List<String> getHighLightedFlows(
            ProcessDefinitionEntity processDefinitionEntity,
            List<HistoricActivityInstance> historicActivityInstances) {
        List<String> highFlows = new ArrayList<String>();// 用以保存高亮的线flowId
        for (int i = 0; i < historicActivityInstances.size() - 1; i++) {// 对历史流程节点进行遍历
            ActivityImpl activityImpl = processDefinitionEntity
                    .findActivity(historicActivityInstances.get(i)
                            .getActivityId());// 得到节点定义的详细信息
            List<ActivityImpl> sameStartTimeNodes = new ArrayList<ActivityImpl>();// 用以保存后需开始时间相同的节点
            ActivityImpl sameActivityImpl1 = processDefinitionEntity
                    .findActivity(historicActivityInstances.get(i + 1)
                            .getActivityId());
            // 将后面第一个节点放在时间相同节点的集合里
            sameStartTimeNodes.add(sameActivityImpl1);
            for (int j = i + 1; j < historicActivityInstances.size() - 1; j++) {
                HistoricActivityInstance activityImpl1 = historicActivityInstances
                        .get(j);// 后续第一个节点
                HistoricActivityInstance activityImpl2 = historicActivityInstances
                        .get(j + 1);// 后续第二个节点
                if (activityImpl1.getStartTime().equals(
                        activityImpl2.getStartTime())) {
                    // 如果第一个节点和第二个节点开始时间相同保存
                    ActivityImpl sameActivityImpl2 = processDefinitionEntity
                            .findActivity(activityImpl2.getActivityId());
                    sameStartTimeNodes.add(sameActivityImpl2);
                } else {
                    // 有不相同跳出循环
                    break;
                }
            }
            List<PvmTransition> pvmTransitions = activityImpl
                    .getOutgoingTransitions();// 取出节点的所有出去的线
            for (PvmTransition pvmTransition : pvmTransitions) {
                // 对所有的线进行遍历
                ActivityImpl pvmActivityImpl = (ActivityImpl) pvmTransition
                        .getDestination();
                // 如果取出的线的目标节点存在时间相同的节点里，保存该线的id，进行高亮显示
                if (sameStartTimeNodes.contains(pvmActivityImpl)) {
                    highFlows.add(pvmTransition.getId());
                }
            }
        }
        return highFlows;
    }

}

