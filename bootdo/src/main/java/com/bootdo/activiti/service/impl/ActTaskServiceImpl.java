package com.bootdo.activiti.service.impl;

import com.bootdo.activiti.domain.ActivitiDO;
import com.bootdo.activiti.service.ActTaskService;
import com.bootdo.common.utils.ShiroUtils;
import com.bootdo.common.utils.StringUtils;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.*;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
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

    @Override
    public List<ActivitiDO> listTodo(ActivitiDO act) {
        String userId = String.valueOf(ShiroUtils.getUserId());
        List<ActivitiDO> result = new ArrayList<ActivitiDO>();
        return result;
    }

    /**
     * 提交任务, 并保存意见
     * @param taskId 任务ID
     * @param procInsId 流程实例ID，如果为空，则不保存任务提交意见
     * @param comment 任务提交意见的内容
     * @param title			流程标题，显示在待办任务标题
     * @param vars 任务变量
     */
    @Override
    public void complete(String taskId, String procInsId, String comment, String title, Map<String, Object> vars){
        // 添加意见
        if (StringUtils.isNotBlank(procInsId) && StringUtils.isNotBlank(comment)){
            taskService.addComment(taskId, procInsId, comment);
        }

        // 设置流程变量
        if (vars == null){
            vars = new HashMap<>();
        }

        // 设置流程标题
        if (StringUtils.isNotBlank(title)){
            vars.put("title", title);
        }

        // 提交任务
        taskService.complete(taskId, vars);
    }

    @Override
    public void complete(String taskId){
        // 2.1根据人物ID查询流程实力ID
        Task task = taskService.createTaskQuery()
                .taskId(taskId).singleResult();
        // 获取流程实例ID
        String processInstance = task.getProcessInstanceId();
        // 2.2根据流程实例ID，人物ID，评论的消息，保存教师或者学术对与该学生申请的评论信息
        taskService.addComment(taskId,
                processInstance, "");
        Map<String,Object> vars = new HashMap<>();
        vars.put("pass",  "1" );
        vars.put("title","");
        taskService.complete(taskId,vars);
    }

    /**
     * 启动流程
     * @param procDefKey 流程定义KEY
     * @param businessTable 业务表表名
     * @param businessId	业务表编号
     * @param title			流程标题，显示在待办任务标题
     * @param vars			流程变量
     * @return 流程实例ID
     */
    @Override
    public String startProcess(String procDefKey, String businessTable, String businessId, String title, Map<String, Object> vars) {
        String userId = ShiroUtils.getUser().getUsername();//ObjectUtils.toString(UserUtils.getUser().getId())

        // 用来设置启动流程的人员ID，引擎会自动把用户ID保存到activiti:initiator中
        identityService.setAuthenticatedUserId(userId);

        // 设置流程变量
        if (vars == null){
            vars = new HashMap();
        }

        // 设置流程标题
        if (StringUtils.isNotBlank(title)){
            vars.put("title", title);
        }

        // 启动流程
        ProcessInstance procIns = runtimeService.startProcessInstanceByKey(procDefKey, businessId, vars);

        return null;
    }

    /**
     * 获取流程表单（首先获取任务节点表单KEY，如果没有则取流程开始节点表单KEY）
     * @return
     */
    @Override
    public String getFormKey(String procDefId, String taskDefKey){
        String formKey = "";
        if (StringUtils.isNotBlank(procDefId)){
            if (StringUtils.isNotBlank(taskDefKey)){
                try{
                    formKey = formService.getTaskFormKey(procDefId, taskDefKey);
                }catch (Exception e) {
                    formKey = "";
                }
            }
            if (StringUtils.isBlank(formKey)){
                formKey = formService.getStartFormKey(procDefId);
            }
            if (StringUtils.isBlank(formKey)){
                formKey = "/404";
            }
        }
        return formKey;
    }

    @Override
    public InputStream tracePhoto(String processDefinitionId, String executionId) {
//		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(executionId).singleResult();
        BpmnModel bpmnModel = repositoryService.getBpmnModel(processDefinitionId);

        List<String> activeActivityIds = new ArrayList();
        if (runtimeService.createExecutionQuery().executionId(executionId).count() > 0){
            activeActivityIds = runtimeService.getActiveActivityIds(executionId);
        }

        // 不使用spring请使用下面的两行代码
        // ProcessEngineImpl defaultProcessEngine = (ProcessEngineImpl)ProcessEngines.getDefaultProcessEngine();
        // Context.setProcessEngineConfiguration(defaultProcessEngine.getProcessEngineConfiguration());

        // 使用spring注入引擎请使用下面的这行代码
        Context.setProcessEngineConfiguration(processEngineFactory.getProcessEngineConfiguration());
//		return ProcessDiagramGenerator.generateDiagram(bpmnModel, "png", activeActivityIds);
        return processEngine.getProcessEngineConfiguration().getProcessDiagramGenerator()
                .generateDiagram(bpmnModel, "png", activeActivityIds);
    }
}
