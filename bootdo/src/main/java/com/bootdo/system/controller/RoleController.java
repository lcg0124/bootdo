package com.bootdo.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bootdo.common.utils.R;
import com.bootdo.system.domain.RoleDO;
import com.bootdo.system.service.RoleService;

@RequestMapping("/sys/role")
@Controller
public class RoleController {
	String prefix = "sys/role";
	@Autowired
	RoleService roleService;

	@GetMapping()
	String role() {
		return prefix + "/role";
	}

	@GetMapping("/list")
	@ResponseBody()
	List<RoleDO> list() {
		List<RoleDO> roles = roleService.list();
		return roles;
	}

	@GetMapping("/add")
	String add() {
		return prefix + "/add";
	}

	@GetMapping("/edit/{id}")
	String edit(@PathVariable("id") Long id, Model model) {
		RoleDO roleDO = roleService.get(id);
		model.addAttribute("role", roleDO);
		return prefix + "/edit";
	}

	@PostMapping("/save")
	@ResponseBody()
	R save(RoleDO role) {
		if (roleService.save(role) > 0) {
			return R.ok();
		} else {
			return R.error(1, "保存失败");
		}

	}

	@PostMapping("/update")
	@ResponseBody()
	R update(RoleDO role) {
//		if (role.getRoleId()==1) {
//			return R.error(1, "演示系统不允许修改管理员菜单");
//		}
		if (roleService.update(role) > 0) {
			return R.ok();
		} else {
			return R.error(1, "保存失败");
		}

	}

	@PostMapping("/remove")
	@ResponseBody()
	R save(Long id) {
	//	return R.error(1, "演示系统不允许删除");
		if (roleService.remove(id) > 0) {
			return R.ok();
		} else {
			return R.error(1, "删除失败");
		}

	}

}
