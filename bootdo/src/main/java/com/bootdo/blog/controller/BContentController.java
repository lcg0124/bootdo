package com.bootdo.blog.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bootdo.blog.domain.BCommentsDO;
import com.bootdo.blog.domain.BContentDO;
import com.bootdo.blog.service.BContentService;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;

/**
 * 文章内容
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-09-09 10:03:34
 */
@Controller
@RequestMapping("/blog/bContent")
public class BContentController {
	@Autowired
	private BContentService bContentService;

	@GetMapping()
	//@RequiresPermissions("blog:bContent")
	String BContent() {
		return "blog/bContent/bContent";
	}

	@ResponseBody
	@GetMapping("/list")
//	@RequiresPermissions("blog:list")
	public PageUtils list(@RequestParam Map<String, Object> params) {
		// 查询列表数据
		Query query = new Query(params);

		List<BContentDO> bContentList = bContentService.list(query);
		int total = bContentService.count(query);

		PageUtils pageUtils = new PageUtils(bContentList, total);

		return pageUtils;
	}

	@GetMapping("/add")
	// @RequiresPermissions("blog:bComments")
	String add() {
		return "blog/bContent/add";
	}
	@GetMapping("/edit/{cid}")
	//@RequiresPermissions("blog:bComments")
	String edit(@PathVariable("cid") Long cid,Model model){
		BContentDO bContentDO = bContentService.get(cid);
		model.addAttribute("bContent", bContentDO);
	    return "blog/bContent/edit";
	}

	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	public R save( BContentDO bContent){
		//处理是否允许评论等
		if (bContent.getAllowComment()==null) {
			bContent.setAllowComment(0);
		}
		if (bContent.getAllowFeed()==null) {
			bContent.setAllowFeed(0);
		}
		int count;
		if(bContent.getCid()==null||bContent.getCid().equals("")) {
			count = bContentService.save(bContent);
		}else{
			count = bContentService.update(bContent);
		}
		if(count>0){
			return R.ok().put("cid", bContent.getCid());
		}
		return R.error();
	}
	

	/**
	 * 修改
	 */
	@RequestMapping("/update")
	public R update(@RequestBody BContentDO bContent) {
		bContentService.update(bContent);

		return R.ok();
	}

	/**
	 * 删除
	 */
	@PostMapping("/remove")
	@ResponseBody
	public R remove(Long id) {
		if (bContentService.remove(id) > 0) {
			return R.ok();
		}
		return R.error();
	}

	/**
	 * 删除
	 */
	@PostMapping("/batchRemove")
	@ResponseBody
	public R remove(@RequestParam("ids[]") Long[] cids) {
		bContentService.batchRemove(cids);
		return R.ok();
	}

}
