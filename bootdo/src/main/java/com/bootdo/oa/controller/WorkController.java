package com.bootdo.oa.controller;

import com.bootdo.activiti.config.ActivitiConstant;
import com.bootdo.activiti.utils.ActivitiUtils;
import com.bootdo.common.utils.BDException;
import com.bootdo.common.utils.StringUtils;
import com.bootdo.oa.service.LeaveService;
import com.bootdo.oa.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/oa/work")
public class WorkController {
    @Autowired
    WorkService workService;
    @Autowired
    ActivitiUtils activitiUtils;

    @Autowired
    LeaveService leaveService;

    @GetMapping
    ModelAndView work() {
        return new ModelAndView("oa/work/todoWork");
    }

    @GetMapping("/listTodoWork")
    List listTodoWork() {
        return workService.listTodoWork();
    }

    @GetMapping("/handleWork/" + ActivitiConstant.ACTIVITI_PROCESS_LEAVE + "/{taskKey}")
    ModelAndView handleWork(@PathVariable("taskKey") String taskKey, String taskId, Model model) {
        //获取业务id
        String businessId = activitiUtils.getBusinessKeyByTaskId(taskId);
        if (StringUtils.isBlank(businessId)) {
            throw new BDException("任务没有查询到businessId");
        }
        //请假表单
        switch (taskKey) {
            case ActivitiConstant.ACTIVITI_PROCESS_LEAVE_DIRECT:
                model.addAttribute("leave", leaveService.get(businessId));
                model.addAttribute("taskId", taskId);
                return new ModelAndView("/oa/leave/edit");
            case ActivitiConstant.ACTIVITI_PROCESS_LEAVE_LEADER:
                model.addAttribute("leave", leaveService.get(businessId));
                model.addAttribute("taskId", taskId);
                return new ModelAndView("/oa/leave/edit");
            case ActivitiConstant.ACTIVITI_PROCESS_LEAVE_HR:
                model.addAttribute("leave", leaveService.get(businessId));
                model.addAttribute("taskId", taskId);
                return new ModelAndView("/oa/leave/edit");
            default:
                return new ModelAndView("/404");
        }
    }
}
