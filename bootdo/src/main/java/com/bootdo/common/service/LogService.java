package com.bootdo.common.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bootdo.common.domain.SysLogDO;
import com.bootdo.common.domain.PageDO;
import com.bootdo.common.utils.Query;
@Service
public interface LogService {
	PageDO<SysLogDO> queryList(Query query);
	int remove(Long id);
	int batchRemove(List<Long> ids);
}
