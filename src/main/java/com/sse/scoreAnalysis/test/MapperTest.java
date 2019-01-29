package com.sse.scoreAnalysis.test;



import com.sse.scoreAnalysis.dao.AdministratorMapper;
import com.sse.scoreAnalysis.dao.UserMapper;
import com.sse.scoreAnalysis.model.Administrator;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 测试Dao层
 * spring的项目可以使用spring 的单元测试，自动注入需要的组件
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    UserMapper userMapper;
    @Autowired
    AdministratorMapper administratorMapper;

    @Test
    public void testCRUD(){
        System.out.println(userMapper);
        //1.插入几个教务管理员
        //Administrator administrator=new Administrator("2015212054","123456","邓琪");
        //administratorMapper.insertSelective(administrator);

    }

}
