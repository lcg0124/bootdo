package com.bootdo.common.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bootdo.common.dao.DictDao;
import com.bootdo.common.domain.DictDO;
import com.bootdo.common.service.DictService;



@Service
public class DictServiceImpl implements DictService {
	@Autowired
	private DictDao dictDao;
	
	@Override
	public DictDO get(Long id){
		return dictDao.get(id);
	}
	
	@Override
	public List<DictDO> list(Map<String, Object> map){
		return dictDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return dictDao.count(map);
	}
	
	@Override
	public int save(DictDO sysDict){
		return dictDao.save(sysDict);
	}
	
	@Override
	public int update(DictDO sysDict){
		return dictDao.update(sysDict);
	}
	
	@Override
	public int remove(Long id){
		return dictDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return dictDao.batchRemove(ids);
	}
	
	@Override
	
	public List<DictDO> listType(){
		return dictDao.listType();
	}

	@Override
	public String getName(String type, String value) {
		Map<String, Object> param = new HashMap<String, Object>(16);
		param.put("type", type);
		param.put("value", value);
		String rString = dictDao.list(param).get(0).getName();
		return rString;
	};
	
}
