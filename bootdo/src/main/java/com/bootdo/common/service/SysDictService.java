package com.bootdo.common.service;

import com.bootdo.common.domain.SysDictDO;

import java.util.List;
import java.util.Map;

/**
 * 字典表
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-09-29 18:28:07
 */
public interface SysDictService {
	
	SysDictDO get(Long id);
	
	List<SysDictDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(SysDictDO sysDict);
	
	int update(SysDictDO sysDict);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);

	List<SysDictDO> listType();
}
