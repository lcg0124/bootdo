package com.bootdo.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.bootdo.common.dao.DictDao;
import com.bootdo.common.domain.DictDO;
import com.bootdo.common.service.SysDictService;



@Service
public class DictServiceImpl implements SysDictService {
	@Autowired
	private DictDao sysDictMapper;
	
	@Override
	public DictDO get(Long id){
		return sysDictMapper.get(id);
	}
	
	@Override
	public List<DictDO> list(Map<String, Object> map){
		return sysDictMapper.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return sysDictMapper.count(map);
	}
	
	@Override
	public int save(DictDO sysDict){
		return sysDictMapper.save(sysDict);
	}
	
	@Override
	public int update(DictDO sysDict){
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
	
	public List<DictDO> listType(){
		return sysDictMapper.listType();
	};
	
}
