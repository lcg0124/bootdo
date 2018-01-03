package com.bootdo.activiti.service.impl;

import com.bootdo.activiti.domain.ActivitiDO;
import com.bootdo.activiti.service.ActTaskService;
import com.bootdo.common.utils.ShiroUtils;
import com.bootdo.common.utils.StringUtils;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.impl.RepositoryServiceImpl;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.image.ProcessDiagramGenerator;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
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

    @Override
    public List<ActivitiDO> listTodo(ActivitiDO act) {
        String userId = String.valueOf(ShiroUtils.getUserId());
        List<ActivitiDO> result = new ArrayList<ActivitiDO>();
        return result;
    }

    /**
     * 提交任务, 并保存意见
     *
     * @param taskId    任务ID
     * @param procInsId 流程实例ID，如果为空，则不保存任务提交意见
     * @param comment   任务提交意见的内容
     * @param title     流程标题，显示在待办任务标题
     * @param vars      任务变量
     */
    @Override
    public void complete(String taskId, String procInsId, String comment, String title, Map<String, Object> vars) {
        // 添加意见
        if (StringUtils.isNotBlank(procInsId) && StringUtils.isNotBlank(comment)) {
            taskService.addComment(taskId, procInsId, comment);
        }

        // 设置流程变量
        if (vars == null) {
            vars = new HashMap<>();
        }

        // 设置流程标题
        if (StringUtils.isNotBlank(title)) {
            vars.put("title", title);
        }

        // 提交任务
        taskService.complete(taskId, vars);
    }

    @Override
    public void complete(String taskId, Map<String, Object> vars) {
        // 2.1根据人物ID查询流程实力ID
        Task task = taskService.createTaskQuery()
                .taskId(taskId).singleResult();
        // 获取流程实例ID
        String processInstance = task.getProcessInstanceId();
        // 2.2根据流程实例ID，人物ID，评论的消息，保存教师或者学术对与该学生申请的评论信息
//        taskService.addComment(taskId,
//                processInstance, "");
//        Map<String,Object> vars = new HashMap<>();
//        vars.put("pass",  "1" );
//        vars.put("title","");
        taskService.complete(taskId, vars);
    }

    /**
     * 启动流程
     *
     * @param procDefKey    流程定义KEY
     * @param businessTable 业务表表名
     * @param businessId    业务表编号
     * @param title         流程标题，显示在待办任务标题
     * @param vars          流程变量
     * @return 流程实例ID
     */
    @Override
    public String startProcess(String procDefKey, String businessTable, String businessId, String title, Map<String, Object> vars) {
        String userId = ShiroUtils.getUser().getUsername();//ObjectUtils.toString(UserUtils.getUser().getId())

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

        // 启动流程
        ProcessInstance procIns = runtimeService.startProcessInstanceByKey(procDefKey, businessId, vars);

        return null;
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


    /**
     * 获取需要高亮的线
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

