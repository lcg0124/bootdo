package com.bootdo.activiti.controller;

import java.util.List;
import java.util.Map;

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

import com.bootdo.activiti.domain.CustomActivitiesDO;
import com.bootdo.activiti.service.CustomActivitiesService;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;

/**
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2019-04-16 11:59:25
 */

@Controller
@RequestMapping("/activiti/customActivities")
public class CustomActivitiesController {
    @Autowired
    private CustomActivitiesService customActivitiesService;

    @GetMapping()
//	@RequiresPermissions("activiti:customActivities:customActivities")
    String CustomActivities(String processId, Model model) {
        model.addAttribute("processId", processId);
        return "act/customActivities/customActivities";
    }

    @ResponseBody
    @GetMapping("/list")
//	@RequiresPermissions("activiti:customActivities:customActivities")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        List<CustomActivitiesDO> customActivitiesList = customActivitiesService.list(query);
        int total = customActivitiesService.count(query);
        PageUtils pageUtils = new PageUtils(customActivitiesList, total);
        return pageUtils;
    }

    @GetMapping("/add")
//	@RequiresPermissions("activiti:customActivities:add")
    String add() {
        return "act/customActivities/add";
    }

    @GetMapping("/edit/{id}")
//	@RequiresPermissions("activiti:customActivities:edit")
    String edit(@PathVariable("id") Integer id, Model model) {
        CustomActivitiesDO customActivities = customActivitiesService.get(id);
        model.addAttribute("customActivities", customActivities);
        return "act/customActivities/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
//	@RequiresPermissions("activiti:customActivities:add")
    public R save(CustomActivitiesDO customActivities) {
        if (customActivitiesService.save(customActivities) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
//	@RequiresPermissions("activiti:customActivities:edit")
    public R update(CustomActivitiesDO customActivities) {
        customActivitiesService.update(customActivities);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
//	@RequiresPermissions("activiti:customActivities:remove")
    public R remove(Integer id) {
        if (customActivitiesService.remove(id) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
//	@RequiresPermissions("activiti:customActivities:batchRemove")
    public R remove(@RequestParam("ids[]") Integer[] ids) {
        customActivitiesService.batchRemove(ids);
        return R.ok();
    }

}
