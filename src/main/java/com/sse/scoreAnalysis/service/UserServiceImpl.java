package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.UserMapper;
import com.sse.scoreAnalysis.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    /*
    检验用户登录业务
     */
    public User checkLogin(String userId){
        User user=userMapper.selectByPrimaryKey(userId);
        //如果存在改用户在controller判断密码，从而判断是用户名错误还是密码错误
        if(user!=null){
            return user;
        }
        return null;
    }
}
