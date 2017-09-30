package com.bootdo.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.bootdo.common.dao.SysDictMapper;
import com.bootdo.common.domain.SysDictDO;
import com.bootdo.common.service.SysDictService;



@Service
public class SysDictServiceImpl implements SysDictService {
	@Autowired
	private SysDictMapper sysDictMapper;
	
	@Override
	public SysDictDO get(Long id){
		return sysDictMapper.get(id);
	}
	
	@Override
	public List<SysDictDO> list(Map<String, Object> map){
		return sysDictMapper.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return sysDictMapper.count(map);
	}
	
	@Override
	public int save(SysDictDO sysDict){
		return sysDictMapper.save(sysDict);
	}
	
	@Override
	public int update(SysDictDO sysDict){
		return sysDictMapper.update(sysDict);
	}
	
	@Override
	public int remove(Long id){
		return sysDictMapper.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return sysDictMapper.batchRemove(ids);
	}
	
	@Override
	
	public List<SysDictDO> listType(){
		return sysDictMapper.listType();
	};
	
}
