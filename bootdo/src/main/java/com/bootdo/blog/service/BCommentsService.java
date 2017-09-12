package com.bootdo.blog.service;

import com.bootdo.blog.domain.BCommentsDO;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-09-08 11:18:55
 */
public interface BCommentsService {
	
	BCommentsDO get(Long id);
	
	List<BCommentsDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(BCommentsDO bComments);
	
	int update(BCommentsDO bComments);
	
	int remove(Integer id);
	
	int batchRemove(Integer[] ids);
}
