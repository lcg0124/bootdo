package com.bootdo.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.bootdo.blog.dao.BContentMapper;
import com.bootdo.blog.domain.BContentDO;
import com.bootdo.blog.service.BContentService;



@Service
public class BContentServiceImpl implements BContentService {
	@Autowired
	private BContentMapper bContentMapper;
	
	@Override
	public BContentDO get(Long cid){
		return bContentMapper.get(cid);
	}
	
	@Override
	public List<BContentDO> list(Map<String, Object> map){
		return bContentMapper.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return bContentMapper.count(map);
	}
	
	@Override
	public int save(BContentDO bContent){
		return bContentMapper.save(bContent);
	}
	
	@Override
	public int update(BContentDO bContent){
		return bContentMapper.update(bContent);
	}
	
	@Override
	public int remove(Long cid){
		return bContentMapper.remove(cid);
	}
	
	@Override
	public int batchRemove(Long[] cids){
		return bContentMapper.batchRemove(cids);
	}
	
}
