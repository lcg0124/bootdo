package com.bootdo.system.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.codehaus.groovy.ast.expr.PrefixExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bootdo.common.controller.BaseController;
import com.bootdo.common.domain.Tree;
import com.bootdo.common.utils.R;
import com.bootdo.system.domain.MenuDO;
import com.bootdo.system.service.MenuService;

@RequestMapping("/sys/menu")
@Controller
public class MenuController extends BaseController {
	String prefix = "sys/menu";
	@Autowired
	MenuService menuService;
	
	@GetMapping()
	String menu(Model model) {
		return "sys/menu/menu";
	}

	@RequestMapping("/list")
	@ResponseBody
	List<MenuDO> list() {
		List<MenuDO> menus = menuService.list();
		return menus;
	}

	@GetMapping("/add/{pId}")
	String add(Model model, @PathVariable("pId") Long pId) {
		model.addAttribute("pId", pId);
		if (pId==0) {
			model.addAttribute("pName", "根目录");
		}else {
			model.addAttribute("pName", menuService.get(pId).getName());
		}
		return "sys/menu/add";
	}

	@GetMapping("/edit/{id}")
	String edit(Model model, @PathVariable("id") Long id) {
		model.addAttribute("menu", menuService.get(id));
		return "sys/menu/edit";
	}

	@PostMapping("/remove")
	@ResponseBody
	R remove(Long id) {
		//return R.error(1, "演示系统不允许删除");
		if (menuService.remove(id) > 0) {
			return R.ok();
		} else {
			return R.error(1, "删除失败");
		}
	}

	@PostMapping("/save")
	@ResponseBody
	R save(MenuDO menu) {
		System.out.println("-------"+menu.getType());
		if (menuService.save(menu) > 0) {
			return R.ok();
		} else {
			return R.error(1, "保存失败");
		}
	}

	@PostMapping("/update")
	@ResponseBody
	R update(MenuDO menu) {
		//return R.error(1, "演示系统不允许修改");
		if (menuService.update(menu) > 0) {
			return R.ok();
		} else {
			return R.error(1, "更新失败");
		}
	}

	@GetMapping("/tree")
	@ResponseBody
	Tree<MenuDO> tree() {
		Tree<MenuDO> tree = new Tree<MenuDO>();
		tree = menuService.getTree();
		return tree;
	}

	@GetMapping("/tree/{roleId}")
	@ResponseBody
	Tree<MenuDO> tree(@PathVariable("roleId") Long roleId) {
		Tree<MenuDO> tree = new Tree<MenuDO>();
		tree = menuService.getTree(roleId);
		return tree;
	}
}
