package com.bootdo.system.service;

import com.bootdo.common.domain.Tree;
import com.bootdo.system.domain.SysDeptDO;

import java.util.List;
import java.util.Map;

/**
 * 部门管理
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-09-27 14:28:36
 */
public interface SysDeptService {
	
	SysDeptDO get(Long deptId);
	
	List<SysDeptDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(SysDeptDO sysDept);
	
	int update(SysDeptDO sysDept);
	
	int remove(Long deptId);
	
	int batchRemove(Long[] deptIds);

	Tree<SysDeptDO> getTree();
}
