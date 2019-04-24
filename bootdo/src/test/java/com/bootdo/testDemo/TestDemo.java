package com.bootdo.testDemo;

import com.bootdo.activiti.dao.CustomActivitiesDao;
import com.bootdo.activiti.domain.CustomActivitiesDO;
import net.bytebuddy.asm.Advice;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.RepositoryServiceImpl;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.task.Task;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestDemo {


    @Test
    public void test() {

    }

    @Test
    public void test3() {
    }
}
