package com.bootdo.activiti.service;

import org.activiti.engine.repository.Model;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.List;

/**

 */
@Service
public interface ProcessService {
    Model convertToModel(String procDefId) throws Exception;

    InputStream resourceRead(String id, String resType) throws Exception;

    /**
     * 根据流程实例id查询流转信息
     * @param processInstanceId
     * @return
     */
    List listHisTaskByInstanceId(String processInstanceId);
}
