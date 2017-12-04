package com.bootdo.activiti.service;

import org.activiti.engine.repository.Model;
import org.springframework.stereotype.Service;

import java.io.InputStream;

/**

 */
@Service
public interface ProcessService {
    Model convertToModel(String procDefId) throws Exception;

    InputStream resourceRead(String id, String resType) throws Exception;
}
