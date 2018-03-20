package com.mxt.service;

import com.mxt.dao.UsersMapper;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UsersServiceTest {
    private ApplicationContext applicationContext;
    @Autowired
    private UsersMapper usersMapper;

    @Before
    public void setUp() throws Exception {
        applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");//加载spring配置文件
        usersMapper = applicationContext.getBean(UsersMapper.class);//在这里导入要测试的
    }

    @After
    public void tearDown() throws Exception {

    }
    @Test
    public void getCount() throws Exception {
        int count = usersMapper.getCount();
        System.out.println(count);
    }

}