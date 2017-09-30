package com.bootdo.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bootdo.common.domain.Tree;
import com.bootdo.common.utils.BuildTree;
import com.bootdo.system.dao.SysDeptMapper;
import com.bootdo.system.domain.MenuDO;
import com.bootdo.system.domain.SysDeptDO;
import com.bootdo.system.service.SysDeptService;



@Service
public class SysDeptServiceImpl implements SysDeptService {
	@Autowired
	private SysDeptMapper sysDeptMapper;
	
	@Override
	public SysDeptDO get(Long deptId){
		return sysDeptMapper.get(deptId);
	}
	
	@Override
	public List<SysDeptDO> list(Map<String, Object> map){
		return sysDeptMapper.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return sysDeptMapper.count(map);
	}
	
	@Override
	public int save(SysDeptDO sysDept){
		return sysDeptMapper.save(sysDept);
	}
	
	@Override
	public int update(SysDeptDO sysDept){
		return sysDeptMapper.update(sysDept);
	}
	
	@Override
	public int remove(Long deptId){
		return sysDeptMapper.remove(deptId);
	}
	
	@Override
	public int batchRemove(Long[] deptIds){
		return sysDeptMapper.batchRemove(deptIds);
	}
	
	@Override
	public Tree<SysDeptDO> getTree() {
		List<Tree<SysDeptDO>> trees = new ArrayList<Tree<SysDeptDO>>();
		List<SysDeptDO> SysDepts = sysDeptMapper.list(new HashMap<String,Object>());
		for (SysDeptDO SysDept : SysDepts) {
			Tree<SysDeptDO> tree = new Tree<SysDeptDO>();
			tree.setId(SysDept.getDeptId().toString());
			tree.setParentId(SysDept.getParentId().toString());
			tree.setText(SysDept.getName());
			Map<String, Object> state = new HashMap<>();
			state.put("opened", true);
			tree.setState(state);
			trees.add(tree);
		}
		// 默认顶级菜单为０，根据数据库实际情况调整
		Tree<SysDeptDO> t = BuildTree.build(trees);
		return t;
	}
	
}
