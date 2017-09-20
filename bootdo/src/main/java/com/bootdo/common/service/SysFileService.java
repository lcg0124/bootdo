package com.bootdo.common.service;

import com.bootdo.common.domain.SysFileDO;

import java.util.List;
import java.util.Map;

/**
 * 文件上传
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-09-19 16:02:20
 */
public interface SysFileService {
	
	SysFileDO get(Long id);
	
	List<SysFileDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(SysFileDO sysFile);
	
	int update(SysFileDO sysFile);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
}
