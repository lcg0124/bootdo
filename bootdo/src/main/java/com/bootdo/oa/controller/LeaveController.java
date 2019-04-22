package com.bootdo.oa.controller;

import java.util.List;
import java.util.Map;

import com.bootdo.activiti.config.ActivitiConstant;
import com.bootdo.common.utils.ShiroUtils;
import org.activiti.engine.HistoryService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bootdo.oa.domain.LeaveDO;
import com.bootdo.oa.service.LeaveService;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;

/**
 * 请假信息
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2019-04-11 11:30:52
 */

@Controller
@RequestMapping("/oa/leave")
public class LeaveController {
    @Autowired
    private LeaveService leaveService;

    @Autowired
    private HistoryService historyService;

    @GetMapping()
    @RequiresPermissions("oa:leave:leave")
    String Leave() {
        return "oa/leave/leaveProcess";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("oa:leave:leave")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        List<LeaveDO> leaveList = leaveService.list(query);
        int total = leaveList.size();
        PageUtils pageUtils = new PageUtils(leaveList, total);
        return pageUtils;
    }
    @ResponseBody
    @GetMapping("/list2")
    @RequiresPermissions("oa:leave:leave")
    public PageUtils list2(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        List<LeaveDO> leaveList = leaveService.list2(query);
        int total = leaveService.count(query);
        PageUtils pageUtils = new PageUtils(leaveList, total);
        return pageUtils;
    }

    /**
     * 在办
     *
     * @return
     */
    @ResponseBody
    @GetMapping("/listCurrentStart")
//	@RequiresPermissions("oa:leave:leave")
    public PageUtils listCurrentStart(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        List<LeaveDO> leaveList = leaveService.list(query);
        int total = leaveService.count(query);
        PageUtils pageUtils = new PageUtils(leaveList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("oa:leave:add")
    String add() {
        return "oa/leave/add";
    }

    @GetMapping("/edit/{id}")
    @RequiresPermissions("oa:leave:edit")
    String edit(@PathVariable("id") String id, Model model) {
        LeaveDO leave = leaveService.get(id);
        model.addAttribute("leave", leave);
        return "oa/leave/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
//    @RequiresPermissions("oa:leave:add")
    public R save(LeaveDO leave) {
        if (leaveService.save(leave) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
//    @RequiresPermissions("oa:leave:edit")
    public R update(LeaveDO leave, String taskId) {
        leaveService.update(leave,  taskId);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("oa:leave:remove")
    public R remove(String id) {
        if (leaveService.remove(id) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("oa:leave:batchRemove")
    public R remove(@RequestParam("ids[]") String[] ids) {
        leaveService.batchRemove(ids);
        return R.ok();
    }

}
