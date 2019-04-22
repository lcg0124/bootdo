package com.bootdo.oa.service;

import com.bootdo.oa.domain.LeaveDO;

import java.util.List;
import java.util.Map;

/**
 * 请假信息
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2019-04-11 11:30:52
 */
public interface LeaveService {

    LeaveDO get(String id);

    List<LeaveDO> list(Map<String, Object> map);

    List<LeaveDO> list2(Map<String, Object> map);

    int count(Map<String, Object> map);

    int save(LeaveDO leave);

    int update(LeaveDO leave, String taskId);

    int remove(String id);

    int batchRemove(String[] ids);

    List listCurrentStart();
}
